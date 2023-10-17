import 'dart:async';
import 'dart:io';

import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:collection/collection.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/options.dart';
import 'package:custom_lints_template/src/utils/extensions.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

abstract class OptionsFix extends DartFix with _OptionsMixin {
  @override
  Future<void> startUp(
    CustomLintResolver resolver,
    CustomLintContext context,
  ) async {
    await _setUp(resolver, context);
    await super.startUp(resolver, context);
  }

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) async {
    final (options: options, rawOptions: _) = await this.options;
    if (options.isFileRuleExcluded(resolver.path)) {
      return;
    }
    runWithOptions(resolver, reporter, context, analysisError, others, options);
  }

  /// Emits lints for a given file.
  ///
  /// [runWithOptions] will only be invoked with files respecting [filesToAnalyze]
  void runWithOptions(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
    Options options,
  );
}

abstract class OptionsAssist extends DartAssist with _OptionsMixin {
  @override
  Future<void> startUp(
    CustomLintResolver resolver,
    CustomLintContext context,
    SourceRange target,
  ) async {
    await _setUp(resolver, context);
    await super.startUp(resolver, context, target);
  }

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) async {
    final (options: options, rawOptions: _) = await this.options;
    if (options.isFileRuleExcluded(resolver.path)) {
      return;
    }
    runWithOptions(resolver, reporter, context, target, options);
  }

  /// Emits lints for a given file.
  ///
  /// [runWithOptions] will only be invoked with files respecting [filesToAnalyze]
  void runWithOptions(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
    Options options,
  );
}

abstract class OptionsLintRule extends DartLintRule with _OptionsMixin {
  OptionsLintRule({required super.code});

  @override
  Future<void> startUp(
    CustomLintResolver resolver,
    CustomLintContext context,
  ) async {
    await _setUp(resolver, context);
    await super.startUp(resolver, context);
  }

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final (options: options, rawOptions: rawOptions) = await this.options;
    if (rawOptions.isDisabled(code)) {
      return;
    }

    if (options.isFileRuleExcluded(resolver.path)) {
      return;
    }

    runWithOptions(resolver, reporter, context, options);
  }

  /// Emits lints for a given file.
  ///
  /// [runWithOptions] will only be invoked with files respecting [filesToAnalyze]
  void runWithOptions(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
    Options options,
  );
}

typedef RawOptions = Map<String, dynamic>;

extension _RawOptionsExtension on RawOptions {
  bool isDisabled(LintCode code) => !isEnabled(code);
  bool isEnabled(LintCode code) {
    if (!containsKey('rules')) {
      return false;
    }

    final rules = this['rules'];
    if (rules is List<dynamic>) {
      final rule = rules.firstWhereOrNull((element) {
        if (element is String) {
          return element == code.name;
        } else if (element is Map<String, dynamic>) {
          return element.containsKey(code.name);
        }
        return false;
      });

      if (rule is Map<String, dynamic>) {
        final ruleOptions = rule[code.name];
        if (ruleOptions is List<dynamic>) {
          final ruleOptionMap = ruleOptions.convertToMap();
          if (ruleOptionMap.containsKey('enabled') &&
              ruleOptionMap['enabled'] is bool) {
            return ruleOptionMap['enabled'] as bool;
          }
          return true;
        }
      }

      return rule != null;
    } else if (rules is Map<String, dynamic>) {
      if (!rules.containsKey(code.name)) {
        return false;
      }

      if (rules[code.name] is! Map<String, dynamic>) {
        return true;
      }

      final ruleOptions = rules[code.name] as Map<String, dynamic>;
      if (ruleOptions.containsKey('enabled') &&
          ruleOptions['enabled'] is bool) {
        return ruleOptions['enabled'] as bool;
      }
      return true;
    }

    return false;
  }
}

// Mixin on DartLintRule
mixin _OptionsMixin {
  static Options _options = const Options();
  static RawOptions _rawOptions = Options.fromMap({}).toMap();
  static bool _loaded = false;
  static final Completer<({Options options, RawOptions rawOptions})>
      _completer = Completer<({Options options, RawOptions rawOptions})>();

  Future<({Options options, RawOptions rawOptions})> get options async {
    if (_completer.isCompleted) {
      return (options: _options, rawOptions: _rawOptions);
    }
    return _completer.future;
  }

  Future<void> _setUp(
    CustomLintResolver resolver,
    CustomLintContext context,
  ) async {
    // Only load the options once
    if (_loaded) return;
    _loaded = true;

    final filepath = resolver.path;

    try {
      final rawOptions = await _getLintOptionsMap(dirname(filepath));
      if (rawOptions != null) {
        _options = Options.fromMap(rawOptions);
        _rawOptions = rawOptions;
      }
    } on FileSystemException catch (_) {}
    _completer.complete((options: _options, rawOptions: _rawOptions));
  }
}

Future<RawOptions?> _getLintOptionsMap(String filepath) async {
  final pubspec = Uri.parse(join(filepath, 'pubspec.yaml'));
  final pubspecFile = pubspec.toFile();
  if (pubspecFile.existsSync()) {
    final analysisOptions = pubspec.resolve('analysis_options.yaml');
    final analysisOptionsFile = analysisOptions.toFile();
    if (analysisOptionsFile.existsSync()) {
      final booleanLintsField = await _findLintOptions(analysisOptionsFile);
      if (booleanLintsField != null) {
        return booleanLintsField;
      }
    }

    final booleanLintsField = await _findLintOptions(pubspecFile);
    if (booleanLintsField != null) {
      return booleanLintsField;
    }
  }
  if (dirname(filepath) == filepath) {
    return null;
  }
  return _getLintOptionsMap(dirname(filepath));
}

Future<RawOptions?> _findLintOptions(File file) async {
  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents, sourceUrl: file.uri) as YamlMap;
  final dynamic booleanLintsField = yamlMap['custom_lints_template'];
  if (booleanLintsField is YamlMap) {
    return booleanLintsField.toMap();
  }
  return null;
}

extension _ListToMapExtension on List<dynamic> {
  Map<String, dynamic> convertToMap() {
    return fold<Map<String, dynamic>>({}, (map, item) {
      if (item is String) {
        map[item] = true;
      } else if (item is Map<String, dynamic>) {
        map.addAll(item);
      }
      return map;
    });
  }
}

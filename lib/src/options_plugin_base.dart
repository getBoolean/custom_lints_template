import 'dart:async';
import 'dart:io';

import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
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
    final options = await this.options;
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
    final options = await this.options;
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
    final options = await this.options;
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

// Mixin on DartLintRule
mixin _OptionsMixin {
  static Options _options = const Options();
  static bool _loaded = false;
  static final Completer<Options> _completer = Completer<Options>();

  Future<Options> get options async {
    if (_completer.isCompleted) {
      return _options;
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
      }
    } on FileSystemException catch (_) {}
    _completer.complete(_options);
  }
}

Future<Map<String, dynamic>?> _getLintOptionsMap(String filepath) async {
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

Future<Map<String, dynamic>?> _findLintOptions(File file) async {
  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents, sourceUrl: file.uri) as YamlMap;
  final dynamic booleanLintsField = yamlMap['custom_lints_template'];
  if (booleanLintsField is YamlMap) {
    return booleanLintsField.toMap();
  }
  return null;
}

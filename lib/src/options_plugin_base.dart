import 'dart:async';
import 'dart:io';

import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:collection/collection.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/options.dart';
import 'package:custom_lints_template/src/utils/object_utils.dart';
import 'package:custom_lints_template/src/utils/utils.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

abstract class OptionsFix extends DartFix with _OptionsMixin {
  @override
  Future<void> startUp(
    CustomLintResolver resolver,
    CustomLintContext context,
  ) async {
    _setUp(resolver, context);
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
    final options = _getOptions(resolver.path);
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
    _setUp(resolver, context);
    await super.startUp(resolver, context, target);
  }

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) async {
    final options = _getOptions(resolver.path);
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
    _setUp(resolver, context);
    await super.startUp(resolver, context);
  }

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final options = _getOptions(resolver.path);
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
  /// pubspec/analysis_options paths -> options
  static final Map<String, Options> _options = {};

  Options _getOptions(String path) =>
      _options.entries
          .firstWhereOrNull((entry) => isParent(entry.key, path))
          ?.value ??
      const Options();

  void _setUp(
    CustomLintResolver resolver,
    CustomLintContext context,
  ) {
    final filepath = resolver.path;

    // Only load the options once if possible
    final existingOptionsMap = _options.entries
        .firstWhereOrNull((entry) => isParent(entry.key, filepath));
    if (existingOptionsMap != null) {
      // print('Found options for $filepath in ${existingOptionsMap.key}');
      return;
    }

    // print('Getting options for $filepath');

    final record = _getLintOptionsMap(dirname(filepath));
    if (record != null) {
      final (optionsPath, rawOptions) = record;
      _options.putIfAbsent(optionsPath, () => Options.fromMap(rawOptions));
    } else {
      _options.putIfAbsent(filepath, Options.new);
    }
  }
}

(String, Map<String, dynamic>)? _getLintOptionsMap(String filepath) {
  final pubspec = Uri.parse(join(filepath, 'pubspec.yaml'));
  final pubspecFile = pubspec.toFile();
  if (pubspecFile.existsSync()) {
    final analysisOptions = pubspec.resolve('analysis_options.yaml');
    final analysisOptionsFile = analysisOptions.toFile();
    if (analysisOptionsFile.existsSync()) {
      final lintsField = _findLintOptions(analysisOptionsFile);
      if (lintsField != null) {
        return (filepath, lintsField);
      }
    }

    final lintsField = _findLintOptions(pubspecFile);
    if (lintsField != null) {
      return (filepath, lintsField);
    }
  }
  if (dirname(filepath) == filepath) {
    return null;
  }
  return _getLintOptionsMap(dirname(filepath));
}

Map<String, dynamic>? _findLintOptions(File file) {
  final contents = file.readAsStringSync();
  final yamlMap = loadYaml(contents, sourceUrl: file.uri) as YamlMap;
  final dynamic booleanLintsField = yamlMap['custom_lints_template'];
  if (booleanLintsField is YamlMap) {
    return booleanLintsField.toMap();
  }
  return null;
}

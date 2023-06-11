import 'dart:async';
import 'dart:io';

import 'package:analyzer/source/source_range.dart';
import 'package:boolean_lints/src/options.dart';
import 'package:boolean_lints/src/utils/object_utils.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
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
      final lintOptionsMap = await _getLintOptionsMap(dirname(filepath));
      if (lintOptionsMap != null) {
        _options = Options.fromMap(lintOptionsMap);
      }
      _completer.complete(_options);
    } on FileSystemException catch (_) {
      _completer.complete(const Options());
    }
  }
}

Future<Map<String, dynamic>?> _getLintOptionsMap(String filepath) async {
  final pubspec = Uri.parse(join(filepath, 'pubspec.yaml'));
  final pubspecFile = File.fromUri(pubspec);
  if (pubspecFile.existsSync()) {
    final analysisOptions = pubspec.resolve('analysis_options.yaml');
    final analysisOptionsFile = File.fromUri(analysisOptions);
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
  final booleanLintsField = yamlMap['boolean_lints'];
  if (booleanLintsField is YamlMap) {
    return booleanLintsField.toMap();
  }
  return null;
}

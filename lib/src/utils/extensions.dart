import 'dart:io';

import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/utils/utils.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

/// Source: https://github.com/rrousselGit/riverpod/blob/master/packages/riverpod_lint/lib/src/object_utils.dart
extension ObjectUtils<T> on T? {
  R? safeCast<R>() {
    final that = this;
    if (that is R) return that;
    return null;
  }

  R? let<R>(R Function(T)? cb) {
    final that = this;
    if (that == null) return null;
    return cb?.call(that);
  }
}

extension StringExtension on List<String> {
  List<RegExp> toRegExpList() => map(RegExp.new).toList();
}

extension RegexExtension on List<RegExp> {
  bool has(String filepath) => any((path) => filepath.contains(path));
}

/// Source: https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/blob/master/lib/src/extensions/yaml_extensions.dart
extension YamlMapConverter on YamlMap {
  dynamic _convertNode(dynamic v) {
    if (v is YamlMap) {
      return v.toMap();
    } else if (v is YamlList) {
      final list = <dynamic>[];
      for (final e in v) {
        list.add(_convertNode(e));
      }
      return list;
    } else {
      return v;
    }
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    nodes.forEach((k, v) =>
        map[(k as YamlScalar).value.toString()] = _convertNode(v.value));
    return map;
  }
}

extension LintCodeCopyWith on LintCode {
  LintCode copyWith({
    String? name,
    String? problemMessage,
    String? correctionMessage,
    String? uniqueName,
    String? url,
    ErrorSeverity? errorSeverity,
  }) =>
      LintCode(
        name: name ?? this.name,
        problemMessage: problemMessage ?? this.problemMessage,
        correctionMessage: correctionMessage ?? this.correctionMessage,
        uniqueName: uniqueName ?? this.uniqueName,
        url: url ?? this.url,
        errorSeverity: errorSeverity ?? this.errorSeverity,
      );
}

/// Source: https://github.com/rrousselGit/riverpod/blob/master/packages/riverpod_lint/lib/src/riverpod_custom_lint.dart
extension CaseChangeExtension on String {
  String get titled {
    return replaceFirstMapped(
      RegExp('[a-zA-Z]'),
      (match) => match.group(0)!.toUpperCase(),
    );
  }

  String get lowerFirst {
    return replaceFirstMapped(
      RegExp('[a-zA-Z]'),
      (match) => match.group(0)!.toLowerCase(),
    );
  }

  String get public {
    if (startsWith('_')) return substring(1);
    return this;
  }
}

extension CustomLintContextExtension on CustomLintContext {
  bool get isDart3 {
    final sdk = pubspec.environment?['sdk'];
    if (sdk == null || !VersionConstraint.parse('^3.0.0').allowsAll(sdk)) {
      return false;
    }
    return true;
  }

  bool get isNotDart3 => !isDart3;
}

extension UriToFileExtension on Uri {
  File toFile() => File(p.fromUri('file:///$this'));
}

extension PathResolverExtension on CustomLintResolver {
  String get normlizedPath => normalizePath(path);
}

import 'package:analyzer/error/error.dart';
import 'package:boolean_lints/src/options/rules.dart';
import 'package:boolean_lints/src/utils/object_utils.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'options.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Options with OptionsMappable {
  const Options({
    this.rules = const RulesOption(),
    this.rulesExclude = const [],
  });

  final RulesOption rules;
  final List<String> rulesExclude;

  static const fromJson = OptionsMapper.fromJson;
  static const fromMap = OptionsMapper.fromMap;
}

extension OptionsExtension on Options {
  bool isFileRuleExcluded(String path) {
    return rulesExclude.toRegExpList().has(path);
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

mixin OptionsMixin {
  List<String> get exclude;
  List<String> get include;

  bool isFileNotExcluded(String path) {
    return !isFileExcluded(path);
  }

  bool isFileExcluded(String path) {
    return exclude.toRegExpList().has(path);
  }

  bool isFileNotIncluded(String path) {
    return !isFileIncluded(path);
  }

  bool isFileIncluded(String path) {
    return include.toRegExpList().has(path);
  }

  bool get isIncludeOnly => include.isNotEmpty;

  bool shouldSkipFile(String path) {
    if (isIncludeOnly) {
      return isFileNotIncluded(path) || isFileExcluded(path);
    }

    return isFileExcluded(path);
  }
}

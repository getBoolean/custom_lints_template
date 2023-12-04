import 'package:custom_lints_template/src/options/rules.dart';
import 'package:custom_lints_template/src/utils/extensions.dart';
import 'package:custom_lints_template/src/utils/utils.dart';
import 'package:dart_mappable/dart_mappable.dart';

export 'utils/extensions.dart';

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
    final pathNormalized = normalizePath(path);
    final hasMatch = rulesExclude
        .toRegExpList()
        .any((regex) => regex.hasMatch(pathNormalized));
    return hasMatch;
  }
}

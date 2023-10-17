import 'package:custom_lints_template/src/options/avoid_hardcoded_strings.dart';
import 'package:custom_lints_template/src/options/custom_lint_example.dart';
import 'package:custom_lints_template/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'rules.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class RulesOption with RulesOptionMappable {
  const RulesOption({
    this.avoidHardcodedStrings = const AvoidHardcodedStringsOption(),
    this.customLintExample = const CustomLintExampleOption(),
  });
  final AvoidHardcodedStringsOption avoidHardcodedStrings;
  final CustomLintExampleOption customLintExample;

  static const fromJson = RulesOptionMapper.fromJson;
  static const fromMap = RulesOptionMapper.fromMap;
}

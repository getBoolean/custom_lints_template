import 'package:custom_lints_template/src/options/avoid_hardcoded_strings.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'rules.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class RulesOption with RulesOptionMappable {
  const RulesOption({
    this.avoidHardcodedStrings = const AvoidHardcodedStringsOption(),
  });
  final AvoidHardcodedStringsOption avoidHardcodedStrings;

  static const fromJson = RulesOptionMapper.fromJson;
  static const fromMap = RulesOptionMapper.fromMap;
}

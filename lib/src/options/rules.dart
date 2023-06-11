import 'package:dart_mappable/dart_mappable.dart';

part 'rules.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class RulesOption with RulesOptionMappable {
  const RulesOption({this.entries = const []});
  final List<String> entries;

  static const fromJson = RulesOptionMapper.fromJson;
  static const fromMap = RulesOptionMapper.fromMap;
}

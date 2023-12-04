import 'package:analyzer/error/error.dart';
import 'package:custom_lints_template/src/options/hooks/error_severity_hook.dart';
import 'package:custom_lints_template/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'avoid_hardcoded_strings.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class AvoidHardcodedStringsOption with AvoidHardcodedStringsOptionMappable {
  const AvoidHardcodedStringsOption({
    this.minimumLength = 0,
    this.exclude = const [],
    this.include = const [],
    this.severity,
  });
  final int minimumLength;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;
  final List<String> exclude;
  final List<String> include;

  static const fromJson = AvoidHardcodedStringsOptionMapper.fromJson;
  static const fromMap = AvoidHardcodedStringsOptionMapper.fromMap;
}

import 'package:analyzer/error/error.dart';
import 'package:custom_lints_template/src/options.dart';
import 'package:custom_lints_template/src/options/hooks/error_severity_hook.dart';
import 'package:custom_lints_template/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'avoid_hardcoded_strings.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class AvoidHardcodedStringsOption
    with AvoidHardcodedStringsOptionMappable, OptionsMixin {
  const AvoidHardcodedStringsOption({
    this.minimumLength = 0,
    this.exclude = const [],
    this.include = const [],
    this.severity = ErrorSeverity.INFO,
  });
  final int minimumLength;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity severity;
  @override
  final List<String> exclude;
  @override
  final List<String> include;

  static const fromJson = AvoidHardcodedStringsOptionMapper.fromJson;
  static const fromMap = AvoidHardcodedStringsOptionMapper.fromMap;
}

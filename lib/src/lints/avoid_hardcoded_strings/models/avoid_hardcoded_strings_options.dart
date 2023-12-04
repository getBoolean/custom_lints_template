import 'package:analyzer/error/error.dart';
import 'package:custom_lints_template/src/models/hooks/error_severity_hook.dart';
import 'package:custom_lints_template/src/models/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'avoid_hardcoded_strings_options.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class AvoidHardcodedStringsOptions with AvoidHardcodedStringsOptionsMappable {
  const AvoidHardcodedStringsOptions({
    this.minimumLength = 0,
    this.excludes = const [],
    this.includes = const [],
    this.severity,
  });

  final int minimumLength;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;
  final List<String> excludes;
  final List<String> includes;

  static const fromJson = AvoidHardcodedStringsOptionsMapper.fromJson;
  static const fromMap = AvoidHardcodedStringsOptionsMapper.fromMap;
}

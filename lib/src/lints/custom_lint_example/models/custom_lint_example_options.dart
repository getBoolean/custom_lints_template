import 'package:analyzer/error/error.dart';
import 'package:custom_lints_template/src/models/excludable.dart';
import 'package:custom_lints_template/src/models/hooks/error_severity_hook.dart';
import 'package:custom_lints_template/src/models/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'custom_lint_example_options.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class CustomLintExampleOptions extends Excludable
    with CustomLintExampleOptionsMappable {
  const CustomLintExampleOptions({
    this.severity,
    this.includes = const [],
    this.excludes = const [],
  });

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;

  static const fromJson = CustomLintExampleOptionsMapper.fromJson;
  static const fromMap = CustomLintExampleOptionsMapper.fromMap;
  @override
  final List<String> includes;
  @override
  final List<String> excludes;
}

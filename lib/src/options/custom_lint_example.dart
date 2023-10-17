import 'package:analyzer/error/error.dart';
import 'package:custom_lints_template/src/options.dart';
import 'package:custom_lints_template/src/options/hooks/error_severity_hook.dart';
import 'package:custom_lints_template/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'custom_lint_example.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class CustomLintExampleOption
    with CustomLintExampleOptionMappable, OptionsMixin {
  const CustomLintExampleOption({
    this.exclude = const [],
    this.include = const [],
    this.severity = ErrorSeverity.WARNING,
  });

  @override
  final List<String> exclude;

  @override
  final List<String> include;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity severity;

  static const fromJson = CustomLintExampleOptionMapper.fromJson;
  static const fromMap = CustomLintExampleOptionMapper.fromMap;
}

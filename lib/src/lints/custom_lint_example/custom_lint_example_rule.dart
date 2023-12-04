import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/custom_lint_example/fixes/custom_lint_example_fix.dart';
import 'package:custom_lints_template/src/lints/custom_lint_example/models/custom_lint_example_options.dart';
import 'package:custom_lints_template/src/models/options_lint_rule.dart';
import 'package:custom_lints_template/src/models/rule_config.dart';
import 'package:custom_lints_template/src/utils/extensions.dart';

class CustomLintExampleRule extends OptionsLintRule<CustomLintExampleOptions> {
  /// Creates a new instance of [OptionsLintRule]
  /// based on the lint configuration.
  CustomLintExampleRule(
    CustomLintConfigs configs,
  ) : super(RuleConfig(
          configs: configs,
          name: lintName,
          paramsParser: CustomLintExampleOptions.fromMap,
          problemMessage: (_) => 'This is the description of our custom lint',
        ));

  /// The [LintCode] of this lint rule
  static const String lintName = 'custom_lint_example';

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final severity = config.parameters.severity;
    final code = this.code.copyWith(errorSeverity: severity);
    context.registry.addVariableDeclaration((node) {
      // TODO: Check if the error should be reported
      reporter.reportErrorForNode(code, node);
    });
  }

  @override
  List<Fix> getFixes() => [CustomLintExampleFix(config)];
}

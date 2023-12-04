import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/fixes/fix_example.dart';
import 'package:custom_lints_template/src/models/options_lint_rule.dart';
import 'package:custom_lints_template/src/models/rule_config.dart';
import 'package:custom_lints_template/src/options/custom_lint_example.dart';
import 'package:custom_lints_template/src/utils/extensions.dart';
import 'package:custom_lints_template/src/utils/path_utils.dart';

class CustomLintExampleRule extends OptionsLintRule<CustomLintExampleOption> {
  /// Creates a new instance of [OptionsLintRule]
  /// based on the lint configuration.
  CustomLintExampleRule(
    CustomLintConfigs configs,
  ) : super(RuleConfig(
          configs: configs,
          name: lintName,
          paramsParser: CustomLintExampleOption.fromMap,
          problemMessage: (_) =>
              'Avoid hardcoding strings. Use a localization package or append ".hardcoded" to the string to suppress this message.',
        ));

  /// The [LintCode] of this lint rule that represents
  /// the error whether we use bad formatted double literals.
  static const String lintName = 'avoid_hardcoded_strings';

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final parameters = config.parameters;
    if (shouldSkipFile(
      includeGlobs: parameters.include,
      excludeGlobs: parameters.exclude,
      path: resolver.path,
    )) {
      return;
    }

    final severity = parameters.severity;
    final code = this.code.copyWith(errorSeverity: severity);
    context.registry.addVariableDeclaration((node) {
      // TODO: Check if the error should be reported
      reporter.reportErrorForNode(code, node);
    });
  }

  @override
  List<Fix> getFixes() => [FixExampleFix(config)];
}

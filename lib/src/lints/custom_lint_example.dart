import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/lints/fixes/fix_example.dart';
import 'package:boolean_lints/src/options.dart';
import 'package:boolean_lints/src/options_plugin_base.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class CustomLintExampleRule extends OptionsLintRule {
  CustomLintExampleRule() : super(code: _code);

  static const _code = LintCode(
    name: 'custom_lint_example',
    problemMessage: 'This is the description of our custom lint',
  );

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final options = await this.options;
    if (options.isFileRuleExcluded(resolver.path)) return;
    context.registry.addVariableDeclaration((node) {
      // TODO: Check if the error should be reported
      reporter.reportErrorForNode(code, node);
    });
  }

  @override
  List<Fix> getFixes() => [FixExampleFix()];
}

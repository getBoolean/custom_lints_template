import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/custom_lint_example/models/custom_lint_example_options.dart';
import 'package:custom_lints_template/src/models/options_fix.dart';

class CustomLintExampleFix extends OptionsFix<CustomLintExampleOptions> {
  CustomLintExampleFix(super.config);
  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) async {
    context.registry.addMethodInvocation((node) {
      // The method is not impacted by this analysis error
      if (!node.sourceRange.intersects(analysisError.sourceRange)) return;

      final changeBuilder = reporter.createChangeBuilder(
        message: 'Add Widget Here',
        priority: 80,
      );

      changeBuilder.addDartFileEdit((builder) {
        // TODO: <implement change to refactor the code>
      });
    });
  }
}

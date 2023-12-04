import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/models/options_fix.dart';

class FixExampleFix extends OptionsFix {
  FixExampleFix(super.config);
  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) async {
    context.registry.addMethodInvocation((node) {
      // The method is not impacte by this analysis error
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
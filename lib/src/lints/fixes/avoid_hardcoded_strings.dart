import 'package:analyzer/error/error.dart';
import 'package:boolean_lints/src/options_plugin_base.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidHardcodedStringsFix extends OptionsFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
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

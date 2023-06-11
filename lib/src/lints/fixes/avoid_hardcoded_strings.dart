import 'package:analyzer/error/error.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/options.dart';
import 'package:custom_lints_template/src/options_plugin_base.dart';

class AvoidHardcodedStringsFix extends OptionsFix {
  @override
  Future<void> runWithOptions(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
    Options options,
  ) async {
    context.registry.addSimpleStringLiteral((node) {
      // The method is not impacted by this analysis error
      if (!node.sourceRange.intersects(analysisError.sourceRange)) return;

      final changeBuilder = reporter.createChangeBuilder(
        message: 'Append ".hardcoded"',
        priority: 80,
      );

      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleInsertion(node.end, '.hardcoded');
      });
    });

    context.registry.addInterpolationString((node) {
      // The method is not impacted by this analysis error
      if (!node.sourceRange.intersects(analysisError.sourceRange)) return;

      final changeBuilder = reporter.createChangeBuilder(
        message: 'Append ".hardcoded"',
        priority: 80,
      );

      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleInsertion(node.parent?.end ?? node.end, '.hardcoded');
      });
    });
  }
}

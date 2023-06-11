import 'package:analyzer/source/source_range.dart';
import 'package:boolean_lints/src/options_plugin_base.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class CustomAssistExampleAssist extends OptionsAssist {
  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) async {
    // Check options for configuring the assist
    // ignore: unused_local_variable
    final options = await this.options;
    context.registry.addVariableDeclaration((node) {
      // Check that the visited node is under the cursor
      if (!target.intersects(node.sourceRange)) return;

      final changeBuilder = reporter.createChangeBuilder(
        priority: 1,
        message: 'Custom fix for code',
      );
      changeBuilder.addDartFileEdit((builder) {
        // TODO: <implement change to refactor the code>
      });
    });
  }
}

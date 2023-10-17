import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/fixes/avoid_hardcoded_strings.dart';
import 'package:custom_lints_template/src/options.dart';
import 'package:custom_lints_template/src/options_plugin_base.dart';

class AvoidHardcodedStringsRule extends OptionsLintRule {
  AvoidHardcodedStringsRule() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_hardcoded_strings',
    problemMessage:
        'Avoid hardcoding strings. Use a localization package or append ".hardcoded" to the string to suppress this message.',
  );

  @override
  Future<void> runWithOptions(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
    Options options,
  ) async {
    if (options.rules.avoidHardcodedStrings.shouldSkipFile(resolver.path)) {
      return;
    }

    final minimumLength = options.rules.avoidHardcodedStrings.minimumLength;
    final severity = options.rules.avoidHardcodedStrings.severity;
    final code = this.code.copyWith(errorSeverity: severity);

    context.registry.addSimpleStringLiteral((node) {
      if (node.value.length <= minimumLength) {
        return;
      }

      // ignore import statements
      if (node.parent?.toSource().startsWith('import') ?? false) {
        return;
      }

      // ignore if ".hardcoded" is appended after the string
      if (node.parent?.toSource().endsWith('.hardcoded') ?? false) {
        return;
      }
      reporter.reportErrorForNode(code, node);
    });

    context.registry.addInterpolationString((node) {
      if (node.value.length <= minimumLength) {
        return;
      }

      // ignore if ".hardcoded" is appended after the string
      if (node.parent?.parent?.toSource().endsWith('.hardcoded') ?? false) {
        return;
      }
      reporter.reportErrorForNode(code, node.parent ?? node);
    });
  }

  @override
  List<Fix> getFixes() => [
        AvoidHardcodedStringsFix(),
      ];
}

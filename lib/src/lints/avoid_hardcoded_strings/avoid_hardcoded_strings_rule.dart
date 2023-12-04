import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/avoid_hardcoded_strings/fixes/avoid_hardcoded_strings_fix.dart';
import 'package:custom_lints_template/src/lints/avoid_hardcoded_strings/models/avoid_hardcoded_strings.dart';
import 'package:custom_lints_template/src/models/options_lint_rule.dart';
import 'package:custom_lints_template/src/models/rule_config.dart';
import 'package:custom_lints_template/src/utils/extensions.dart';
import 'package:custom_lints_template/src/utils/path_utils.dart';

class AvoidHardcodedStringsRule
    extends OptionsLintRule<AvoidHardcodedStringsOption> {
  /// Creates a new instance of [AvoidHardcodedStringsRule]
  /// based on the lint configuration.
  AvoidHardcodedStringsRule(
    CustomLintConfigs configs,
  ) : super(RuleConfig(
          configs: configs,
          name: lintName,
          paramsParser: AvoidHardcodedStringsOption.fromMap,
          problemMessage: (_) =>
              'Avoid hardcoding strings. Use a localization package or append ".hardcoded" to the string to suppress this message.',
        ));

  /// The [LintCode] of this lint rule
  static const String lintName = 'avoid_hardcoded_strings';

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final rootPath = (await resolver.getResolvedUnitResult())
        .session
        .analysisContext
        .contextRoot
        .root
        .path;

    final parameters = config.parameters;
    if (shouldSkipFile(
      includeGlobs: parameters.includes,
      excludeGlobs: parameters.excludes,
      path: resolver.path,
      rootPath: rootPath,
    )) {
      return;
    }

    final minimumLength = parameters.minimumLength;
    final severity = parameters.severity;
    final code = this.code.copyWith(
          errorSeverity: severity ?? this.code.errorSeverity,
        );

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
        AvoidHardcodedStringsFix(config),
      ];
}

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/avoid_hardcoded_strings/avoid_hardcoded_strings_rule.dart';

PluginBase createPlugin() => _CustomLintTemplatePlugin();

class _CustomLintTemplatePlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        AvoidHardcodedStringsRule(configs),
      ];

  @override
  List<Assist> getAssists() => [];
}

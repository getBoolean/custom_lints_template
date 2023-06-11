import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/lints/avoid_hardcoded_strings.dart';

PluginBase createPlugin() => _BooleanPlugin();

class _BooleanPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        AvoidHardcodedStringsRule(),
      ];

  @override
  List<Assist> getAssists() => [];
}

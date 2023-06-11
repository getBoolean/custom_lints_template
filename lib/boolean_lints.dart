import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _BooleanPlugin();

class _BooleanPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [];

  @override
  List<Assist> getAssists() => [];
}

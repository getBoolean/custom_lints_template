<!-- omit from toc -->
# Custom Lints Template

`custom_lints_template` is a developer tool, designed to help stop common issue and simplify repetetive tasks. It adds various warnings with quick fixes and refactoring options.

## Template Usage Checklist

1. [ ] Replace all usages of `custom_lints_template` with your package name.
2. [ ] Rename [custom_lints_template.dart](lib/custom_lints_template.dart) to `<package-name>.dart`.
3. [ ] Update [pubspec.yaml](./pubspec.yaml) with your package repository and issues links.
4. [ ] Read the [Contributing Guide](#contributing-guide).
5. [ ] Delete this section from the README.

## Table of Contents

- [Template Usage Checklist](#template-usage-checklist)
- [Table of Contents](#table-of-contents)
- [Usage](#usage)
  - [Installing custom\_lints\_template](#installing-custom_lints_template)
  - [Enabling/disabling lints](#enablingdisabling-lints)
  - [Disable one specific rule](#disable-one-specific-rule)
  - [Disable all lints by default](#disable-all-lints-by-default)
  - [Configuring Lints](#configuring-lints)
  - [Running custom\_lints\_template in the terminal/CI](#running-custom_lints_template-in-the-terminalci)
- [All Lint Rules](#all-lint-rules)
- [Contributing Guide](#contributing-guide)
  - [Creating Lints](#creating-lints)
  - [Creating Assists](#creating-assists)
  - [Debugging/Testing](#debuggingtesting)
- [Resources](#resources)

## Usage

### Installing custom_lints_template

`custom_lints_template` is implemented using [custom_lint](https://pub.dev/packages/custom_lint). As such, it uses `custom_lint`'s installation logic.  
Long story short:

- Add both `custom_lints_template` and `custom_lint` to your `pubspec.yaml`:

  ```yaml
  dev_dependencies:
    custom_lint:
    custom_lints_template:
  ```

- Enable `custom_lint`'s plugin in your `analysis_options.yaml`:

  ```yaml
  analyzer:
    plugins:
      - custom_lint
  ```

### Enabling/disabling lints

By default when installing `custom_lints_template`, most of the lints will be enabled.
To change this, you have a few options.

### Disable one specific rule

You may dislike one of the various lint rules offered by `custom_lints_template`.
In that event, you can explicitly disable this lint rule for your project
by modifying the `analysis_options.yaml`

```yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  rules:
    # Explicitly disable one lint rule
    - avoid_hardcoded_strings: false

custom_lints_template:
  rules:
    avoid_hardcoded_strings:
      minimum_length: 3
      severity: warning
```

Note that you can both enable and disable lint rules at once.
This can be useful if your `analysis_options.yaml` includes another one:

```yaml
include: path/to/another/analysis_options.yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  rules:
    # Enable one rule
    - avoid_hardcoded_strings
    # Disable another
    - custom_lint_example: false

custom_lints_template:
  rules:
    avoid_hardcoded_strings:
      minimum_length: 3
      severity: warning
```

### Disable all lints by default

Instead of having all lints on by default and manually disabling lints of your choice,
you can switch to the opposite logic:  
Have lints off by default, and manually enable lints.

This can be done in your `analysis_options.yaml` with the following:

```yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  # Forcibly disable lint rules by default
  enable_all_lint_rules: false
  rules:
    # You can now enable one specific rule in the "rules" list
    - avoid_hardcoded_strings

custom_lints_template:
  rules:
    avoid_hardcoded_strings:
      minimum_length: 3
      severity: warning
```

### Configuring Lints

Some of the lints have configurations. These can be specified in the `analysis_options.yaml`
or the `pubspec.yaml` file under the top level key `custom_lints_template:`.

All lints have the following options:

- `severity`: This can be set to `none`, `info`, `warning` or `error`.
- `include`: Only lint files matching these regular expressions.
- `exclude`: Skip linting files matching these regular expressions.

```yaml
custom_lints_template:
  rules_exclude:
    - "test/.*\\.dart"
  rules:
    example_lint_code:
      severity: info
      include:
        - "lib/.*\\.dart"
      exclude:
        - "lib/.*_temp\\.dart"
```

### Running custom_lints_template in the terminal/CI

Custom lint rules created by custom_lints_template may not show-up in `dart analyze`.
To fix this, you can run a custom command line: `custom_lint`.

Since your project should already have custom_lint installed
(cf [installing custom_lints_template](#installing-custom_lints_template)), then you should be
able to run:

```sh
dart run custom_lint
```

Alternatively, you can globally install `custom_lint`:

```sh
# Install custom_lint for all projects
dart pub global activate custom_lint
# run custom_lint's command line in a project
dart run custom_lint
```

## All Lint Rules

Most lints have configuration options. These can be specified in the `analysis_options.yaml` or the `pubspec.yaml`.
See [LINTS.md](docs/LINTS.md) for a list of implemented lint rules and their configuration options.

## Contributing Guide

### Creating Lints

1. Create a new file with the lint name in [lib/src/lints](lib/src/lints),
type `lint` and use snippet to generate the boilerplate code.
1. Add the lint logic to the `OptionsLintRule.run` method.
1. (Optional) Adding a fix for the lint
    1. Create a fix file in the [lib/src/lints/fixes](lib/src/lints/fixes), type `fix` and
    use the snippet to generate the boilerplate code.
    1. Add it to the lint's `OptionsLintRule.getFixes` method.
1. Add the lint to the [lib/lints.dart](lib/lints.dart) `getAllLints` method. Type
`fix` and use the lint to generate the boilerplate code.
1. (Optional) Adding configuration options. These options are available with the `options` getter in the `OptionsLintRule`
and `OptionsAssist` classes.
    1. Create a new file for each key in [lib/src/options/](lib/src/options/),
    type `options` and use the snippet to generate the boilerplate code.
    1. Add the mixin `OptionsMixin` to the option class and add fields `List<String> excludes`
    and `List<String> includes` to add rule path configuration.
        - In your lint classes, use `options.rules.lintName.shouldSkipFile` to skip excluded/non-included files.
        - Also use `options.isFileRuleExcluded` to skip excluded files that were excluded from all lints.
    1. Add the new options class to the [lib/src/options/rules.dart](lib/src/options/rules.dart)
    constructor with named parameters.
    1. Run `dart pub run build_runner build` to generate the new [dart_mappable](https://pub.dev/packages/dart_mappable) classes.
1. Update [LINTS.md](docs/LINTS.md) with the new lint and configuration options.

### Creating Assists

1. Create a new file with the lint name in [lib/src/assists](lib/src/assists),
type `assist` and use snippet to generate the boilerplate code.
2. Add the assist to the [lib/lints.dart](lib/lints.dart) `getAllAssists` method.
3. (Optional) Adding configuration options. Follow [Creating Lints Step 3](#creating-lints).

### Debugging/Testing

Follow the [custom_lint debugging/testing docs](https://pub.dev/packages/custom_lint#using-the-dart-debugger).

## Resources

- [Example lints](https://github.com/invertase/dart_custom_lint/blob/main/packages/custom_lint/example/example_lint/lib/custom_lint_example_lint.dart)
- [Riverpod Lint](https://github.com/rrousselGit/riverpod/tree/master/packages/riverpod_lint)

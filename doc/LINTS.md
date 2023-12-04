<!-- omit from toc -->
# All Lint Rules

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Configuring Lints](#configuring-lints)
- [Dart](#dart)
  - [avoid\_hardcoded\_strings](#avoid_hardcoded_strings)

## Configuring Lints

Some lints have configuration options available, these can be specified in the `analysis_options.yaml`
or the `pubspec.yaml` file, an example is shown below. Each lint may also have additional options
available that are covered in their respective sections below.

```yaml
custom_lint:
  rules:
    - avoid_hardcoded_strings:
      severity: info
```

## Dart

### avoid_hardcoded_strings

> **info * 🛠**

Info. Avoid hardcoding strings. Use a localization package or append ".hardcoded" to the string to suppress this message.
This lint is designed for `flutter_localizations` from the Flutter SDK.

- `minimum_length`: The minimum length of a string to be considered for this lint.
- `include`: Only lint files matching these glob expressions.
- `exclude`: Skip linting files matching these glob expressions.
- `severity`: This can be set to `none`, `info`, `warning` or `error`.

```yaml
custom_lints_template:
  rules:
    - avoid_hardcoded_strings:
      minimum_length: 0
      severity: info
      include:
        - "lib/*.dart"
      exclude:
        - "lib/*_temp.dart"
```

**Good**:

```dart
final title = AppLocalizations.of(context).appTitle;
// .hardcoded extension not included, see example for source
final title = 'My App'.hardcoded;
```

**Bad**:

```dart
final title = 'My App'; // LINT
```

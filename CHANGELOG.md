## 2.0.0

- **Breaking:** Migrated to new options format, options are now defined under the `custom_lint` key.
- **Breaking:** Removed `custom_lints_template.rules_exclude` option as it is redundant with the analyzer's
  exclude option.
- Raised minimum Dart SDK version to `3.2.0`.

Before:

```yaml
custom_lint:
  rules:
    - avoid_hardcoded_strings:

custom_lints_template:
  rules:
    banned_code:
      severity: info
      include:
        - "lib/.*\\.dart"
      exclude:
        - "lib/.*_temp\\.dart"
```

After:

```yaml
custom_lint:
  rules:
    - avoid_hardcoded_strings:
      severity: info
      include:
        - "lib/**.dart"
      exclude:
        - "lib/**_temp.dart"
```

## 1.0.0

- Initial version.

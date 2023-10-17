// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'custom_lint_example.dart';

class CustomLintExampleOptionMapper
    extends ClassMapperBase<CustomLintExampleOption> {
  CustomLintExampleOptionMapper._();

  static CustomLintExampleOptionMapper? _instance;
  static CustomLintExampleOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CustomLintExampleOptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomLintExampleOption';

  static List<String> _$exclude(CustomLintExampleOption v) => v.exclude;
  static const Field<CustomLintExampleOption, List<String>> _f$exclude =
      Field('exclude', _$exclude, opt: true, def: const []);
  static List<String> _$include(CustomLintExampleOption v) => v.include;
  static const Field<CustomLintExampleOption, List<String>> _f$include =
      Field('include', _$include, opt: true, def: const []);
  static ErrorSeverity _$severity(CustomLintExampleOption v) => v.severity;
  static const Field<CustomLintExampleOption, ErrorSeverity> _f$severity =
      Field('severity', _$severity,
          opt: true, def: ErrorSeverity.WARNING, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<CustomLintExampleOption, dynamic>> fields = const {
    #exclude: _f$exclude,
    #include: _f$include,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static CustomLintExampleOption _instantiate(DecodingData data) {
    return CustomLintExampleOption(
        exclude: data.dec(_f$exclude),
        include: data.dec(_f$include),
        severity: data.dec(_f$severity));
  }

  @override
  final Function instantiate = _instantiate;

  static CustomLintExampleOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomLintExampleOption>(map);
  }

  static CustomLintExampleOption fromJson(String json) {
    return ensureInitialized().decodeJson<CustomLintExampleOption>(json);
  }
}

mixin CustomLintExampleOptionMappable {
  String toJson() {
    return CustomLintExampleOptionMapper.ensureInitialized()
        .encodeJson<CustomLintExampleOption>(this as CustomLintExampleOption);
  }

  Map<String, dynamic> toMap() {
    return CustomLintExampleOptionMapper.ensureInitialized()
        .encodeMap<CustomLintExampleOption>(this as CustomLintExampleOption);
  }

  CustomLintExampleOptionCopyWith<CustomLintExampleOption,
          CustomLintExampleOption, CustomLintExampleOption>
      get copyWith => _CustomLintExampleOptionCopyWithImpl(
          this as CustomLintExampleOption, $identity, $identity);
  @override
  String toString() {
    return CustomLintExampleOptionMapper.ensureInitialized()
        .stringifyValue(this as CustomLintExampleOption);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CustomLintExampleOptionMapper.ensureInitialized()
                .isValueEqual(this as CustomLintExampleOption, other));
  }

  @override
  int get hashCode {
    return CustomLintExampleOptionMapper.ensureInitialized()
        .hashValue(this as CustomLintExampleOption);
  }
}

extension CustomLintExampleOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomLintExampleOption, $Out> {
  CustomLintExampleOptionCopyWith<$R, CustomLintExampleOption, $Out>
      get $asCustomLintExampleOption => $base
          .as((v, t, t2) => _CustomLintExampleOptionCopyWithImpl(v, t, t2));
}

abstract class CustomLintExampleOptionCopyWith<
    $R,
    $In extends CustomLintExampleOption,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include;
  $R call(
      {List<String>? exclude, List<String>? include, ErrorSeverity? severity});
  CustomLintExampleOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CustomLintExampleOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomLintExampleOption, $Out>
    implements
        CustomLintExampleOptionCopyWith<$R, CustomLintExampleOption, $Out> {
  _CustomLintExampleOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomLintExampleOption> $mapper =
      CustomLintExampleOptionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude =>
      ListCopyWith($value.exclude, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(exclude: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include =>
      ListCopyWith($value.include, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(include: v));
  @override
  $R call(
          {List<String>? exclude,
          List<String>? include,
          ErrorSeverity? severity}) =>
      $apply(FieldCopyWithData({
        if (exclude != null) #exclude: exclude,
        if (include != null) #include: include,
        if (severity != null) #severity: severity
      }));
  @override
  CustomLintExampleOption $make(CopyWithData data) => CustomLintExampleOption(
      exclude: data.get(#exclude, or: $value.exclude),
      include: data.get(#include, or: $value.include),
      severity: data.get(#severity, or: $value.severity));

  @override
  CustomLintExampleOptionCopyWith<$R2, CustomLintExampleOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CustomLintExampleOptionCopyWithImpl($value, $cast, t);
}

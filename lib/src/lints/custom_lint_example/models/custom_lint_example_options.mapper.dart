// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'custom_lint_example_options.dart';

class CustomLintExampleOptionsMapper
    extends ClassMapperBase<CustomLintExampleOptions> {
  CustomLintExampleOptionsMapper._();

  static CustomLintExampleOptionsMapper? _instance;
  static CustomLintExampleOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CustomLintExampleOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomLintExampleOptions';

  static List<String> _$exclude(CustomLintExampleOptions v) => v.exclude;
  static const Field<CustomLintExampleOptions, List<String>> _f$exclude =
      Field('exclude', _$exclude, opt: true, def: const []);
  static List<String> _$include(CustomLintExampleOptions v) => v.include;
  static const Field<CustomLintExampleOptions, List<String>> _f$include =
      Field('include', _$include, opt: true, def: const []);
  static ErrorSeverity? _$severity(CustomLintExampleOptions v) => v.severity;
  static const Field<CustomLintExampleOptions, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<CustomLintExampleOptions, dynamic>> fields = const {
    #exclude: _f$exclude,
    #include: _f$include,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static CustomLintExampleOptions _instantiate(DecodingData data) {
    return CustomLintExampleOptions(
        exclude: data.dec(_f$exclude),
        include: data.dec(_f$include),
        severity: data.dec(_f$severity));
  }

  @override
  final Function instantiate = _instantiate;

  static CustomLintExampleOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomLintExampleOptions>(map);
  }

  static CustomLintExampleOptions fromJson(String json) {
    return ensureInitialized().decodeJson<CustomLintExampleOptions>(json);
  }
}

mixin CustomLintExampleOptionsMappable {
  String toJson() {
    return CustomLintExampleOptionsMapper.ensureInitialized()
        .encodeJson<CustomLintExampleOptions>(this as CustomLintExampleOptions);
  }

  Map<String, dynamic> toMap() {
    return CustomLintExampleOptionsMapper.ensureInitialized()
        .encodeMap<CustomLintExampleOptions>(this as CustomLintExampleOptions);
  }

  CustomLintExampleOptionsCopyWith<CustomLintExampleOptions,
          CustomLintExampleOptions, CustomLintExampleOptions>
      get copyWith => _CustomLintExampleOptionsCopyWithImpl(
          this as CustomLintExampleOptions, $identity, $identity);
  @override
  String toString() {
    return CustomLintExampleOptionsMapper.ensureInitialized()
        .stringifyValue(this as CustomLintExampleOptions);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CustomLintExampleOptionsMapper.ensureInitialized()
                .isValueEqual(this as CustomLintExampleOptions, other));
  }

  @override
  int get hashCode {
    return CustomLintExampleOptionsMapper.ensureInitialized()
        .hashValue(this as CustomLintExampleOptions);
  }
}

extension CustomLintExampleOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomLintExampleOptions, $Out> {
  CustomLintExampleOptionsCopyWith<$R, CustomLintExampleOptions, $Out>
      get $asCustomLintExampleOptions => $base
          .as((v, t, t2) => _CustomLintExampleOptionsCopyWithImpl(v, t, t2));
}

abstract class CustomLintExampleOptionsCopyWith<
    $R,
    $In extends CustomLintExampleOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include;
  $R call(
      {List<String>? exclude, List<String>? include, ErrorSeverity? severity});
  CustomLintExampleOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CustomLintExampleOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomLintExampleOptions, $Out>
    implements
        CustomLintExampleOptionsCopyWith<$R, CustomLintExampleOptions, $Out> {
  _CustomLintExampleOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomLintExampleOptions> $mapper =
      CustomLintExampleOptionsMapper.ensureInitialized();
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
          Object? severity = $none}) =>
      $apply(FieldCopyWithData({
        if (exclude != null) #exclude: exclude,
        if (include != null) #include: include,
        if (severity != $none) #severity: severity
      }));
  @override
  CustomLintExampleOptions $make(CopyWithData data) => CustomLintExampleOptions(
      exclude: data.get(#exclude, or: $value.exclude),
      include: data.get(#include, or: $value.include),
      severity: data.get(#severity, or: $value.severity));

  @override
  CustomLintExampleOptionsCopyWith<$R2, CustomLintExampleOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CustomLintExampleOptionsCopyWithImpl($value, $cast, t);
}

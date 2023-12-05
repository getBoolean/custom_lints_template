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

  static ErrorSeverity? _$severity(CustomLintExampleOptions v) => v.severity;
  static const Field<CustomLintExampleOptions, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());
  static List<String> _$includes(CustomLintExampleOptions v) => v.includes;
  static const Field<CustomLintExampleOptions, List<String>> _f$includes =
      Field('includes', _$includes, opt: true, def: const []);
  static List<String> _$excludes(CustomLintExampleOptions v) => v.excludes;
  static const Field<CustomLintExampleOptions, List<String>> _f$excludes =
      Field('excludes', _$excludes, opt: true, def: const []);

  @override
  final Map<Symbol, Field<CustomLintExampleOptions, dynamic>> fields = const {
    #severity: _f$severity,
    #includes: _f$includes,
    #excludes: _f$excludes,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static CustomLintExampleOptions _instantiate(DecodingData data) {
    return CustomLintExampleOptions(
        severity: data.dec(_f$severity),
        includes: data.dec(_f$includes),
        excludes: data.dec(_f$excludes));
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes;
  $R call(
      {ErrorSeverity? severity,
      List<String>? includes,
      List<String>? excludes});
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes =>
      ListCopyWith($value.includes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(includes: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes =>
      ListCopyWith($value.excludes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(excludes: v));
  @override
  $R call(
          {Object? severity = $none,
          List<String>? includes,
          List<String>? excludes}) =>
      $apply(FieldCopyWithData({
        if (severity != $none) #severity: severity,
        if (includes != null) #includes: includes,
        if (excludes != null) #excludes: excludes
      }));
  @override
  CustomLintExampleOptions $make(CopyWithData data) => CustomLintExampleOptions(
      severity: data.get(#severity, or: $value.severity),
      includes: data.get(#includes, or: $value.includes),
      excludes: data.get(#excludes, or: $value.excludes));

  @override
  CustomLintExampleOptionsCopyWith<$R2, CustomLintExampleOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CustomLintExampleOptionsCopyWithImpl($value, $cast, t);
}

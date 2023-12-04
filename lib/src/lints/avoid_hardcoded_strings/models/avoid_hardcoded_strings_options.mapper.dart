// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'avoid_hardcoded_strings_options.dart';

class AvoidHardcodedStringsOptionsMapper
    extends ClassMapperBase<AvoidHardcodedStringsOptions> {
  AvoidHardcodedStringsOptionsMapper._();

  static AvoidHardcodedStringsOptionsMapper? _instance;
  static AvoidHardcodedStringsOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AvoidHardcodedStringsOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AvoidHardcodedStringsOptions';

  static int _$minimumLength(AvoidHardcodedStringsOptions v) => v.minimumLength;
  static const Field<AvoidHardcodedStringsOptions, int> _f$minimumLength =
      Field('minimumLength', _$minimumLength,
          key: 'minimum_length', opt: true, def: 0);
  static List<String> _$excludes(AvoidHardcodedStringsOptions v) => v.excludes;
  static const Field<AvoidHardcodedStringsOptions, List<String>> _f$excludes =
      Field('excludes', _$excludes, opt: true, def: const []);
  static List<String> _$includes(AvoidHardcodedStringsOptions v) => v.includes;
  static const Field<AvoidHardcodedStringsOptions, List<String>> _f$includes =
      Field('includes', _$includes, opt: true, def: const []);
  static ErrorSeverity? _$severity(AvoidHardcodedStringsOptions v) =>
      v.severity;
  static const Field<AvoidHardcodedStringsOptions, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<AvoidHardcodedStringsOptions, dynamic>> fields =
      const {
    #minimumLength: _f$minimumLength,
    #excludes: _f$excludes,
    #includes: _f$includes,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static AvoidHardcodedStringsOptions _instantiate(DecodingData data) {
    return AvoidHardcodedStringsOptions(
        minimumLength: data.dec(_f$minimumLength),
        excludes: data.dec(_f$excludes),
        includes: data.dec(_f$includes),
        severity: data.dec(_f$severity));
  }

  @override
  final Function instantiate = _instantiate;

  static AvoidHardcodedStringsOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AvoidHardcodedStringsOptions>(map);
  }

  static AvoidHardcodedStringsOptions fromJson(String json) {
    return ensureInitialized().decodeJson<AvoidHardcodedStringsOptions>(json);
  }
}

mixin AvoidHardcodedStringsOptionsMappable {
  String toJson() {
    return AvoidHardcodedStringsOptionsMapper.ensureInitialized()
        .encodeJson<AvoidHardcodedStringsOptions>(
            this as AvoidHardcodedStringsOptions);
  }

  Map<String, dynamic> toMap() {
    return AvoidHardcodedStringsOptionsMapper.ensureInitialized()
        .encodeMap<AvoidHardcodedStringsOptions>(
            this as AvoidHardcodedStringsOptions);
  }

  AvoidHardcodedStringsOptionsCopyWith<AvoidHardcodedStringsOptions,
          AvoidHardcodedStringsOptions, AvoidHardcodedStringsOptions>
      get copyWith => _AvoidHardcodedStringsOptionsCopyWithImpl(
          this as AvoidHardcodedStringsOptions, $identity, $identity);
  @override
  String toString() {
    return AvoidHardcodedStringsOptionsMapper.ensureInitialized()
        .stringifyValue(this as AvoidHardcodedStringsOptions);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AvoidHardcodedStringsOptionsMapper.ensureInitialized()
                .isValueEqual(this as AvoidHardcodedStringsOptions, other));
  }

  @override
  int get hashCode {
    return AvoidHardcodedStringsOptionsMapper.ensureInitialized()
        .hashValue(this as AvoidHardcodedStringsOptions);
  }
}

extension AvoidHardcodedStringsOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AvoidHardcodedStringsOptions, $Out> {
  AvoidHardcodedStringsOptionsCopyWith<$R, AvoidHardcodedStringsOptions, $Out>
      get $asAvoidHardcodedStringsOptions => $base.as(
          (v, t, t2) => _AvoidHardcodedStringsOptionsCopyWithImpl(v, t, t2));
}

abstract class AvoidHardcodedStringsOptionsCopyWith<
    $R,
    $In extends AvoidHardcodedStringsOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes;
  $R call(
      {int? minimumLength,
      List<String>? excludes,
      List<String>? includes,
      ErrorSeverity? severity});
  AvoidHardcodedStringsOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AvoidHardcodedStringsOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AvoidHardcodedStringsOptions, $Out>
    implements
        AvoidHardcodedStringsOptionsCopyWith<$R, AvoidHardcodedStringsOptions,
            $Out> {
  _AvoidHardcodedStringsOptionsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AvoidHardcodedStringsOptions> $mapper =
      AvoidHardcodedStringsOptionsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes =>
      ListCopyWith($value.excludes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(excludes: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes =>
      ListCopyWith($value.includes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(includes: v));
  @override
  $R call(
          {int? minimumLength,
          List<String>? excludes,
          List<String>? includes,
          Object? severity = $none}) =>
      $apply(FieldCopyWithData({
        if (minimumLength != null) #minimumLength: minimumLength,
        if (excludes != null) #excludes: excludes,
        if (includes != null) #includes: includes,
        if (severity != $none) #severity: severity
      }));
  @override
  AvoidHardcodedStringsOptions $make(CopyWithData data) =>
      AvoidHardcodedStringsOptions(
          minimumLength: data.get(#minimumLength, or: $value.minimumLength),
          excludes: data.get(#excludes, or: $value.excludes),
          includes: data.get(#includes, or: $value.includes),
          severity: data.get(#severity, or: $value.severity));

  @override
  AvoidHardcodedStringsOptionsCopyWith<$R2, AvoidHardcodedStringsOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AvoidHardcodedStringsOptionsCopyWithImpl($value, $cast, t);
}

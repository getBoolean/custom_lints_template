// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'avoid_hardcoded_strings.dart';

class AvoidHardcodedStringsOptionMapper
    extends ClassMapperBase<AvoidHardcodedStringsOption> {
  AvoidHardcodedStringsOptionMapper._();

  static AvoidHardcodedStringsOptionMapper? _instance;
  static AvoidHardcodedStringsOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AvoidHardcodedStringsOptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AvoidHardcodedStringsOption';

  static int _$minimumLength(AvoidHardcodedStringsOption v) => v.minimumLength;
  static const Field<AvoidHardcodedStringsOption, int> _f$minimumLength = Field(
      'minimumLength', _$minimumLength,
      key: 'minimum_length', opt: true, def: 0);
  static List<String> _$excludes(AvoidHardcodedStringsOption v) => v.excludes;
  static const Field<AvoidHardcodedStringsOption, List<String>> _f$excludes =
      Field('excludes', _$excludes, opt: true, def: const []);
  static List<String> _$includes(AvoidHardcodedStringsOption v) => v.includes;
  static const Field<AvoidHardcodedStringsOption, List<String>> _f$includes =
      Field('includes', _$includes, opt: true, def: const []);
  static ErrorSeverity? _$severity(AvoidHardcodedStringsOption v) => v.severity;
  static const Field<AvoidHardcodedStringsOption, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<AvoidHardcodedStringsOption, dynamic>> fields =
      const {
    #minimumLength: _f$minimumLength,
    #excludes: _f$excludes,
    #includes: _f$includes,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static AvoidHardcodedStringsOption _instantiate(DecodingData data) {
    return AvoidHardcodedStringsOption(
        minimumLength: data.dec(_f$minimumLength),
        excludes: data.dec(_f$excludes),
        includes: data.dec(_f$includes),
        severity: data.dec(_f$severity));
  }

  @override
  final Function instantiate = _instantiate;

  static AvoidHardcodedStringsOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AvoidHardcodedStringsOption>(map);
  }

  static AvoidHardcodedStringsOption fromJson(String json) {
    return ensureInitialized().decodeJson<AvoidHardcodedStringsOption>(json);
  }
}

mixin AvoidHardcodedStringsOptionMappable {
  String toJson() {
    return AvoidHardcodedStringsOptionMapper.ensureInitialized()
        .encodeJson<AvoidHardcodedStringsOption>(
            this as AvoidHardcodedStringsOption);
  }

  Map<String, dynamic> toMap() {
    return AvoidHardcodedStringsOptionMapper.ensureInitialized()
        .encodeMap<AvoidHardcodedStringsOption>(
            this as AvoidHardcodedStringsOption);
  }

  AvoidHardcodedStringsOptionCopyWith<AvoidHardcodedStringsOption,
          AvoidHardcodedStringsOption, AvoidHardcodedStringsOption>
      get copyWith => _AvoidHardcodedStringsOptionCopyWithImpl(
          this as AvoidHardcodedStringsOption, $identity, $identity);
  @override
  String toString() {
    return AvoidHardcodedStringsOptionMapper.ensureInitialized()
        .stringifyValue(this as AvoidHardcodedStringsOption);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AvoidHardcodedStringsOptionMapper.ensureInitialized()
                .isValueEqual(this as AvoidHardcodedStringsOption, other));
  }

  @override
  int get hashCode {
    return AvoidHardcodedStringsOptionMapper.ensureInitialized()
        .hashValue(this as AvoidHardcodedStringsOption);
  }
}

extension AvoidHardcodedStringsOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AvoidHardcodedStringsOption, $Out> {
  AvoidHardcodedStringsOptionCopyWith<$R, AvoidHardcodedStringsOption, $Out>
      get $asAvoidHardcodedStringsOption => $base
          .as((v, t, t2) => _AvoidHardcodedStringsOptionCopyWithImpl(v, t, t2));
}

abstract class AvoidHardcodedStringsOptionCopyWith<
    $R,
    $In extends AvoidHardcodedStringsOption,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes;
  $R call(
      {int? minimumLength,
      List<String>? excludes,
      List<String>? includes,
      ErrorSeverity? severity});
  AvoidHardcodedStringsOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AvoidHardcodedStringsOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AvoidHardcodedStringsOption, $Out>
    implements
        AvoidHardcodedStringsOptionCopyWith<$R, AvoidHardcodedStringsOption,
            $Out> {
  _AvoidHardcodedStringsOptionCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AvoidHardcodedStringsOption> $mapper =
      AvoidHardcodedStringsOptionMapper.ensureInitialized();
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
  AvoidHardcodedStringsOption $make(CopyWithData data) =>
      AvoidHardcodedStringsOption(
          minimumLength: data.get(#minimumLength, or: $value.minimumLength),
          excludes: data.get(#excludes, or: $value.excludes),
          includes: data.get(#includes, or: $value.includes),
          severity: data.get(#severity, or: $value.severity));

  @override
  AvoidHardcodedStringsOptionCopyWith<$R2, AvoidHardcodedStringsOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AvoidHardcodedStringsOptionCopyWithImpl($value, $cast, t);
}

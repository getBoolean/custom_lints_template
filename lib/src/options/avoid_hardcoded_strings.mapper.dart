// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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
  static List<String> _$exclude(AvoidHardcodedStringsOption v) => v.exclude;
  static const Field<AvoidHardcodedStringsOption, List<String>> _f$exclude =
      Field('exclude', _$exclude, opt: true, def: const []);
  static List<String> _$include(AvoidHardcodedStringsOption v) => v.include;
  static const Field<AvoidHardcodedStringsOption, List<String>> _f$include =
      Field('include', _$include, opt: true, def: const []);
  static ErrorSeverity _$severity(AvoidHardcodedStringsOption v) => v.severity;
  static const Field<AvoidHardcodedStringsOption, ErrorSeverity> _f$severity =
      Field('severity', _$severity,
          opt: true, def: ErrorSeverity.INFO, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<AvoidHardcodedStringsOption, dynamic>> fields =
      const {
    #minimumLength: _f$minimumLength,
    #exclude: _f$exclude,
    #include: _f$include,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static AvoidHardcodedStringsOption _instantiate(DecodingData data) {
    return AvoidHardcodedStringsOption(
        minimumLength: data.dec(_f$minimumLength),
        exclude: data.dec(_f$exclude),
        include: data.dec(_f$include),
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include;
  $R call(
      {int? minimumLength,
      List<String>? exclude,
      List<String>? include,
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude =>
      ListCopyWith($value.exclude, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(exclude: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include =>
      ListCopyWith($value.include, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(include: v));
  @override
  $R call(
          {int? minimumLength,
          List<String>? exclude,
          List<String>? include,
          ErrorSeverity? severity}) =>
      $apply(FieldCopyWithData({
        if (minimumLength != null) #minimumLength: minimumLength,
        if (exclude != null) #exclude: exclude,
        if (include != null) #include: include,
        if (severity != null) #severity: severity
      }));
  @override
  AvoidHardcodedStringsOption $make(CopyWithData data) =>
      AvoidHardcodedStringsOption(
          minimumLength: data.get(#minimumLength, or: $value.minimumLength),
          exclude: data.get(#exclude, or: $value.exclude),
          include: data.get(#include, or: $value.include),
          severity: data.get(#severity, or: $value.severity));

  @override
  AvoidHardcodedStringsOptionCopyWith<$R2, AvoidHardcodedStringsOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AvoidHardcodedStringsOptionCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'options.dart';

class OptionsMapper extends ClassMapperBase<Options> {
  OptionsMapper._();

  static OptionsMapper? _instance;
  static OptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OptionsMapper._());
      RulesOptionMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Options';

  static RulesOption _$rules(Options v) => v.rules;
  static const Field<Options, RulesOption> _f$rules =
      Field('rules', _$rules, opt: true, def: const RulesOption());
  static List<String> _$rulesExclude(Options v) => v.rulesExclude;
  static const Field<Options, List<String>> _f$rulesExclude = Field(
      'rulesExclude', _$rulesExclude,
      key: 'rules_exclude', opt: true, def: const []);

  @override
  final Map<Symbol, Field<Options, dynamic>> fields = const {
    #rules: _f$rules,
    #rulesExclude: _f$rulesExclude,
  };

  static Options _instantiate(DecodingData data) {
    return Options(
        rules: data.dec(_f$rules), rulesExclude: data.dec(_f$rulesExclude));
  }

  @override
  final Function instantiate = _instantiate;

  static Options fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Options>(map));
  }

  static Options fromJson(String json) {
    return _guard((c) => c.fromJson<Options>(json));
  }
}

mixin OptionsMappable {
  String toJson() {
    return OptionsMapper._guard((c) => c.toJson(this as Options));
  }

  Map<String, dynamic> toMap() {
    return OptionsMapper._guard((c) => c.toMap(this as Options));
  }

  OptionsCopyWith<Options, Options, Options> get copyWith =>
      _OptionsCopyWithImpl(this as Options, $identity, $identity);
  @override
  String toString() {
    return OptionsMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OptionsMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OptionsMapper._guard((c) => c.hash(this));
  }
}

extension OptionsValueCopy<$R, $Out> on ObjectCopyWith<$R, Options, $Out> {
  OptionsCopyWith<$R, Options, $Out> get $asOptions =>
      $base.as((v, t, t2) => _OptionsCopyWithImpl(v, t, t2));
}

abstract class OptionsCopyWith<$R, $In extends Options, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  RulesOptionCopyWith<$R, RulesOption, RulesOption> get rules;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get rulesExclude;
  $R call({RulesOption? rules, List<String>? rulesExclude});
  OptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Options, $Out>
    implements OptionsCopyWith<$R, Options, $Out> {
  _OptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Options> $mapper =
      OptionsMapper.ensureInitialized();
  @override
  RulesOptionCopyWith<$R, RulesOption, RulesOption> get rules =>
      $value.rules.copyWith.$chain((v) => call(rules: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get rulesExclude => ListCopyWith(
          $value.rulesExclude,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(rulesExclude: v));
  @override
  $R call({RulesOption? rules, List<String>? rulesExclude}) =>
      $apply(FieldCopyWithData({
        if (rules != null) #rules: rules,
        if (rulesExclude != null) #rulesExclude: rulesExclude
      }));
  @override
  Options $make(CopyWithData data) => Options(
      rules: data.get(#rules, or: $value.rules),
      rulesExclude: data.get(#rulesExclude, or: $value.rulesExclude));

  @override
  OptionsCopyWith<$R2, Options, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OptionsCopyWithImpl($value, $cast, t);
}

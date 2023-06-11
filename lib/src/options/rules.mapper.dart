// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'rules.dart';

class RulesOptionMapper extends ClassMapperBase<RulesOption> {
  RulesOptionMapper._();

  static RulesOptionMapper? _instance;
  static RulesOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RulesOptionMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'RulesOption';

  static List<String> _$entries(RulesOption v) => v.entries;
  static const Field<RulesOption, List<String>> _f$entries =
      Field('entries', _$entries, opt: true, def: const []);

  @override
  final Map<Symbol, Field<RulesOption, dynamic>> fields = const {
    #entries: _f$entries,
  };

  static RulesOption _instantiate(DecodingData data) {
    return RulesOption(entries: data.dec(_f$entries));
  }

  @override
  final Function instantiate = _instantiate;

  static RulesOption fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<RulesOption>(map));
  }

  static RulesOption fromJson(String json) {
    return _guard((c) => c.fromJson<RulesOption>(json));
  }
}

mixin RulesOptionMappable {
  String toJson() {
    return RulesOptionMapper._guard((c) => c.toJson(this as RulesOption));
  }

  Map<String, dynamic> toMap() {
    return RulesOptionMapper._guard((c) => c.toMap(this as RulesOption));
  }

  RulesOptionCopyWith<RulesOption, RulesOption, RulesOption> get copyWith =>
      _RulesOptionCopyWithImpl(this as RulesOption, $identity, $identity);
  @override
  String toString() {
    return RulesOptionMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RulesOptionMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return RulesOptionMapper._guard((c) => c.hash(this));
  }
}

extension RulesOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RulesOption, $Out> {
  RulesOptionCopyWith<$R, RulesOption, $Out> get $asRulesOption =>
      $base.as((v, t, t2) => _RulesOptionCopyWithImpl(v, t, t2));
}

abstract class RulesOptionCopyWith<$R, $In extends RulesOption, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get entries;
  $R call({List<String>? entries});
  RulesOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RulesOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RulesOption, $Out>
    implements RulesOptionCopyWith<$R, RulesOption, $Out> {
  _RulesOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RulesOption> $mapper =
      RulesOptionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get entries =>
      ListCopyWith($value.entries, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(entries: v));
  @override
  $R call({List<String>? entries}) =>
      $apply(FieldCopyWithData({if (entries != null) #entries: entries}));
  @override
  RulesOption $make(CopyWithData data) =>
      RulesOption(entries: data.get(#entries, or: $value.entries));

  @override
  RulesOptionCopyWith<$R2, RulesOption, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RulesOptionCopyWithImpl($value, $cast, t);
}

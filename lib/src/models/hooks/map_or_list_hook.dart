import 'package:dart_mappable/dart_mappable.dart';

class MapOrListHook extends MappingHook {
  const MapOrListHook();

  @override
  Object? beforeEncode(Object? value) {
    return value;
  }

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map<String, dynamic>) {
      return value;
    } else if (value is List<dynamic>) {
      // convert list to an equivalent map
      return value.fold<Map<String, dynamic>>({}, (map, item) {
        if (item is String) {
          map[item] = <String, dynamic>{};
        } else if (item is Map<String, dynamic>) {
          map.addAll(item);
        }
        return map;
      });
    }

    return null;
  }
}

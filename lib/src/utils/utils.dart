import 'package:analyzer/source/source_range.dart';
import 'package:path/path.dart' as p;

/// Source: https://github.com/rrousselGit/riverpod/blob/master/packages/riverpod_lint/lib/src/riverpod_custom_lint.dart
SourceRange sourceRangeFrom({required int start, required int end}) {
  return SourceRange(start, end - start);
}

bool isParent(String parent, String child) {
  return p.isWithin(parent, child);
}

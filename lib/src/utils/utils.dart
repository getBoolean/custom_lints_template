import 'package:analyzer/source/source_range.dart';

/// Source: https://github.com/rrousselGit/riverpod/blob/master/packages/riverpod_lint/lib/src/riverpod_custom_lint.dart
SourceRange sourceRangeFrom({required int start, required int end}) {
  return SourceRange(start, end - start);
}

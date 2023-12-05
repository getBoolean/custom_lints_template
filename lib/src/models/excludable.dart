import 'package:custom_lints_template/src/utils/path_utils.dart';

mixin ExcludableMixin {
  List<String> get includes;
  List<String> get excludes;

  bool shouldSkipAnalysis({
    required String path,
    required String rootPath,
  }) {
    return shouldSkipFile(
      includeGlobs: includes,
      excludeGlobs: excludes,
      path: path,
      rootPath: rootPath,
    );
  }
}

abstract class Excludable with ExcludableMixin {
  const Excludable();
}

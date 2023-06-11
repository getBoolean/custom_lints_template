@TestOn('vm')
@Tags(['presubmit-only'])
@Timeout(Duration(seconds: 120))
library ensure_build_test;

import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
    'ensure_build',
    expectBuildClean,
  );
}

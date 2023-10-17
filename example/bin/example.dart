import 'package:example/example.dart' as example;

void main(List<String> arguments) {
  // expect_lint: avoid_hardcoded_strings
  final test = 'test';

  // expect_lint: avoid_hardcoded_strings
  print('Hello world: $test ${example.calculate()}!');
}

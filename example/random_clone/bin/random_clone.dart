import 'package:random_clone/random_clone.dart' as random;

void main(List<String> arguments) {
  // expect_lint: avoid_hardcoded_strings
  final test = 'test';

  // expect_lint: avoid_hardcoded_strings
  print('Hello world: $test ${random.calculate()}!');
}

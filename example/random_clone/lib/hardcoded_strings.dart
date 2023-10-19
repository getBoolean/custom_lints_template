final test = 'test';

void tester() {
  final test2 = 'test'.hardcoded;
  final test3 = 'test';
  final test4 = 'abc'.hardcoded;
  final test5 = 'test$test4';
  final test6 = 'test${test4}test';

  final test7 = 'test'
      'test2'
      'test3';
  'test';
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
}

extension HardcodedString on String {
  String get hardcoded => this;
}

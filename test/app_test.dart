@TestOn("vm")

import '../lib/src/atm.dart';
import '../lib/src/result.dart';
import '../lib/src/nominals.dart';
import "package:test/test.dart";

void main() {
  Atm atm = new Atm(nominals);
  Result result = new Result();
  var expected;
  int value;

  test('Check initial atm', () {
  value = 20;
  atm.initial();
  atm.calculate(value);
  atm.initial();
    for(int i=0; i<nominals.length; i++) {
      expect(atm.result[nominals[i].value], 0);
    }
  });

  test('Check initial result', () {
  atm.initial();
  result.initial(nominals);
  atm.calculate(value);
  result.initial(nominals);
    for(int i=0; i<nominals.length; i++) {
      expect(result.strings[i], '');
    }
  });

  test('Take 20', () {
  value = 20;
  expected = {1: 5, 5: 1, 10: 1, 50: 0};
  atm.initial(); 
  atm.calculate(value);
    expect(atm.result, expected);
  });

  test('Take 51', () {
  value = 51;
  expected = {1: 1, 5: 2, 10: 4, 50: 0};
  atm.initial();
  atm.calculate(value);
    expect(atm.result, expected);
  });

  test('Take 100', () {
  value = 100;
  expected = {1: 5, 5: 1, 10: 4, 50: 1};
  atm.initial();
  atm.calculate(value);
    expect(atm.result, expected);
  });

  test('Take 99', () {
  value = 99;
  expected = {1: 4, 5: 1, 10: 4, 50: 1};
  atm.initial();
  atm.calculate(value);
    expect(atm.result, expected);
  });

  test('Take 1000', () {
  value = 1000;
  expected = {1: 5, 5: 1, 10: 4, 50: 19};
  atm.initial();
  atm.calculate(value);
    expect(atm.result, expected);
  });

  test('Take 0', () {
  value = 0;
  expected = {1: 0, 5: 0, 10: 0, 50: 0};
  atm.initial();
  atm.calculate(value);
    expect(atm.result, expected);
  });

}
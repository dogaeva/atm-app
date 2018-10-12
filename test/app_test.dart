@TestOn("vm")

import '../lib/src/atm.dart';
import '../lib/src/nominals.dart';
import '../lib/src/nominal.dart';
import "package:test/test.dart";

void main() {
  Atm atm = new Atm(nominals);
  List<int> expected;
  int value;

  void check(List<Nominal> list, List<int> expected) {
    for(int i=0; i<list.length; i++) {
      expect(list[i].amount, expected[i]);
    }
  }

  test('Check initial', () {
  value = 20;
  atm.calculate(value);
  atm.initial();
    for(Nominal item in atm.list) {
      expect(item.amount, 0);
      expect(item.result, '');
    }
  });

  test('Take 20', () {
  value = 20;
  expected = [0, 1, 1, 5];
  atm.initial();  
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 10', () {
  value = 10;
  expected = [0, 0, 1, 5]; 
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 50', () {
  value = 50;
  expected = [0, 4, 1, 5]; 
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 0', () {
  value = 0;
  expected = [0, 0, 0, 0]; 
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 99', () {
  value = 99;
  expected = [1, 4, 1, 4];
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 44', () {
  value = 44;
  expected = [0, 3, 2, 4];
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 100', () {
  value = 100;
  expected = [1, 4, 1, 5]; 
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 1000', () {
  value = 1000;
  expected = [19, 4, 1, 5]; 
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });

  test('Take 1005', () {
  value = 1005;
  expected = [19, 4, 2, 5]; 
  atm.initial();
  atm.calculate(value);
    check(atm.list, expected);
  });
}
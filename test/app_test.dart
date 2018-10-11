@TestOn("vm")

import '../lib/src/atm.dart';
import '../lib/src/nominals.dart';
import "package:test/test.dart";

void main() {
  Atm atm = new Atm(nominals);

  test('Take 20', () {
  final int value = 20;
  atm.calculate(value);
    expect(atm.list[0].amount, 0);
    expect(atm.list[1].amount, 1);
    expect(atm.list[2].amount, 1);
    expect(atm.list[3].amount, 5);
  });

  test('Take 10', () {
  final int value = 10;
  atm.initial();
  atm.calculate(value);
    expect(atm.list[0].amount, 0);
    expect(atm.list[1].amount, 0);
    expect(atm.list[2].amount, 1);
    expect(atm.list[3].amount, 5);
  });

  test('Take 50', () {
  final int value = 50;
  atm.initial();
  atm.calculate(value);
    expect(atm.list[0].amount, 0);
    expect(atm.list[1].amount, 4);
    expect(atm.list[2].amount, 1);
    expect(atm.list[3].amount, 5);
  });
}
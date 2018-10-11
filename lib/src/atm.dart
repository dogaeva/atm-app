import 'nominal.dart';

class Atm {
  List<Nominal> list;

  void calculate(int value) {
    bool gotFirstLoop = false;

    while(value > 0) {
      for (Nominal nominal in list) {
        if (gotFirstLoop) {
          while(value >= nominal.value) {
            nominal.amount++;
            nominal.result += '      ' + nominal.emodji;
            value -= nominal.value;
          }
        } else if (value > nominal.value) {
          nominal.amount++;
          nominal.result += '  ' + nominal.emodji;
          value -= nominal.value;
        }
      }
      gotFirstLoop = true;
    }
  }

  void initial() {
    for (Nominal nominal in list) {
      nominal.result = '';
      nominal.amount = 0;
    }
  }

  Atm(this.list);
}
import 'nominal.dart';

class Atm {
  List<Nominal> list;
  var result = {};

  void calculate(int value) {
    bool gotFirstLoop = false;
    while(value > 0) {
        if (gotFirstLoop) {
          for(int i=list.length - 1; i>=0; i--) {
            while(value >= list[i].value) {
              result[list[i].value]++;
              value -= list[i].value;
            }
          }
        } else for (int i=0; i<list.length; i++) {
        if (value > list[i].value) {
          result[list[i].value]++;
          value -= list[i].value;
        }
      }
      gotFirstLoop = true;
    }
  }

  void initial() {
    for (int i=0; i<list.length; i++) {
      result[list[i].value] = 0;
    }
  }

  Atm(this.list);
}
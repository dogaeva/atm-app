import 'package:angular/angular.dart';
import 'src/nominal.dart';
import 'src/nominals.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
)
class AppComponent {
  int money;
  List<Nominal> resultList = nominals;

  void initialValues(List<Nominal> list) {
    for(Nominal item in list) {
      item.amount = 0;
      item.result = '';
    }
  }

  void convertResult(List<Nominal> list) {
     for(int i=0; i<list.length; i++) {
       for(int l=0; l<list[i].amount; l++) {
          list[i].result += '  ' + list[i].emodji;
       }
     }
  }

  void getValue(event) {
    money = event.target.value != '' ? int.parse(event.target.value) : null;
    if (money != null) {
      calculate(money, resultList);
    }
  }

  void calculate(value, List<Nominal> resultList) {
    initialValues(resultList);
    bool gotFirstLoop = false;

    while(value > 0) {
      for (Nominal nominal in resultList) {
        if (gotFirstLoop) {
          while(value >= nominal.value) {
            nominal.amount++;
            value -= nominal.value;
          }
        } else if (value > nominal.value) {
          nominal.amount++;
          value -= nominal.value;
        }
      }
      gotFirstLoop = true;
    }

    convertResult(resultList);
  }
}
import 'package:angular/angular.dart';
import 'src/nominals.dart';
import 'src/atm.dart';
import 'src/result.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
)
class AppComponent {
  Atm atm = new Atm(nominals);
  Result result = new Result();

  void getValue(e) {
    int money = e.target.value != '' ? int.parse(e.target.value) : 0;
      result.initial(nominals);
      atm.initial();
      atm.calculate(money);
      result.transformToEmodjis(nominals, atm.result);
  }

}
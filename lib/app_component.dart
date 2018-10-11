import 'package:angular/angular.dart';
import 'src/nominals.dart';
import 'src/atm.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
)
class AppComponent {
  Atm atm = new Atm(nominals);

  void getValue(e) {
    int money = e.target.value != '' ? int.parse(e.target.value) : 0;
      atm.initial();
      atm.calculate(money);
  }

}
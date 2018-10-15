import 'nominal.dart';
import 'emodjis.dart';


class Result {
  List<String> strings;

  void initial(List<Nominal> nominals) {
    strings = new List(nominals.length);
    for (int i=0; i<nominals.length; i++) {
      strings[i] = '';
    }
  }

  void transformToEmodjis(List<Nominal> nominals, var result) {
    for (int i=0; i<strings.length; i++) {
      for(int l=0; l<result[nominals[i].value]; l++) {
        strings[i] += '  ' + emodjis[nominals[i].value];
      }
    }
  }

}
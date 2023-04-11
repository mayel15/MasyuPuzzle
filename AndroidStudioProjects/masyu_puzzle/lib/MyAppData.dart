import 'package:masyu_puzzle/game.dart';
import 'package:masyu_puzzle/grid.dart';

class MyAppData {
  Game data;

  MyAppData(this.data);

  void setValue(Game value) {
    data = value;
  }

  Game getValue() {
    return data;
  }

  String getValueAsString(){
    return data.toString();
  }
}

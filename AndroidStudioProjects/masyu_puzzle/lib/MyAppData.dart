import 'package:flutter/material.dart';
import 'package:masyu_puzzle/cell.dart';
import 'package:masyu_puzzle/game.dart';
import 'package:masyu_puzzle/grid.dart';

class MyAppData {
  Game data;
  final counter = ValueNotifier<int>(0);
  List<MyLigne> lignes = [];

  MyAppData(this.data);

  void addLigne(MyLigne l){
    lignes.add(l);
    counter.value++;
  }

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

class MyLigne{
  Cell cellStart;
  Cell cellEnd;

  MyLigne(this.cellStart, this.cellEnd);
}

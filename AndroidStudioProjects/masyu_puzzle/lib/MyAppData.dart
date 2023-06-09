import 'package:flutter/material.dart';
import 'package:masyu_puzzle/cell.dart';
import 'package:masyu_puzzle/game.dart';
import 'package:masyu_puzzle/grid.dart';

class MyAppData {
  Game data;
  final counter = ValueNotifier<int>(0);
  List<MyLigne> lignes = [];
  List<Position> position = [];
  int taille = 0;
  String difficulte = '';

  MyAppData(this.data);

  void setTaille(int taille){
    this.taille = taille;
  }

  void addLigne(MyLigne l){
    lignes.add(l);
    counter.value++;
  }

  void addPos(Position p){
    position.add(p);
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

  void setDifficulte(String d){
    difficulte = d;
  }

  void ResetLine(){
    lignes = [];
  }

  void ResetPos(){
    position = [];
  }
}


class Position{
  double button_x_b1;
  double button_y_b1;
  double button_x_b2;
  double button_y_b2;


  Position(this.button_x_b1,this.button_y_b1,this.button_x_b2,this.button_y_b2);

}

class MyLigne{
  Cell cellStart;
  Cell cellEnd;

  MyLigne(this.cellStart, this.cellEnd);
}

import 'dart:convert';
import 'dart:io';
import 'package:masyu_puzzle/grid.dart';
import 'grid.dart';
import 'game.dart';
import 'cell.dart';
import 'line.dart';

List<Line> chargeLines(){
  // read content of file json
  String jsonString = File('lines.json').readAsStringSync();

  // convert the json chain in list of list of maps JSON
  List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(json.decode(jsonString));
  
  // Convert the list of JSON maps on matrix of cells
  List<Line> lines = List<Line>.generate(jsonList.length, (i) => Line.fromJson(jsonList.elementAt(i)));

  // Afficher la liste
  //for(Line line in lines){
  //  print(line);
  //}
  return lines;
}

Grid chargeGrid(){
  // read content of file json
  String jsonString = File('matrix.json').readAsStringSync();

  // convert the json chain in list of list of maps JSON
  List<List<Map<String, dynamic>>> jsonMatrix =
      List<List<Map<String, dynamic>>>.from(json.decode(jsonString).map((x) => List<Map<String, dynamic>>.from(x)));

  // Convert the list of JSON maps on matrix of cells
  List<List<Cell>> matrix = List.generate(jsonMatrix.length, (i) => List.generate(jsonMatrix[i].length, (j) => Cell.fromJson(jsonMatrix[i][j])));
  
  // print th matrix grid
  //for(List<Cell> list in matrix){
  //  print(list);
  //}
  Grid grid = Grid();
  grid.setListeCellule(matrix);
  return grid;
}


Game chargeGame(){
  Game game = Game();
  game.setGrid(chargeGrid());
  game.setLines(chargeLines());
  return game; 
}

void main() {

  //chargeGame();
  //print(chargeGrid());
}

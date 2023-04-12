import 'dart:convert';
import 'dart:io';
import 'game.dart';
import 'cell.dart';

void chargeGame(){
  // Lire le contenu du fichier json
  String jsonString = File('matrix.json').readAsStringSync();

  // Convertir la chaîne JSON en une liste de listes de maps JSON
  List<List<Map<String, dynamic>>> jsonMatrix =
      List<List<Map<String, dynamic>>>.from(json.decode(jsonString).map((x) => List<Map<String, dynamic>>.from(x)));

  // Convertir la liste de maps JSON en une matrice de Cell
  List<List<Cell>> matrix =
      List.generate(jsonMatrix.length, (i) => List.generate(jsonMatrix[i].length, (j) => Cell.fromJson(jsonMatrix[i][j])));

  // Afficher la matrice
  for(List<Cell> list in matrix){
    print(list);
  }
    
}

void main() {
  // Lire le contenu du fichier JSON
  //String jsonString = File('matrix.json').readAsStringSync();

  // Convertir la chaîne JSON en une matrice
  //List<List<int>> matrix = List<List<int>>.from(json.decode(jsonString).map((x) => List<int>.from(x)));

  // Afficher la matrice
  //print(matrix);
  chargeGame();
}
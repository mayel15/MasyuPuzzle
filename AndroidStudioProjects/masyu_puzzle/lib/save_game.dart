import 'dart:convert';
import 'dart:io';
import 'game.dart';
import 'cell.dart';
import 'line.dart';

void saveLines(List<Line> lines){
  // Convertir la matrice en une liste de maps JSON
  List<Map<String, dynamic>> jsonList = List.generate(lines.length,(i) =>(lines.elementAt(i).toJson()));

  // Convertir la matrice en une chaîne JSON
  String jsonString = jsonEncode(jsonList);

  // Enregistrer la chaîne JSON dans un fichier
  File('lines.json').writeAsStringSync(jsonString);
}

void saveGame(Game g) {
  // Convertir la matrice en une liste de maps JSON
  List<List<Map<String, dynamic>>> jsonGrid = List.generate(
      g.grid.listCells.length,
      (i) => List.generate(
          g.grid.listCells.elementAt(i).length, (j) => g.grid.listCells.elementAt(i).elementAt(j).toJson()));
  
  // for lines
  //List<Map<String, dynamic>> jsonList = List.generate(g.lines.length,(i) =>(g.lines.elementAt(i).toJson()));

  //jsonGrid.add(jsonList);

  /*List allList = [];
  allList.add(jsonGrid);
  allList.add(jsonList);*/

  // Convertir la matrice en une chaîne JSON
  String jsonString = jsonEncode(jsonGrid);

  // Enregistrer la chaîne JSON dans un fichier
  File('matrix.json').writeAsStringSync(jsonString);

  saveLines(g.lines);

  print('Votre partie a été enregistré 👌');
}



void main() {
  Game g = Game();
  g.grid.gridGenerator(5);
  g.linkedCells();
  /*for (Line line in g.lines) {
    print(line);
  }*/
  
  saveGame(g);
  //saveLines(g.lines);
}

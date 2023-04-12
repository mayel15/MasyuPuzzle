import 'dart:convert';
import 'dart:io';
import 'game.dart';
import 'cell.dart';

void saveGame(Game g) {
  // Convertir la matrice en une liste de maps JSON
  List<List<Map<String, dynamic>>> jsonGrid = List.generate(
      g.grid.listCells.length,
      (i) => List.generate(
          g.grid.listCells.elementAt(i).length, (j) => g.grid.listCells.elementAt(i).elementAt(j).toJson()));

  // Convertir la matrice en une chaîne JSON
  String jsonString = jsonEncode(jsonGrid);

  // Enregistrer la chaîne JSON dans un fichier
  File('matrix.json').writeAsStringSync(jsonString);

  print('Votre partie a été enregistré dans le fichier "matrix.json"');
}

void main() {
  // Créer une matrice de données
  /*List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];*/

  // Convertir la matrice en une chaîne JSON
  //String jsonMatrix = jsonEncode(matrix);

  // Enregistrer la chaîne JSON dans un fichier
  //File('matrix.json').writeAsStringSync(jsonMatrix);

  //print('Matrice enregistrée dans le fichier "matrix.json".');

  Game g = Game();
  g.grid.gridGenerator(5);
  for (List<Cell> list in g.grid.listCells) {
    print(list);
  }

  saveGame(g);
}

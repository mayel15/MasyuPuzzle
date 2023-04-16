import 'dart:convert';
import 'dart:io';
import 'package:masyu_puzzle/grid.dart';
import 'grid.dart';
import 'game.dart';
import 'cell.dart';
import 'line.dart';


import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<List<Line>> chargeLines(int index) async {
  // Obtenir le répertoire des documents de l'application
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String filePath = '${documentsDirectory.path}/lines.json';

  // Lire le contenu du fichier json
  List<String> fileContentLines = File(filePath).readAsLinesSync();

  // Vérifier si l'index est valide
  if (index < 0 || index >= fileContentLines.length) {
    print('Index invalide pour charger les lignes.');
    return [];
  }

  // Convertir la chaîne JSON en liste de maps JSON
  List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(json.decode(fileContentLines[index]));

  // Convertir la liste de maps JSON en liste de lignes
  List<Line> lines = List<Line>.generate(jsonList.length, (i) => Line.fromJson(jsonList.elementAt(i)));

  return lines;
}

Future<Grid> chargeGrid(int index) async {
  // Obtenir le répertoire des documents de l'application
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String filePath = '${documentsDirectory.path}/matrix.json';

  // Lire le contenu du fichier json
  List<String> fileContentLines = File(filePath).readAsLinesSync();

  // Vérifier si l'index est valide
  if (index < 0 || index >= fileContentLines.length) {
    print('Index invalide pour charger la grille.');
  }

  // Convertir la chaîne JSON en liste de listes de maps JSON
  List<List<Map<String, dynamic>>> jsonMatrix = List<List<Map<String, dynamic>>>.from(json.decode(fileContentLines[index]).map((x) => List<Map<String, dynamic>>.from(x)));

  // Convertir la liste de maps JSON en matrice de cellules
  List<List<Cell>> matrix = List.generate(jsonMatrix.length, (i) => List.generate(jsonMatrix[i].length, (j) => Cell.fromJson(jsonMatrix[i][j])));

  Grid grid = Grid();
  grid.setListeCellule(matrix);
  return grid;
}


Future<Game> chargeGame(int i) async {
  Game game = Game();
  game.setGrid(await chargeGrid(i));
  game.setLines(await chargeLines(i));
  print("Votre partie a été bien chargée !");
  return game;
}

/*
void main() {

  chargeGame();
  print(chargeGrid().listCells);
}
*/
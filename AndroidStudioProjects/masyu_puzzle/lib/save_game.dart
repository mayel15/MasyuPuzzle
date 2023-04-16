import 'dart:convert';
import 'dart:io';
import 'game.dart';
import 'cell.dart';
import 'line.dart';
import 'package:path_provider/path_provider.dart';

void saveLines(List<Line> lines) async {
  // Convertir la matrice en une liste de maps JSON
  List<Map<String, dynamic>> jsonList =
  List.generate(lines.length, (i) => (lines.elementAt(i).toJson()));

  // Convertir la matrice en une chaîne JSON
  String jsonString = jsonEncode(jsonList);

  // Obtenir le répertoire de documents
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  // Construire le chemin du fichier
  String filePath = appDocPath + '/lines.json';

  // Enregistrer la chaîne JSON dans un fichier en mode 'append'
  File(filePath).writeAsStringSync(jsonString + '\n', mode: FileMode.append);

  // Lire le contenu du fichier
  String fileContent = await File(filePath).readAsString();

  // Afficher le contenu du fichier
  print('Contenu du fichier :');
  print(fileContent);
}

void saveGame(Game g) async {
  // Convertir la matrice en une liste de maps JSON
  List<List<Map<String, dynamic>>> jsonGrid = List.generate(
      g.grid.listCells.length,
          (i) => List.generate(
          g.grid.listCells.elementAt(i).length, (j) => g.grid.listCells.elementAt(i).elementAt(j).toJson()));

  // Convertir la matrice en une chaîne JSON
  String jsonString = jsonEncode(jsonGrid);

  // Obtenir le répertoire des documents de l'application
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String filePath = '${documentsDirectory.path}/matrix.json';

  // Lire le fichier existant et ajouter la nouvelle chaîne JSON à la fin
  StringBuffer fileContent = StringBuffer();
  if (File(filePath).existsSync()) {
    fileContent.write(File(filePath).readAsStringSync());
  }
  if (fileContent.isNotEmpty) {
    fileContent.writeln(); // Ajoute une nouvelle ligne avant d'ajouter la nouvelle partie
  }
  fileContent.write(jsonString);

  // Enregistrer la chaîne mise à jour dans un fichier
  File(filePath).writeAsStringSync(fileContent.toString());

  saveLines(g.lines);

  // Lire le contenu du fichier après l'enregistrement
  String fileContentAfterSaving = File(filePath).readAsStringSync();

// Afficher le contenu du fichier
  print('Contenu du fichier matrix.json après l\'enregistrement :');
  print(fileContentAfterSaving);


  print('Votre partie a été enregistré 👌');
}


void deleteGame(int rowIndex) async {
  // Obtenir le répertoire des documents de l'application
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String filePath = '${documentsDirectory.path}/matrix.json';

  // Lire le contenu du fichier
  List<String> fileContentLines = [];
  if (File(filePath).existsSync()) {
    fileContentLines = await File(filePath).readAsLines();
  }

  // Vérifier si l'index est valide
  if (rowIndex < 0 || rowIndex >= fileContentLines.length) {
    print('Index invalide pour la suppression.');
    return;
  }

  // Supprimer la ligne à l'index spécifié
  fileContentLines.removeAt(rowIndex);

  // Réécrire le fichier avec les lignes restantes
  File(filePath).writeAsStringSync(fileContentLines.join('\n'));

  print('La partie a été supprimée.');
}




  void deleteLines(int rowIndex) async {
    // Obtenir le répertoire des documents de l'application
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String filePath = '${documentsDirectory.path}/lines.json';

    // Lire le contenu du fichier
    List<String> fileContentLines = [];
    if (File(filePath).existsSync()) {
      fileContentLines = await File(filePath).readAsLines();
    }

    // Vérifier si l'index est valide
    if (rowIndex < 0 || rowIndex >= fileContentLines.length) {
      print('Index invalide pour la suppression.');
      return;
    }

    // Supprimer la ligne à l'index spécifié
    fileContentLines.removeAt(rowIndex);

    // Réécrire le fichier avec les lignes restantes
    File(filePath).writeAsStringSync(fileContentLines.join('\n'));

    print('Les lignes ont été supprimées.');
  }

Future<void> clearFiles() async {
  // Obtenir le répertoire des documents de l'application
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  // Chemins des fichiers matrix.json et lines.json
  String matrixFilePath = '${documentsDirectory.path}/matrix.json';
  String linesFilePath = '${documentsDirectory.path}/lines.json';

  // Écrire une chaîne vide dans chaque fichier pour les vider
  File(matrixFilePath).writeAsStringSync('');
  File(linesFilePath).writeAsStringSync('');

  print('Les fichiers matrix.json et lines.json ont été vidés.');
}


Future<int> getNumberOfGames() async {
  // Obtenir le répertoire des documents de l'application
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String filePath = '${documentsDirectory.path}/matrix.json';

  // Vérifier si le fichier existe
  if (!File(filePath).existsSync()) {
    return 0;
  }

  // Lire le contenu du fichier json
  List<String> fileContentLines = File(filePath).readAsLinesSync();

  // Retourner le nombre de lignes
  return fileContentLines.length;
}

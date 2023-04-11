// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:masyu_puzzle/enum.dart';
import 'package:masyu_puzzle/cell.dart';
import 'package:masyu_puzzle/game.dart';
import 'package:masyu_puzzle/line.dart';

void main() {
  /* unit tests for game */
  group('Game tests', () {
    test('linkedCells should add the correct number of lines to the game', () {
      final game = Game();
      int taille = 3;
      game.grid.gridGenerator(taille);
      game.linkedCells();
      final gridSize = game.grid.listCells.length;
      //final expectedLines = gridSize * gridSize * 4 - gridSize * 4;
      final expectedLines = ((gridSize - 1) * gridSize )* 2;
      final nbLines = game.lines.length/2; // delete the doubled lines
      expect(nbLines, equals(expectedLines));
    });

    test('checkNbvoisins should return the correct number of neighbors for each cell', () {
      final game = Game();
      game.grid.listCells = [
        [Cell(0, 0, CellType.black), Cell(0, 1, CellType.none), Cell(0, 2, CellType.none)],
        [Cell(1, 0, CellType.none), Cell(1, 1, CellType.white), Cell(1, 2, CellType.none)],
        [Cell(2, 0, CellType.none), Cell(2, 1, CellType.none), Cell(2, 2, CellType.none)]
      ];
      game.linkedCells();
      final expectedNbVoisins = [1, 2, 2, 2, 2, 2, 2, 1, 1];
      for (int i = 0; i < game.grid.listCells.length; i++) {
        for (int j = 0; j < game.grid.listCells.length; j++) {
          expect(game.grid.listCells.elementAt(i).elementAt(j).getNbVoisins(), equals(expectedNbVoisins[i * 3 + j]));
        }
      }
    });
  });
}

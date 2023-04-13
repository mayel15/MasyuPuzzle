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
      final expectedLines = ((gridSize - 1) * gridSize) * 2;
      final nbLines = game.lines.length / 2; // delete the doubled lines
      expect(nbLines, equals(expectedLines));
    });

    test(
        'checkNbvoisins should return the correct number of neighbors for each cell',
        () {
      final game = Game();
      game.grid.listCells = [
        [
          Cell(0, 0, CellType.black),
          Cell(0, 1, CellType.black),
          Cell(0, 2, CellType.none)
        ],
        [
          Cell(1, 0, CellType.none),
          Cell(1, 1, CellType.white),
          Cell(1, 2, CellType.none)
        ],
        [
          Cell(2, 0, CellType.black),
          Cell(2, 1, CellType.black),
          Cell(2, 2, CellType.none)
        ]
      ];
      game.linkedCells();
      Cell c1 = game.grid.listCells.elementAt(0).elementAt(0);
      Cell c2 = game.grid.listCells.elementAt(1).elementAt(0);
      game.play(c1, c2);
      final expectedNbVoisins = c1.getNbVoisins() / 2;
      expect(expectedNbVoisins, equals(1)); 
    });

    test('Check of the conditions for win game ', () {
      final game = Game();
      game.grid.listCells = [
        [
          Cell(0, 0, CellType.black),
          Cell(0, 1, CellType.none),
          Cell(0, 2, CellType.black),
          Cell(0, 3, CellType.none)
        ],
        [
          Cell(1, 0, CellType.none),
          Cell(1, 1, CellType.none),
          Cell(1, 2, CellType.none),
          Cell(1, 3, CellType.none)
        ],
        [
          Cell(2, 0, CellType.none),
          Cell(2, 1, CellType.none),
          Cell(2, 2, CellType.white),
          Cell(2, 3, CellType.none)
        ],
        [
          Cell(3, 0, CellType.none),
          Cell(3, 1, CellType.none),
          Cell(3, 2, CellType.none),
          Cell(3, 3, CellType.none)
        ]
      ];

      // Add the links of a game won
      game.linkedCells();
      game.play(game.grid.listCells.elementAt(0).elementAt(0),
          game.grid.listCells.elementAt(0).elementAt(1));

      game.play(game.grid.listCells.elementAt(0).elementAt(1),
          game.grid.listCells.elementAt(0).elementAt(2));

      game.play(game.grid.listCells.elementAt(0).elementAt(2),
          game.grid.listCells.elementAt(1).elementAt(2));

      game.play(game.grid.listCells.elementAt(1).elementAt(2),
          game.grid.listCells.elementAt(2).elementAt(2));

      game.play(game.grid.listCells.elementAt(2).elementAt(2),
          game.grid.listCells.elementAt(3).elementAt(2));

      game.play(game.grid.listCells.elementAt(3).elementAt(2),
          game.grid.listCells.elementAt(3).elementAt(1));

      game.play(game.grid.listCells.elementAt(3).elementAt(1),
          game.grid.listCells.elementAt(3).elementAt(0));

      game.play(game.grid.listCells.elementAt(3).elementAt(0),
          game.grid.listCells.elementAt(2).elementAt(0));

      game.play(game.grid.listCells.elementAt(2).elementAt(0),
          game.grid.listCells.elementAt(1).elementAt(0));

      game.play(game.grid.listCells.elementAt(1).elementAt(0),
          game.grid.listCells.elementAt(0).elementAt(0));

      game.lines.forEach((element) => {if(element.linked)print(element)});

/*
      game.play(game.grid.listCells.elementAt(3).elementAt(0),
          game.grid.listCells.elementAt(2).elementAt(0));

      game.play(game.grid.listCells.elementAt(2).elementAt(0),
          game.grid.listCells.elementAt(1).elementAt(0));

      game.play(game.grid.listCells.elementAt(1).elementAt(0),
          game.grid.listCells.elementAt(0).elementAt(0));
*/
      expect(game.checkWin(), equals(true));
    });

    test('Check of the conditions for invalid game ', () {
      final game = Game();
      game.grid.listCells = [
        [
          Cell(0, 0, CellType.black),
          Cell(0, 1, CellType.white),
          Cell(0, 2, CellType.none),
          Cell(0, 3, CellType.black)
        ],
        [
          Cell(1, 0, CellType.none),
          Cell(1, 1, CellType.none),
          Cell(1, 2, CellType.none),
          Cell(1, 3, CellType.none)
        ],
        [
          Cell(2, 0, CellType.none),
          Cell(2, 1, CellType.none),
          Cell(2, 2, CellType.none),
          Cell(2, 3, CellType.none)
        ],
        [
          Cell(3, 0, CellType.none),
          Cell(3, 1, CellType.none),
          Cell(3, 2, CellType.white),
          Cell(3, 3, CellType.black)
        ]
      ];

      // Add the links of a game invalid
      game.linkedCells();
      game.play(game.grid.listCells.elementAt(0).elementAt(0),
          game.grid.listCells.elementAt(0).elementAt(1));

      game.play(game.grid.listCells.elementAt(0).elementAt(1),
          game.grid.listCells.elementAt(0).elementAt(2));

      game.play(game.grid.listCells.elementAt(0).elementAt(2),
          game.grid.listCells.elementAt(0).elementAt(3));

      game.play(game.grid.listCells.elementAt(0).elementAt(3),
          game.grid.listCells.elementAt(1).elementAt(3));

      game.play(game.grid.listCells.elementAt(1).elementAt(3),
          game.grid.listCells.elementAt(1).elementAt(2));

      game.play(game.grid.listCells.elementAt(1).elementAt(2),
          game.grid.listCells.elementAt(2).elementAt(2));

      game.play(game.grid.listCells.elementAt(2).elementAt(2),
          game.grid.listCells.elementAt(2).elementAt(3));

      game.play(game.grid.listCells.elementAt(2).elementAt(3),
          game.grid.listCells.elementAt(3).elementAt(3));

      game.play(game.grid.listCells.elementAt(3).elementAt(3),
          game.grid.listCells.elementAt(3).elementAt(2));

      game.play(game.grid.listCells.elementAt(3).elementAt(2),
          game.grid.listCells.elementAt(3).elementAt(1));

      game.play(game.grid.listCells.elementAt(3).elementAt(1),
          game.grid.listCells.elementAt(3).elementAt(0));

      game.play(game.grid.listCells.elementAt(3).elementAt(0),
          game.grid.listCells.elementAt(2).elementAt(0));

      game.play(game.grid.listCells.elementAt(2).elementAt(0),
          game.grid.listCells.elementAt(1).elementAt(0));

      game.play(game.grid.listCells.elementAt(1).elementAt(0),
          game.grid.listCells.elementAt(0).elementAt(0));

      expect(game.checkWin(), equals(false));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:masyu_puzzle/enum.dart';
import 'package:masyu_puzzle/grid.dart';

void main() {
  /* unit tests for grid */
  group('Grid', () {
    test('gridGenerator() should generate a grid of the given size', () {
      Grid grid = Grid();
      int size = 10;
      grid.gridGenerator(size);
      expect(grid.getlisteCellule().length, equals(size));
      for (var row in grid.getlisteCellule()) {
        expect(row.length, equals(size));
      }
    });

    test('gridGenerator() should set 20% of the cells to black or white', () {
      Grid grid = Grid();
      int size = 10;
      grid.gridGenerator(size);
      int nbPoints = ((size*size)*20)~/100;
      int count = 0;
      for (var row in grid.getlisteCellule()) {
        for (var cell in row) {
          if (cell.color != CellType.none) {
            count++;
          }
        }
      }
      expect(count, equals(nbPoints));
    });
  });
}

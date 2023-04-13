import 'package:flutter_test/flutter_test.dart';

import 'package:masyu_puzzle/enum.dart';
import 'package:masyu_puzzle/line.dart';
import 'package:masyu_puzzle/cell.dart';

void main() {
  /* unit tests for line */
  group('Line', () {
    test('Create a line', () {
      final c1 = Cell(1, 1, CellType.white);
      final c2 = Cell(1, 2, CellType.white);
      final line = Line(c1, c2);

      expect(line.getC1(), equals(c1));
      expect(line.getC2(), equals(c2));
      expect(line.linked, equals(false));
    });

    test('Set the linked property', () {
      final c1 = Cell(1, 1, CellType.white);
      final c2 = Cell(1, 2, CellType.white);
      final line = Line(c1, c2);

      expect(line.linked, equals(false));

      line.linked = true;

      expect(line.linked, equals(true));
    });

    test('Convert line to string', () {
      final c1 = Cell(1, 1, CellType.white);
      final c2 = Cell(1, 2, CellType.white);
      final line = Line(c1, c2);

      expect(line.toString(), equals('($c1<->$c2):false'));
    });
  });
}

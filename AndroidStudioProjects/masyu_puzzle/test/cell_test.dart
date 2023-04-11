// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:masyu_puzzle/enum.dart';
import 'package:masyu_puzzle/cell.dart';

void main() {
  /* unit tests for cell */
  group('Cell tests', () {
    Cell cell = Cell(0, 0, CellType.none);

    setUp(() {
      cell = Cell(0, 0, CellType.none);
    });

    test('getX should return x value', () {
      expect(cell.getX(), equals('0'));
    });

    test('setX should set x value', () {
      cell.setX(1);
      expect(cell.getX(), equals('1'));
    });

    test('getY should return y value', () {
      expect(cell.getY(), equals('0'));
    });

    test('setY should set y value', () {
      cell.setY(1);
      expect(cell.getY(), equals('1'));
    });

    test('toString should return a string representation of cell', () {
      expect(cell.toString(), equals('0 0 CellType.none'));
    });

    test('setColor should set cell color', () {
      cell.setColor(CellType.black);
      expect(cell.getColor(), equals(CellType.black));
    });

    test('getNbVoisins should return number of neighbors', () {
      cell.setNbVoisins();
      expect(cell.getNbVoisins(), equals(1));
    });
  });
}

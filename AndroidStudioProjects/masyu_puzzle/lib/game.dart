import 'cell.dart';
import 'enum.dart';
import 'line.dart';
//import 'dart:math';
import 'grid.dart';

class Game {
  Grid grid = Grid();
  List<Line> lines = [];

  Game();

  List<Line> getLines() {
    return lines;
  }

  void setLines(List<Line> newLines) {
    this.lines = newLines;
  }

  void setGrid(Grid newGrid) {
    this.grid = newGrid;
  }

  void linkedCells() {
    int size = grid.listCells.length;
    // cell top left
    lines.add(Line(grid.listCells.elementAt(0).elementAt(0),
        grid.listCells.elementAt(0).elementAt(1)));
    lines.add(Line(grid.listCells.elementAt(0).elementAt(0),
        grid.listCells.elementAt(1).elementAt(0)));

    // cell bottom-left
    lines.add(Line(grid.listCells.elementAt(size - 1).elementAt(0),
        grid.listCells.elementAt(size - 2).elementAt(0)));
    lines.add(Line(grid.listCells.elementAt(size - 1).elementAt(0),
        grid.listCells.elementAt(size - 1).elementAt(1)));

    // cell top-right
    lines.add(Line(grid.listCells.elementAt(0).elementAt(size - 1),
        grid.listCells.elementAt(0).elementAt(size - 2)));
    lines.add(Line(grid.listCells.elementAt(0).elementAt(size - 1),
        grid.listCells.elementAt(1).elementAt(size - 1)));

    // cell bottom-right
    lines.add(Line(grid.listCells.elementAt(size - 1).elementAt(size - 1),
        grid.listCells.elementAt(size - 1).elementAt(size - 2)));
    lines.add(Line(grid.listCells.elementAt(size - 1).elementAt(size - 1),
        grid.listCells.elementAt(size - 2).elementAt(size - 1)));

    // first and last rows and columns
    for (int i = 1; i < size - 1; i++) {
      // first row
      Cell currentCell1 = grid.listCells.elementAt(0).elementAt(i);
      Cell bottom1 = grid.listCells.elementAt(1).elementAt(i);
      Cell left1 = grid.listCells.elementAt(0).elementAt(i - 1);
      Cell right1 = grid.listCells.elementAt(0).elementAt(i + 1);

      Line lineBottom1 = Line(currentCell1, bottom1);
      Line lineLeft1 = Line(currentCell1, left1);
      Line lineRight1 = Line(currentCell1, right1);

      lines.add(lineBottom1);
      lines.add(lineLeft1);
      lines.add(lineRight1);

      // last row
      Cell currentCell2 = grid.listCells.elementAt(size - 1).elementAt(i);
      Cell top2 = grid.listCells.elementAt(size - 2).elementAt(i);
      Cell left2 = grid.listCells.elementAt(size - 1).elementAt(i - 1);
      Cell right2 = grid.listCells.elementAt(size - 1).elementAt(i + 1);

      Line lineTop2 = Line(currentCell2, top2);
      Line lineLeft2 = Line(currentCell2, left2);
      Line lineRight2 = Line(currentCell2, right2);

      lines.add(lineTop2);
      lines.add(lineLeft2);
      lines.add(lineRight2);

      // first column
      Cell currentCell3 = grid.listCells.elementAt(i).elementAt(0);
      Cell top3 = grid.listCells.elementAt(i - 1).elementAt(0);
      Cell bottom3 = grid.listCells.elementAt(i + 1).elementAt(0);
      Cell right3 = grid.listCells.elementAt(i).elementAt(1);

      Line lineTop3 = Line(currentCell3, top3);
      Line lineBottom3 = Line(currentCell3, bottom3);
      Line lineRight3 = Line(currentCell3, right3);

      lines.add(lineTop3);
      lines.add(lineBottom3);
      lines.add(lineRight3);

      // last column
      Cell currentCell4 = grid.listCells.elementAt(i).elementAt(size - 1);
      Cell top4 = grid.listCells.elementAt(i - 1).elementAt(size - 1);
      Cell bottom4 = grid.listCells.elementAt(i + 1).elementAt(size - 1);
      Cell left4 = grid.listCells.elementAt(i).elementAt(size - 2);

      Line lineTop4 = Line(currentCell4, top4);
      Line lineBottom4 = Line(currentCell4, bottom4);
      Line lineLeft4 = Line(currentCell4, left4);

      lines.add(lineTop4);
      lines.add(lineBottom4);
      lines.add(lineLeft4);
    }

    // the rest of the cells
    for (int i = 1; i < size - 1; i++) {
      for (int j = 1; j < grid.listCells[0].length - 1; j++) {
        Cell currentCell = grid.listCells.elementAt(i).elementAt(j);
        Cell top = grid.listCells.elementAt(i - 1).elementAt(j);
        Cell bottom = grid.listCells.elementAt(i + 1).elementAt(j);
        Cell left = grid.listCells.elementAt(i).elementAt(j - 1);
        Cell right = grid.listCells.elementAt(i).elementAt(j + 1);
        Line lineTop = Line(currentCell, top);
        Line lineBottom = Line(currentCell, bottom);
        Line lineLeft = Line(currentCell, left);
        Line lineRight = Line(currentCell, right);
        lines.add(lineTop);
        lines.add(lineBottom);
        lines.add(lineLeft);
        lines.add(lineRight);
      }
    }
  }

  void play(Cell cell1, Cell cell2) {
    // after see for the change of the linked like a toggle
    for (Line line in lines) {
      if ((line.c1 == cell1 && line.c2 == cell2) ||
          (line.c1 == cell2 && line.c2 == cell1)) {
        if (line.linked == false) {
          line.linked = true;
          cell1.nbVoisins++;
          cell2.nbVoisins++;
        } else {
          line.linked = false;
          cell1.nbVoisins--;
          cell2.nbVoisins--;
        }
        // break; // will see what to do about that
      }
    }
  }

  bool checkCellBlackCondFic(Cell c) {
    for (Line line in lines) {
      if ((line.c1 == c &&
              line.c2.x == c.x - 1 &&
              line.c2.y == c.y &&
              line.linked == true) ||
          (line.c1 == c &&
              line.c2.x == c.x + 1 &&
              line.c2.y == c.y &&
              line.linked == true)) {
        for (Line l in lines) {
          if ((l.c1 == c &&
                  l.c2.x == c.x &&
                  l.c2.y == c.y - 1 &&
                  l.linked == true) ||
              (l.c1 == c &&
                  l.c2.x == c.x &&
                  l.c2.y == c.y + 1 &&
                  l.linked == true)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool checkCellWhiteCondFic(Cell c) {
    for (Line line in lines) {
      if ((line.c1 == c &&
              line.c2.x == c.x - 1 &&
              line.c2.y == c.y &&
              line.linked == true) ||
          (line.c1 == c &&
              line.c2.x == c.x &&
              line.c2.y == c.y - 1 &&
              line.linked == true)) {
        for (Line l in lines) {
          if ((l.c1 == c &&
                  l.c2.x == c.x + 1 &&
                  l.c2.y == c.y &&
                  l.linked == true) ||
              (l.c1 == c &&
                  l.c2.x == c.x &&
                  l.c2.y == c.y + 1 &&
                  l.linked == true)) return true;
        }
      }
    }

    return false;
  }

  bool checkCellBlackCond(Cell c) {
    for (Line line in lines) {
      if (((line.c1 == c &&
                  line.c2.x == c.x - 1 &&
                  line.c2.y == c.y &&
                  line.linked == true) ||
              (line.c1 == c &&
                  line.c2.x == c.x + 1 &&
                  line.c2.y == c.y &&
                  line.linked == true)) &&
          (checkCellWhiteCondFic(line.c2))) {
        print("f");
        for (Line l in lines) {
          if (((l.c1 == c &&
                      l.c2.x == c.x &&
                      l.c2.y == c.y - 1 &&
                      l.linked == true) ||
                  (l.c1 == c &&
                      l.c2.x == c.x &&
                      l.c2.y == c.y + 1 &&
                      l.linked == true)) &&
              (checkCellWhiteCondFic(l.c2))) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool checkCellWhiteCond(Cell c) {
    for (Line line in lines) {
      if ((line.c1 == c &&
              line.c2.x == c.x - 1 &&
              line.c2.y == c.y &&
              line.linked == true) ||
          (line.c1 == c &&
              line.c2.x == c.x &&
              line.c2.y == c.y - 1 &&
              line.linked ==
                  true)) 
      {
        print("deed");
        for (Line l in lines) {
          if (((l.c1 == c &&
                      l.c2.x == c.x + 1 &&
                      l.c2.y == c.y &&
                      l.linked == true) ||
                  (l.c1 == c &&
                      l.c2.x == c.x &&
                      l.c2.y == c.y + 1 &&
                      l.linked == true)) &&
              ((checkCellBlackCondFic(l.c2)) ||
                  (checkCellBlackCondFic(line.c2)))) return true;
        }
      }
    }

    return false;
  }

  bool checkWin() {
    // verify when a game is won
    for (Line l in lines) {
      if (l.linked == true &&
          !(l.c1.nbVoisins ~/ 2 == 2 && l.c2.nbVoisins ~/ 2 == 2)) {
        return false;
      } else {
        if (((l.c1.color == CellType.black) && (!checkCellBlackCond(l.c1))) ||
            ((l.c2.color == CellType.black) && (!checkCellBlackCond(l.c2))) ||
            ((l.c1.color == CellType.white) && (!checkCellWhiteCond(l.c1))) ||
            ((l.c2.color == CellType.white) && (!checkCellWhiteCond(l.c2)))) {
          return false;
        }
      }
    }
    return true;
  }
}

void main() {
  Game game = Game();
  /*game.grid.listCells = [
    [
      Cell(0, 0, CellType.black),Cell(0, 1, CellType.black),Cell(0, 2, CellType.none)
    ],
    [
      Cell(1, 0, CellType.none),Cell(1, 1, CellType.white),Cell(1, 2, CellType.none)
    ],
    [
      Cell(2, 0, CellType.black),Cell(2, 1, CellType.black), Cell(2, 2, CellType.none)
    ]
  ];*/
  
}

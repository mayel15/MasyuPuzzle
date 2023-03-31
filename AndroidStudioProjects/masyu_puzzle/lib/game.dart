import 'cell.dart';
import 'enum.dart';
import 'line.dart';
//import 'dart:math';
import 'grid.dart';

class Game {
  Grid grid = Grid();
  List<Line> lines = [];

  Game();

  void linkedCells() {
    int size = grid.listCells.length;
    // cell top left
    lines.add(Line(grid.listCells[0][0], grid.listCells[0][1]));
    lines.add(Line(grid.listCells[0][0], grid.listCells[1][0]));

    // cell bottom-left
    lines.add(Line(grid.listCells[size - 1][0], grid.listCells[size - 2][0]));
    lines.add(Line(grid.listCells[size - 1][0], grid.listCells[size - 1][1]));

    // cell top-right
    lines.add(Line(grid.listCells[0][size - 1], grid.listCells[0][size - 2]));
    lines.add(
        Line(grid.listCells[0][size - 1], grid.listCells[size - 1][size - 1]));

    // cell bottom-right
    lines.add(Line(grid.listCells[size - 1][size - 1],
        grid.listCells[size - 1][size - 2]));
    lines.add(Line(grid.listCells[size - 1][size - 1],
        grid.listCells[size - 2][size - 2]));

    // first and last rows
    for (int i = 1; i < size - 1; i++) {
      // first row
      Cell currentCell1 = grid.listCells[0][i];
      Cell bottom1 = grid.listCells[1][i];
      Cell left1 = grid.listCells[0][i - 1];
      Cell right1 = grid.listCells[0][i + 1];

      Line lineBottom1 = Line(currentCell1, bottom1);
      Line lineLeft1 = Line(currentCell1, left1);
      Line lineRight1 = Line(currentCell1, right1);

      lines.add(lineBottom1);
      lines.add(lineLeft1);
      lines.add(lineRight1);

      // last row
      Cell currentCell2 = grid.listCells[size - 1][i];
      Cell top2 = grid.listCells[size - 2][i];
      Cell left2 = grid.listCells[size - 1][i - 1];
      Cell right2 = grid.listCells[size - 1][i + 1];

      Line lineTop2 = Line(currentCell2, top2);
      Line lineLeft2 = Line(currentCell2, left2);
      Line lineRight2 = Line(currentCell2, right2);

      lines.add(lineTop2);
      lines.add(lineLeft2);
      lines.add(lineRight2);

      // first column
      Cell currentCell3 = grid.listCells[i][0];
      Cell top3 = grid.listCells[i - 1][0];
      Cell bottom3 = grid.listCells[i + 1][0];
      Cell right3 = grid.listCells[i][1];

      Line lineTop3 = Line(currentCell3, top3);
      Line lineBottom3 = Line(currentCell3, bottom3);
      Line lineRight3 = Line(currentCell3, right3);

      lines.add(lineTop3);
      lines.add(lineBottom3);
      lines.add(lineRight3);

      // last column
      Cell currentCell4 = grid.listCells.elementAt(i).elementAt(size - 1);
      Cell top4 = grid.listCells[i - 1][size - 1];
      Cell bottom4 = grid.listCells[i + 1][size - 1];
      Cell left4 = grid.listCells[i][size - 2];

      Line lineTop4 = Line(currentCell4, top4);
      Line lineBottom4 = Line(currentCell4, bottom4);
      Line lineLeft4 = Line(currentCell4, left4);

      lines.add(lineTop4);
      lines.add(lineBottom4);
      lines.add(lineLeft4);
    }

    // the rest of the cells
    for (int i = 1; i < size - 1; i++) {
      for (int i = 1; i < grid.listCells[0].length - 1; i++) {
        Cell currentCell = grid.listCells[i][i];
        Cell top = grid.listCells[i - 1][i];
        Cell bottom = grid.listCells[i + 1][i];
        Cell left = grid.listCells[i][i - 1];
        Cell right = grid.listCells[i][i + 1];
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

  void chackNbvoisins(){
    for(int i=0; i<grid.listCells.length;i++){
      for(int j=0; j<grid.listCells.length;j++){
        for(Line l in lines){
          if ((l.c1 == grid.listCells[i][j] || l.c2 == grid.listCells[i][j]) && lines[i].linked == true){
            grid.listCells[i][j].setNbVoisins();
          }
        }
      }
    }
  }

  void play(Cell cell1, Cell cell2){
    // after see for the change of the linked like a toggle
    for (Line line in lines){
      if((line.c1 == cell1 && line.c2 == cell2) || (line.c1 == cell2 && line.c2 == cell1)){
        (line.linked == false) ?  true : false;
      }
    }
  }

  bool checkCellBlackCond(Cell c){
    // check the presence 90deg angle
    for( int i=0; i<grid.listCells.length;i++){
      for(Cell c in grid.listCells[i]){
        for(Line line in lines){
          if ((line.c1 == c && line.c2.x == c.x-1 && line.c2.y == c.y && line.linked == true)||(line.c1 == c && line.c2.x == c.x+1 && line.c2.y == c.y && line.linked == true)){
            for(Line l in lines){
              if((l.c1 == c && l.c2.x == c.x && l.c2.y == c.y-1 && l.linked == true) || (l.c1 == c && l.c2.x == c.x && l.c2.y == c.y+1 && l.linked == true)) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
  }

  bool checkCellWhiteCond(Cell c){
    // line between preceded cell and follow cell while passing the white cell
    for( int i=0; i<grid.listCells.length; i++){
      for(Cell c in grid.listCells[i]){
        for(Line line in lines){
          if (line.c1 == c && line.c2.x == c.x-1 && line.c2.y == c.y && line.linked == true){
            for(Line l in lines){
              if (l.c1 == c && l.c2.x == c.x+1 && l.c2.y == c.y && l.linked == true) return true;
            }
          }

          if (line.c1 == c && line.c2.x == c.x && line.c2.y == c.y-1 && line.linked == true){
            for(Line l in lines){
              if(l.c1 == c && l.c2.x == c.x && l.c2.y == c.y+1 && l.linked == true) return true;        
            }
          }
        }
      }
    }
    return false;
  }

  bool checkWin(){
    // verify when a game is won
    for( int i=0; i<grid.listCells.length;i++){
      for(Cell c in grid.listCells[i]){
        if (c.color == CellType.black){
          if (!checkCellBlackCond(c) && c.nbVoisins != 2) return false;
        }
        if (c.color == CellType.black){
          if (!checkCellBlackCond(c) && c.nbVoisins != 2) return false;
        }
        if (c.color == CellType.none){
          if (c.nbVoisins != 2) return false;
        }
      }
    }
    return true;
  }
}

void main(){
  Game game = Game();
  game.grid.gridGenerator(5);
  game.linkedCells();
  print(game.grid.listCells);
  print(game.lines);
}
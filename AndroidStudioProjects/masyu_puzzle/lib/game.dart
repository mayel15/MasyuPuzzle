import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/main.dart';

import 'cell.dart';
import 'enum.dart';
import 'line.dart';
//import 'dart:math';
import 'grid.dart';

class Game {
  Grid grid = Grid();
  List<Line> lines = [];

  Game();

  Grid getGrid(){
    return grid;
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

  /*void checkNbvoisins(){
    for(int i=0; i<grid.listCells.length;i++){
      for(int j=0; j<grid.listCells.length;j++){
        for(Line l in lines){
          if ((l.c1 == grid.listCells.elementAt(i).elementAt(j) || l.c2 == grid.listCells.elementAt(i).elementAt(j)) && lines[i].linked == true){
            grid.listCells.elementAt(i).elementAt(j).setNbVoisins();
          }
        }
      }
    }
  }*/

  void checkNbvoisins(Cell c) {
    for (Line l in lines) {
      if (((l.c1 == c) || l.c2 == c) && (l.linked == true)) {
        c.setNbVoisins();
      }
    }
  }

  List<Cell> liste_choice_button = [];
  bool clickButton(Cell cell, MyAppData myData){
    if(liste_choice_button.length == 0){
      liste_choice_button.add(cell);
      print("premier click");
    }else{
      print("deuxieme click");

      play(liste_choice_button[0], cell);
      myData.addLigne(MyLigne( liste_choice_button[0], cell));
      liste_choice_button.removeAt(0);
      //this.lines.forEach((element)=>{ print(element)});
      return true;
    }
    return false;
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

  bool checkCellBlackCond(Cell c) {
    // check the presence 90deg angle
    for (int i = 0; i < grid.listCells.length; i++) {
      for (Cell c in grid.listCells[i]) {
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
      }
    }
    return false;
  }

  bool checkCellWhiteCond(Cell c) {
    // line between preceded cell and follow cell while passing the white cell
    for (int i = 0; i < grid.listCells.length; i++) {
      for (Cell c in grid.listCells[i]) {
        for (Line line in lines) {
          if (line.c1 == c &&
              line.c2.x == c.x - 1 &&
              line.c2.y == c.y &&
              line.linked == true) {
            for (Line l in lines) {
              if (l.c1 == c &&
                  l.c2.x == c.x + 1 &&
                  l.c2.y == c.y &&
                  l.linked == true) return true;
            }
          }

          if (line.c1 == c &&
              line.c2.x == c.x &&
              line.c2.y == c.y - 1 &&
              line.linked == true) {
            for (Line l in lines) {
              if (l.c1 == c &&
                  l.c2.x == c.x &&
                  l.c2.y == c.y + 1 &&
                  l.linked == true) return true;
            }
          }
        }
      }
    }
    return false;
  }

  /*bool checkWin() {
    // verify when a game is won
    for (int i = 0; i < grid.listCells.length; i++) {
      for (Cell c in grid.listCells[i]) {
        if (c.color == CellType.black) {
          if (!checkCellBlackCond(c) && c.nbVoisins != 2) return false;
        }
        if (c.color == CellType.black) {
          if (!checkCellBlackCond(c) && c.nbVoisins != 2) return false;
        }
        if (c.color == CellType.none) {
          if (c.nbVoisins != 2) return false;
        }
      }
    }
    return true;
  }*/

  bool checkWin() {
    // verify when a game is won
    for(Line l in lines){
      if(!(l.linked == true && l.c1.nbVoisins~/2==2 && l.c2.nbVoisins~/2==2)){
        return false;
      }
      else{
        if ((l.c1.color == CellType.black)&&(!checkCellBlackCond(l.c1))) {
          return false;
        }
        if ((l.c2.color == CellType.black)&&(!checkCellBlackCond(l.c2))) {
          return false;
        }
        if ((l.c1.color == CellType.white) && (!checkCellWhiteCond(l.c1))){
          return false;
        }
        if ((l.c2.color == CellType.white) && (!checkCellWhiteCond(l.c2))){
          return false;
        }
      }

    }
    return true;
  }
}

void main() {
  Game game = Game();
  game.grid.gridGenerator(3);
  game.linkedCells();

  // test nb voisins ok 
  game.play(game.grid.listCells.elementAt(0).elementAt(0), game.grid.listCells.elementAt(0).elementAt(1));
  game.play(game.grid.listCells.elementAt(0).elementAt(0), game.grid.listCells.elementAt(1).elementAt(0));
  game.play(game.grid.listCells.elementAt(1).elementAt(1), game.grid.listCells.elementAt(0).elementAt(1));
  game.play(game.grid.listCells.elementAt(1).elementAt(1), game.grid.listCells.elementAt(1).elementAt(0));

  print(game.grid.listCells);
  game.lines.forEach((element)=>{if(element.linked == true) print(element)});
  print(game.checkWin());
  //game.play(game.grid.listCells.elementAt(0).elementAt(0), game.grid.listCells.elementAt(0).elementAt(1));
  int n = game.grid.listCells.elementAt(0).elementAt(0).getNbVoisins();
  print("voisins: $n");

  //game.checkNbvoisins(game.grid.listCells.elementAt(0).elementAt(0));
  //int m = game.grid.listCells.elementAt(0).elementAt(0).getNbVoisins();
  //print('voisins: $m');
  //print(game.grid.listCells);
  //print(game.lines);
  //game.play(game.grid.listCells.elementAt(0).elementAt(0), game.grid.listCells.elementAt(0).elementAt(1));
  // print(game.lines);
  //print(game.checkWin());

  // print();
}

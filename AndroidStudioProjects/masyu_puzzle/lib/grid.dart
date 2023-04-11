import 'cell.dart';
import 'enum.dart';
import 'line.dart';
import 'dart:math';

class Grid{
  // matrix for represent a grid 
  List<List<Cell>> listCells = [];
  //List<Line> line = [];
  

  Grid();

  List getlisteCellule(){
      return listCells;
  }

  /*void gridGenerator(int nb){
    for(int i=0; i<nb; i++){
      listCells.add([]);
    }
    for(int i=0; i<nb; i++){
      for(int i=0; i<nb; i++){
        listCells.elementAt(i).add(Cell(-1,-1, CellType.none));
      }
      
    }

    int nbPoints = ((nb*nb)*20)~/100; // the number of cells to change the color in black or white 
    int row, col, ch;
    var rand = new Random();
    for(int i=0; i<nbPoints; i++){
      ch = rand.nextInt(100);
      row = rand.nextInt(nb);
      col = rand.nextInt(nb);
      if(listCells.elementAt(row).elementAt(col).color == CellType.none){
        listCells.elementAt(row).elementAt(col).setX(row);
        listCells.elementAt(row).elementAt(col).setY(col);
        if(ch %2 == 0){
          listCells.elementAt(row).elementAt(col).color = CellType.black;
        }
        else{
          listCells.elementAt(row).elementAt(col).color = CellType.white;
        }
      }
    }
  }*/

  void gridGenerator(int nb){
    for(int i=0; i<nb; i++){
      listCells.add([]);
    }
    for(int i=0; i<nb; i++){
      for(int j=0; j<nb; j++){
        listCells.elementAt(i).add(Cell(i, j, CellType.none));
      }
      
    }

    int nbPoints = ((nb*nb)*20)~/100; // the number of cells to change the color in black or white 
    print(nbPoints);
    int row, col, ch;
    var rand = new Random();
    for(int i=0; i<(nbPoints*0.5).toInt(); i++){
      do{
        row = rand.nextInt(nb-2)+1;
        col = rand.nextInt(nb-2)+1;
      }while(listCells.elementAt(row).elementAt(col).color != CellType.none);
      
      listCells.elementAt(row).elementAt(col).color = CellType.white;
      /*listCells.elementAt(row).elementAt(col+((nb-col)/2).toInt()).color = CellType.white;*/ 
    }
    for(int i=0; i<nbPoints-(nbPoints*0.5).toInt(); i++){
      do{
        row = rand.nextInt(nb);
        col = rand.nextInt(nb);
      }while(listCells.elementAt(row).elementAt(col).color != CellType.none);
      
      listCells.elementAt(row).elementAt(col).color = CellType.black;
    }
  }

  void setListeCellule(List<List<Cell>> newListCell){
     listCells = newListCell;
  }
}


void main(){
  //Cell c1 = Cell();
  //Cell c2 = Cell(); 
  //List<List<Cell>> l = [[c1], [c2]];
  Grid g = Grid();
  //var rand = new Random();
  g.gridGenerator(7);
  //print(g.listCells);
  //print(g.listCells.elementAt(0).elementAt(0).getColor());
  //g.listCells.elementAt(0).elementAt(0).setColor(CellType.black);
  for (List<Cell> list in g.listCells){
    print(list);
  } 
  
  // print(rand.nextInt(5));
}
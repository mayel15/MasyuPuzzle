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

  void gridGenerator(int nb){
    // permet d'instancier une grille en spécifiant la lign et la colonne
    //Cell c = Cell(-1, -1, CellType.none); // initial cell with the color none 
    
    // black cells
    //Cell cBlack = Cell();
    //cBlack.color = CellType.black;

    // white cells
    //Cell cWhite = Cell(-1,-1, CellType.none);
    //cWhite.color = CellType.white;

    // black cells
    //Cell cBlack = Cell();
    //cBlack.color = CellType.black;

    // white cells
    //Cell cWhite = Cell();
    //cWhite.color = CellType.white;
    //List<List<Cell>> list = this.listCells;
    
    for(int i=0; i<nb; i++){
      listCells.add([]);
    }
    for(int i=0; i<nb; i++){
      for(int i=0; i<nb; i++){
        listCells.elementAt(i).add(Cell(-1,-1, CellType.none));
      }
      
    }
    
    print(listCells);
   /* print(listCells.toString());
    listCells.elementAt(0);
    listCells.elementAt(0).elementAt(0).setColor(CellType.black);
    print("object");
    print(listCells.toString());*/

    int nbPoints = ((nb*nb)*20)~/100; // the number of cells to change the color in black or white 
    //print('$nbPoints');
    int row, col, ch;
    var rand = new Random();
    for(int i=0; i<nbPoints; i++){
      ch = rand.nextInt(100);
      //print('$ch');
      row = rand.nextInt(nb);
      col = rand.nextInt(nb);
      //print('$row $col');
      if(listCells.elementAt(row).elementAt(col).color == CellType.none){
        listCells.elementAt(row).elementAt(col).setX(row);
        listCells.elementAt(row).elementAt(col).setY(col);
        if(ch %2 == 0){
          //listCells[x][y] = cBlack; // case with black color 
          //listCells.elementAt(row).elementAt(col).color = CellType.black; 
          //listCells.elementAt(row).elementAt(col) = Cell(row, col, CellType.black);
          listCells.elementAt(row).elementAt(col).color = CellType.black;
        }
        else{
          //istCells[x][y] = cWhite; // cells with white color
          //listCells.elementAt(row).elementAt(col).color = CellType.white; 
          listCells.elementAt(row).elementAt(col).color = CellType.white;
        }
      }

      ch = 0;
    }
    /*listCells[1][0].x = 1;
    listCells[0][0].y = 0;*/
    //print(listCells);
    /*for(int k=0; k<nbPoints; k++){
      ch = rand.nextInt(100);
      print('$ch');
      int row = rand.nextInt(nb);
      int col = rand.nextInt(nb); 
      print('$row $col');
      if(listCells.elementAt(row).elementAt(col).color == CellType.none){
        Cell current = listCells.elementAt(row).elementAt(col);
        //current.color = CellType.black;
        //current.setX(row);
        //current.setY(col);
        if(ch%2 == 0){
          // cells withblack color
          current.color = CellType.black;
          current.x = row;
          current.y = col;
        }
        else{
          // cells with white color
          current.color = CellType.white;
          current.x = row;
          current.y = col;
        }
        //print(listCells[x][y]);*/
     /* } 
    }
    return list;
  }*/
  void setListeCellule(List<List<Cell>> newListCell){
     listCells = newListCell;
  }

  }
}


void main(){
  //Cell c1 = Cell();
  //Cell c2 = Cell(); 
  //List<List<Cell>> l = [[c1], [c2]];
  Grid g = Grid();
  //var rand = new Random();
  g.gridGenerator(4);
  //print(g.listCells);
  //print(g.listCells.elementAt(0).elementAt(0).getColor());
  //g.listCells.elementAt(0).elementAt(0).setColor(CellType.black);
  print(g.listCells);
  // print(rand.nextInt(5));
}
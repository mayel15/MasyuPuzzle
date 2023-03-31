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
    Cell c = Cell(); // initial cell with the color none 
    
    // black cells
    //Cell cBlack = Cell();
    //cBlack.color = CellType.black;

    // white cells
    //Cell cWhite = Cell();
    //cWhite.color = CellType.white;

    List<Cell> l = [];
    
    for(int i=0;i<nb; i++){
      l.add(c);
    }
    for(int i=0;i<nb; i++){
      listCells.add(l);
    }

    int nbPoints = ((nb*nb)*20)~/100; // the number of cells to change the color in black or white 
    print('$nbPoints');
    int x, y, ch;
    var rand = new Random();
    for(int i=0; i<nbPoints; i++){
      ch = rand.nextInt(100);
      print('$ch');
      int row = rand.nextInt(nb);
      int col = rand.nextInt(nb);
      print("$row $col");
      while(){
        
      }
      if(listCells[row][col].color == CellType.none){
    
        if(ch%2 == 0){
          // cells withblack color
          Cell cBlack = Cell();
          cBlack.x = row;
          cBlack.y = col;
          listCells[row][col] = cBlack;
        }
        else{
          // cells with white color
          Cell cWhite = Cell();
          cWhite.x = row;
          cWhite.y = col;
          listCells[row][col] = cWhite;
        }
        //print(listCells[x][y]);
      } 
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
  g.gridGenerator(5);
  print(g.listCells);
  // print(rand.nextInt(5));

  
}

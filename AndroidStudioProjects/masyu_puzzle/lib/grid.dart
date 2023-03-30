import 'cell.dart';
import 'enum.dart';
import 'dart:math';

class Grid{
  // matrix for represent a grid 
  List<List<Cell>> listCells = [];
  

  Grid();

  List getlisteCellule(){
      return listCells;
  }

  void setListeCellule(List<List<Cell>> newListCell){
     listCells = newListCell;
  }

  void gridGenerator(int nb){
    // permet d'instancier une grille en spécifiant la lign et la colonne
    Cell c = Cell(); // initial cell with the color none 
    
    // black cells
    Cell cBlack = Cell();
    cBlack.color = CellType.black;

    // white cells
    Cell cWhite = Cell();
    cWhite.color = CellType.white;

    List<Cell> l = [];
    var rand = new Random();
    for(int i=0;i<nb; i++){
      l.add(c);
    }
    for(int i=0;i<nb; i++){
      listCells.add(l);
    }

    int nbPoints = ((nb*nb)*20)~/100; // the number of cells to change the color in black or white 
    int x, y, ch;
    for(int i=0; i<nbPoints; i++){
      ch = rand.nextInt(100);
      x = rand.nextInt(nb);
      y = rand.nextInt(nb);
      if(listCells[x][y].color != Directions.none){
        if(ch %2 == 0){
          listCells[x][y] = cBlack; // case with black color 
          listCells[x][y].x = x;
          listCells[x][y].y = y;
        }
        else{
          listCells[x][y] = cWhite; // cells with white color
          listCells[x][y].x = x;
          listCells[x][y].y = y;
        }
      } 
    }
    

  }

}



void main(){
  Cell c1 = Cell();
  Cell c2 = Cell(); 
  List<List<Cell>> l = [[c1], [c2]];
  Grid g = Grid();
  //var rand = new Random();
  g.gridGenerator(5);
  print(g.listCells);
  //print(rand.nextInt(2));
  
}

import 'cell.dart';
import 'enum.dart';
import 'dart:math';

class Grid{
  /*int nbRows;
  int nbColumns;*/
  List<List<Cell>> listCells = [];
  

  Grid();

  List getlisteCellule(){
      return listCells;
  }

  void setListeCellule(List<List<Cell>> newListCell){
     listCells = newListCell;
  }

  void emptyGrid(nbRows, nbColumns){
    // permet d'instancier une grille en spécifiant la lign et la colonne
    Cell c = Cell();
    List<Cell> l = [];
    for(int i=0;i<nbColumns; i++){
      l.add(c);
    }
    for(int i=0;i<nbRows; i++){
      listCells.add(l);
    }
  }

  void checkWin(){

  }

  
}



void main(){
  Cell c1 = Cell();
  Cell c2 = Cell(); 
  List<List<Cell>> l = [[c1], [c2]];
  Grid g = Grid();
  var rand = new Random();
  g.emptyGrid(2, 2);
  //print(g.listCells);
  //print(rand.nextInt(2));
  
}

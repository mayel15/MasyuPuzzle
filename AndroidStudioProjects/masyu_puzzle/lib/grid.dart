import 'cell.dart';
import 'enum.dart';

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
    Cell c = Cell();
    for(int i=0;i<listCells.length; i++){
      for (int j=0; j<listCells[0].length;j++){
        
      }
    }
  }

}



void main(){
  Cell c1 = Cell();
  Cell c2 = Cell(); 
  List<List<Cell>> l = [[c1], [c2]];
  print(l);
}

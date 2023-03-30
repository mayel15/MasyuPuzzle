import 'cell.dart';

class Grid{
   List<List<Cell>> listCellule = [];

   Grid(List<List<Cell>> listeCellule){
    this.listCellule= listeCellule;
  }

  List getlisteCellule(){
      return listCellule;
  }
  void setListeCellule(List<List<Cell>> newListCell){
     listCellule = newListCell;
  }

}

void main(){
  
}

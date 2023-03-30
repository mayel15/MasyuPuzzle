import 'enum.dart';


class Cell{
  int x = -1;
  int y = -1 ;
  Directions entree = Directions.none;
  Directions sortie = Directions.none;

  CellType color = CellType.none;


  Cell();
  
  //Cell(this.x, this.y, this.direction);

  String getX() {
    return "$x";
  }

  void setX(int x){
    this.x = x;
  }

  String getY(){
    return "$y";
  }

  void setY(int y){
    this.y = y;
  }

  String getEntree(){
    return "$entree";
  }

  void setEntree(Directions entree){
    this.entree = entree;
  }

  String getSortie(){
    return "$sortie";
  }

  void setSortie(Directions sortie){
    this.sortie = sortie;
  }

  String toString(){
    return "(x:$x|y:$y|entree:$entree|sortie:$sortie)";
  }

} 

void main(){
  Cell c = Cell(); 
  print(c.getY());
}
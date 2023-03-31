import 'enum.dart';


class Cell{
  int x ;
  int y ;
  Directions entree;
  Directions sortie;
  CellType color;


  Cell(this.x, this.y, this.entree, this.sortie, this.color);

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

  String getentree(){
    return "$entree";
  }

  String getsortie(){
    return "$sortie";
  }


  String getcolor(){
    return "$color";
  }

  String setcolor(CellType e){
    return "$color";



} 

void main(){
  Cell c = Cell(1, 2, Directions.top); 
  print(c.getY());
}
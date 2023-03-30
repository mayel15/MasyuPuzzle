import 'enum.dart';


class Cell{
  int x ;
  int y ;
  Directions direction;

  Cell(this.x, this.y, this.direction);

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

  String getDirection(){
    return "$direction";
  }

} 

void main(){
  Cell c = Cell(1, 2, Directions.top); 
  print(c.getY());
}
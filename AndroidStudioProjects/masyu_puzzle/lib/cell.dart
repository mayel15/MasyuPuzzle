import 'enum.dart';


class Cell{
  int x = -1;
  int y = -1 ;
  int nbVoisins = 0;
  

  CellType color = CellType.none;


  Cell(this.x, this.y, this.color);

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

  String toString(){
    //return "(x:$x|y:$y|entree:$entree|sortie:$sortie)";
    return '$x $y $color';
    
  }

  void setNbVoisins(){
    nbVoisins++;
  }

  CellType getColor(){
    return color;
  }

  void setColor(CellType color){
    this.color = color;
  }
  
  int getNbVoisins(){
    return nbVoisins;
  }

  // to be able to convert in json
  Map<String, dynamic> toJson() => {'x': x, 'y': y, 'color': color.toString().split('.').last};

  // to be able to get the values from a json
  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(json['x'], json['y'], fromStringToCellType(json['color']));
  }

} 

void main(){
  /* mini test */
  Cell c = Cell(-1, -1, CellType.none); 
  print(c.getY()); 
}
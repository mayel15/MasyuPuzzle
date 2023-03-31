import 'cell.dart';

class Line{
  Cell c1;
  Cell c2;
  bool linked = false;

  Line(this.c1, this.c2);

  Cell getC1(){
    return c1;
  }

  void setC1(Cell c1){
    this.c1 = c1;
  }

  void setC2(Cell c2){
    this.c2 = c2;
  }

  Cell getC2(){
    return c2;
  }

  String toString(){
    return '($c1<->$c2):$linked';
  }
}
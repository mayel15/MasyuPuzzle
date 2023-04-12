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

  // to be able to convert in json
  Map<String, dynamic> toJson() => {'c1': c1.toJson(), 'c2': c2.toJson(), 'linked': linked};

  // to be able to get the values from a json
  factory Line.fromJson(Map<String, dynamic> json) {
    Line line = Line(Cell.fromJson(json['c1']), Cell.fromJson(json['c2']));
    line.linked = json['linked'];
    return line;
  }
}
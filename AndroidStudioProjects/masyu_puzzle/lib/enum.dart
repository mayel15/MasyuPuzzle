import 'dart:ui';

enum CellType{
  black(Color(0XFF0FF000)),
  white(Color(0XFFFF00FF)),
  none(Color(0XFFE4DCCF));

  final Color color;
  const CellType(this.color);
}


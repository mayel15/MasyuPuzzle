import 'dart:ui';

enum CellType{
  black(Color(0XFF000000)),
  white(Color(0XFFFFFFFF)),
  none(Color(0XFFE4DCCF));

  final Color color;
  const CellType(this.color);
}

// for convert a string to CellType
CellType fromStringToCellType(String celltypeString) {
  CellType celltype = CellType.values.firstWhere((e) => e.toString().split('.').last == celltypeString);
  return celltype;
}

enum CellType{
  black,
  white,
  none
}


CellType fromStringToCellType(String celltypeString) {
  CellType celltype = CellType.values.firstWhere((e) => e.toString().split('.').last == celltypeString);
  return celltype;
}

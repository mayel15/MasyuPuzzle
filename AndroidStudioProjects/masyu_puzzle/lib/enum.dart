enum CellType{
  black,
  white,
  none
}

// for convert a string to CellType
CellType fromStringToCellType(String celltypeString) {
  CellType celltype = CellType.values.firstWhere((e) => e.toString().split('.').last == celltypeString);
  return celltype;
}

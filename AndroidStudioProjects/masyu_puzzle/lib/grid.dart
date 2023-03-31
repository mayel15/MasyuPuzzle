import 'Cell.dart';
import 'enum.dart';

class Grid{
   List<List<Cell>> listCellule = [];

   Grid(List<List<Cell>> listeCellule){
    this.listCellule= listeCellule;
  }

  List getlisteCellule(){
      return listCellule;
  }
  void setListeCellule(List<List<Cell>> newListCell){
     listCellule = newListCell;
  }

}

////Pause
//ma fonction prend une liste en parametre une liste des cellules
//qui ont ete utilisé pour faire le shema classé par ordre de debut et de fin
//de cette facon on vas tester en faisant la boucle
//il  faut que chaque fois que le gar clique  dans un ordre precis. soit dans le sens horaire soit dans le sens anti horaire
bool gridIsOk(List<Cell> gridResolu){
  //On doit passer à travers les cercles blancs en ligne droite, mais la boucle doit tourner dans la cellule précédente et/ou suivante.
  // - La boucle doit tourner sur les cercles noirs et aller tout droit dans la cellule précédente et la cellule suivante.
  List<Cell> whiteCell=[];
  List<Cell> blackCell=[];
  List<Cell> otherCell=[];
  var a;
  for (var i = 0; i < gridResolu.length; i++) {
    if(i==0) {
      a = -1;
    }
    else {
      a = i-1;
    }
    //ici on test la condition de validité des cellules autour de la cellule courante. Si c'est blanc ya ses spec , si c'est noir aussi ya ses spec
    if (gridResolu[i].color == CellType.white) {
      whiteCell.add(gridResolu[i]);
      if((gridResolu[i+1].getentree()==Directions.left &&
          gridResolu[i+1].getsortie()!=Directions.right) &&
          (gridResolu[a].getentree()==Directions.left &&
          gridResolu[a].getsortie()!=Directions.right)) {
        return false;
      }
      if((gridResolu[i+1].getentree()==Directions.right &&
          gridResolu[i+1].getsortie()!=Directions.left) &&
          (gridResolu[a].getentree()==Directions.right &&
              gridResolu[a].getsortie()!=Directions.left)) {
        return false;
      }
      if((gridResolu[i+1].getentree()==Directions.top &&
          gridResolu[i+1].getsortie()!=Directions.bottom) &&
          (gridResolu[a].getentree()==Directions.top &&
              gridResolu[a].getsortie()!=Directions.bottom)) {
        return false;
      }
      if((gridResolu[i+1].getentree()==Directions.bottom &&
          gridResolu[i+1].getsortie()!=Directions.top) &&
          (gridResolu[a].getentree()==Directions.bottom &&
              gridResolu[a].getsortie()!=Directions.top)) {
        return false;
      }

    };

    if (gridResolu[i].color == CellType.black) {
      blackCell.add(gridResolu[i]);
      if((gridResolu[i+1].getentree()==Directions.left &&
          gridResolu[i+1].getsortie()!=Directions.right) ||
          (gridResolu[a].getentree()==Directions.left &&
              gridResolu[a].getsortie()!=Directions.right)) {
        return false;
      }
      if((gridResolu[i+1].getentree()==Directions.right &&
          gridResolu[i+1].getsortie()!=Directions.left) ||
          (gridResolu[a].getentree()==Directions.right &&
              gridResolu[a].getsortie()!=Directions.left)) {
        return false;
      }
      if((gridResolu[i+1].getentree()==Directions.top &&
          gridResolu[i+1].getsortie()!=Directions.bottom) ||
          (gridResolu[a].getentree()==Directions.top &&
              gridResolu[a].getsortie()!=Directions.bottom)) {
        return false;
      }
      if((gridResolu[i+1].getentree()==Directions.bottom &&
          gridResolu[i+1].getsortie()!=Directions.top) ||
          (gridResolu[a].getentree()==Directions.bottom &&
              gridResolu[a].getsortie()!=Directions.top)) {
        return false;
      }
    }
    else {
      otherCell.add(gridResolu[i]);
    }
  }

  //ici c'est les spec de validité des cellules courantes en fonction de leurs courleurs
  for (var j = 0; j < whiteCell.length; j++) {
    if ((whiteCell[j].entree == Directions.top &&
        whiteCell[j].sortie != Directions.bottom) ||
        (whiteCell[j].entree == Directions.bottom &&
            whiteCell[j].sortie != Directions.top)) {
      return false;
    }
    if ((whiteCell[j].entree == Directions.left &&
        whiteCell[j].sortie != Directions.right) ||
        (whiteCell[j].entree == Directions.right &&
            whiteCell[j].sortie != Directions.left)) {
      return false;
    }

  }
  for(var k = 0; k < blackCell.length; k++) {
    if ((blackCell[k].entree == Directions.left &&
        blackCell[k].entree == Directions.right) ||
        (blackCell[k].entree == Directions.right &&
            blackCell[k].entree == Directions.left)) {
      return false;
    }
    if ((blackCell[k].entree == Directions.top &&
        blackCell[k].entree == Directions.bottom) ||
        (blackCell[k].entree == Directions.bottom &&
            blackCell[k].entree == Directions.top)) {
      return false;
    }
  }
 // si on arrive ici c'est que la grille est valide
  return true;
}


void main() {
  Cell c1= Cell(1, 1, Directions.right, Directions.bottom, CellType.black);
  Cell c2= Cell(2, 1, Directions.top, Directions.bottom,CellType.none);
  Cell c3= Cell(3, 1, Directions.top, Directions.bottom,CellType.none);
  Cell c4= Cell(4, 1, Directions.top, Directions.right,CellType.none);
  Cell c5= Cell(4, 2, Directions.left, Directions.right,CellType.none);
  Cell c6= Cell(4, 3, Directions.left, Directions.right,CellType.none);
  Cell c7= Cell(4, 4, Directions.left, Directions.top,CellType.white);
  Cell c8= Cell(4, 3, Directions.bottom, Directions.top,CellType.black);
  Cell c9= Cell(4, 2, Directions.bottom, Directions.top,CellType.none);
  Cell c10= Cell(4, 1, Directions.bottom, Directions.top,CellType.none);
  Cell c11= Cell(1, 4, Directions.bottom, Directions.left,CellType.black);
  Cell c12= Cell(1, 3, Directions.right, Directions.left,CellType.none);
  Cell c13= Cell(1, 2, Directions.right, Directions.left,CellType.white);


  List<Cell> gridResolu= [];
  gridResolu.add(c1);
  gridResolu.add(c2);
  gridResolu.add(c2);
  gridResolu.add(c3);
  gridResolu.add(c4);
  gridResolu.add(c5);
  gridResolu.add(c6);
  gridResolu.add(c7);
  gridResolu.add(c8);
  gridResolu.add(c9);
  gridResolu.add(c10);
  gridResolu.add(c11);
  gridResolu.add(c12);
  gridResolu.add(c13);

  gridIsOk(gridResolu);


}
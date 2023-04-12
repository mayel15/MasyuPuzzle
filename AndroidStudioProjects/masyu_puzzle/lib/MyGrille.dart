import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/MyButton.dart';
import 'package:masyu_puzzle/cell.dart';
import 'package:masyu_puzzle/enum.dart';
import 'package:masyu_puzzle/game.dart';
import 'package:masyu_puzzle/grid.dart';


class MyGameContext extends InheritedWidget {
  MyAppData gameData; // Etat de l'application à partager

  MyGameContext({Key? key, required this.gameData, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyGameContext oldWidget) {
    return true;
  }

  static MyGameContext of(BuildContext context) {
    return ((context.dependOnInheritedWidgetOfExactType<MyGameContext>())
    as MyGameContext);
  }
}


class MyGrille extends StatefulWidget {
  const MyGrille({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyGrille();


}

class _MyGrille extends State<MyGrille> {

  @override
  Widget build(BuildContext context) {
    double largeurWidthEcran = MediaQuery
        .of(context)
        .size
        .width;
    double hauteurHeightEcran = MediaQuery
        .of(context)
        .size
        .height;
    int taille = 6;

    MyAppData data = MyGameContext
        .of(context)
        .gameData;
    data.data.grid.gridGenerator(taille);
    Grid g = data.data.grid;
    data.data.linkedCells();
    return Scaffold(
        body: Stack(
          children: [
            // Place the grid lines painter at the bottom
            CustomPaint(
              painter: GridLinesPainter(gridSize: taille),
              child: Container(),
            ),
            CustomPaint(
              painter: BackgroundLinePainter(
                  0.3,
                  0.5,
                  data.lignes,
                  largeurWidthEcran,
                  hauteurHeightEcran,
                  taille,
                  data.counter
              ),
              child: Container(),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: hauteurHeightEcran*0.01),
              mainAxisSpacing: hauteurHeightEcran*0.0125,
              crossAxisCount: taille,
              children: List.generate(taille * taille, (index) {
                int lig = (index / g.listCells.length).floor();
                int col = index % g.listCells.length;
                CellType myColor = g.listCells[lig][col].getColor();
                Color color;
                color = myColor.color;
                return Column(
                  children: <Widget>[
                    MyButton(myValue: g.listCells[lig][col], myColor: color),

                  ],
                );
              }),
            ),
          ],
        )
    );
  }
}

class BackgroundLinePainter extends CustomPainter {
  final double verticalPosition;
  final double lineWidthPercentage;
  final List<MyLigne> l;
  double largeurWidthEcran;
  double hauteurHeightEcran;
  int tailleTab;

  BackgroundLinePainter(this.verticalPosition, this.lineWidthPercentage, this.l, this.largeurWidthEcran, this.hauteurHeightEcran, this.tailleTab,  Listenable repaint): super(repaint: repaint);



  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;

    for(int i = 0; i < l.length; ++i){

      //Vérifier si les deux cellules sont voisines
      bool isAdjacent = (l[i].cellStart.x == l[i].cellEnd.x && (l[i].cellStart.y - l[i].cellEnd.y).abs() == 1) ||
      (l[i].cellStart.y == l[i].cellEnd.y && (l[i].cellStart.x - l[i].cellEnd.x).abs() == 1);

      // Vérifier si la ligne est verticale ou horizontale
      if ((l[i].cellStart.x == l[i].cellEnd.x || l[i].cellStart.y == l[i].cellEnd.y) && isAdjacent) {

        if(l[i].cellStart.x == l[i].cellEnd.x){
          double startX = 17 + l[i].cellStart.y *  largeurWidthEcran/tailleTab;
          double startY =  35+ l[i].cellStart.x * largeurWidthEcran/tailleTab;
          double endX = 17 + l[i].cellEnd.y * largeurWidthEcran/tailleTab;
          double endY =  35 + l[i].cellEnd.x * largeurWidthEcran/tailleTab  ;
          canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
        }
        else{
          double startX = 13 + l[i].cellStart.y *  largeurWidthEcran/tailleTab;
          double startY =  35+ l[i].cellStart.x * largeurWidthEcran/tailleTab;
          double endX = 10 + l[i].cellEnd.y * largeurWidthEcran/tailleTab;
          double endY =  35 + l[i].cellEnd.x * largeurWidthEcran/tailleTab  ;
          canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
        }
        /*
        print("Début X: " + l[i].cellStart.x.toString());
        print("Début Y: " + l[i].cellStart.y.toString());
        print("End X: " + l[i].cellEnd.x.toString());
        print("End Y: " + l[i].cellEnd.y.toString());

        print("startx: $startX - starty $startY");
        print("endX: $endX - endy $endY");*/
      }
    }
  }


  @override
  bool shouldRepaint(BackgroundLinePainter oldDelegate) {
    return oldDelegate.l.length != l.length;
  }
}

class GridLinesPainter extends CustomPainter {
  final int gridSize;
  final double strokeWidth;
  final Color color;

  GridLinesPainter({required this.gridSize, this.strokeWidth = 1.0, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double cellWidth = size.width / gridSize;
    double cellHeight = size.height / gridSize;

    for (int i = 1; i < gridSize; i++) {
      // Draw horizontal lines
      canvas.drawLine(Offset(0, cellHeight * i), Offset(size.width, cellHeight * i), paint);
      // Draw vertical lines
      canvas.drawLine(Offset(cellWidth * i, 0), Offset(cellWidth * i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

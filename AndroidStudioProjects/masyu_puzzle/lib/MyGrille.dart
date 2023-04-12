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
  const MyGrille({super.key});

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
              crossAxisCount: taille,
              children: List.generate(taille*taille, (index) {
                int lig = (index / g.listCells.length).floor() as int;
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
    print("toot");

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 15;

    for(int i = 0; i < l.length; ++i){


      double startX = 17 + l[i].cellStart.y *  largeurWidthEcran/tailleTab;
      double startY =   l[i].cellStart.x * largeurWidthEcran/tailleTab;
      double endX = 17 + l[i].cellEnd.y * largeurWidthEcran/tailleTab;
      double endY =   l[i].cellEnd.x * largeurWidthEcran/tailleTab  ;
      /*
      print("Début X: " + l[i].cellStart.x.toString());
      print("Début Y: " + l[i].cellStart.y.toString());
      print("End X: " + l[i].cellEnd.x.toString());
      print("End Y: " + l[i].cellEnd.y.toString());

      print("startx: $startX - starty $startY");
      print("endX: $endX - endy $endY");*/

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
    /*
    final startY = 175 * verticalPosition;
    final endY = 175 * verticalPosition;

    final startX = 600 * (1 - lineWidthPercentage) / 2;
    final endX = size.width - startX;

    canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);*/
  }

  @override
  bool shouldRepaint(BackgroundLinePainter oldDelegate) {
    return oldDelegate.l.length != l.length;
  }
}
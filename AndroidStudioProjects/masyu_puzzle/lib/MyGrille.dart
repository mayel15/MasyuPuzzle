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

    int taille = 8;

    Game game = MyGameContext
        .of(context)
        .gameData
        .data;
    game.grid.gridGenerator(taille);
    Grid g = game.grid;
    game.linkedCells();
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1,
            maxCrossAxisExtent: (hauteurHeightEcran * 0.9) / taille,


          ),
          itemCount: g.listCells.length * g.listCells.length,
          itemBuilder: (BuildContext ctx, index) {
            int lig = (index / g.listCells.length).floor() as int;
            int col = index % g.listCells.length;
            CellType myColor = g.listCells[lig][col].getColor();
            Color color;
            color = myColor.color;
            return FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.5,
              child: MyButton(myValue: g.listCells[lig][col], myColor: color),
            );
          }),
    );
  }
}

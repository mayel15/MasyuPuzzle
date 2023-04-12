import 'package:flutter/material.dart';
import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/MyGrille.dart';
import 'package:masyu_puzzle/cell.dart';
import 'package:masyu_puzzle/game.dart';

class MyButton extends StatelessWidget {
  final Cell myValue;
  final Color myColor;

  MyButton({required this.myValue, required  this.myColor}) ;

  @override
  Widget build(BuildContext context) {
    int x =  int.parse(myValue.getX());
    int y = int.parse(myValue.getY());
    String display_cell = '$x  $y';

    return ElevatedButton(
        child: Text('$display_cell'),
        onPressed: () {
          //print('My value $display_cell');
          MyAppData data = MyGameContext.of(context).gameData;
          data.data.clickButton(data.data.grid.listCells[x][y], data);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: myColor,
            shape: CircleBorder()
        )
    );
  }
}
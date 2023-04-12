import 'package:flutter/material.dart';
import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/MyGrille.dart';
import 'package:masyu_puzzle/cell.dart';
import 'package:masyu_puzzle/game.dart';

class MyButton extends StatelessWidget {
  final Cell myValue;
  final Color myColor;

  MyButton({required this.myValue, required  this.myColor}) ;

  List<double> getButtonPosition(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final double x = position.dy;
    final double y = position.dx;
    return [x, y];
  }


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
          List<double> pos = getButtonPosition(context);
          data.data.clickButton(data.data.grid.listCells[x][y], data, pos[0],pos[1]);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: myColor,
            shape: CircleBorder()
        )
    );
  }
}
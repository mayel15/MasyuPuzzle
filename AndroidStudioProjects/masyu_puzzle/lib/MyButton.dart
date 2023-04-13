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
    final double x = position.dx + MediaQuery.of(context).size.width*0.022;
    final double y = position.dy;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Get the GridView's top padding and mainAxisSpacing.
    final double gridViewTopPadding = MediaQuery.of(context).size.height * 0.01;
    final double gridViewMainAxisSpacing = MediaQuery.of(context).size.height * 0.0125;

    // Calculate the corrected Y position.
    final double correctedY = y- MediaQuery.of(context).size.height*0.17; //- 4*(appBarHeight - statusBarHeight - gridViewTopPadding - gridViewMainAxisSpacing);

    return [x, correctedY];
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
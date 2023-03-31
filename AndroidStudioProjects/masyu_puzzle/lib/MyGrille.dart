import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGrille extends StatefulWidget {
  const MyGrille({super.key});

  @override
  State<StatefulWidget> createState() => _MyGrille();
}

class _MyGrille extends State<MyGrille> {
  @override
  Widget build(BuildContext context) {
    double largeurWidthEcran = MediaQuery.of(context).size.width;
    double hauteurHeightEcran = MediaQuery.of(context).size.height;

    final List<Map> MyGrille =
    List.generate(12, (index) => {"id": index, "name": "$index"}).toList();

    MyGrille.replaceRange(2, 8, List.generate(6, (index) => {"id": index, "name": "99"}).toList());
    MyGrille.replaceRange(9,11, List.generate(6, (index) => {"id": index, "name": "55"}).toList());

    return Scaffold(
        body:GridView.builder(
          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1 ,
                 maxCrossAxisExtent: largeurWidthEcran/4

          ),
            itemCount: MyGrille.length,
            itemBuilder: (BuildContext ctx, index) {
            String myText = MyGrille[index]["name"];
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    ),
                child: (myText == "99") ? Text("toto"):
                Container(
                    child: (myText == "55") ? Text("BONK"):
                        Text("LALA")
                )
              );
            }),
    );
  }
}

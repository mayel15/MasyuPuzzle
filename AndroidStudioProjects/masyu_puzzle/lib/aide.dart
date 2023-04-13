import 'package:flutter/material.dart';
import 'package:masyu_puzzle/screen_game.dart';
void main() => runApp(new Aide());


class Aide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var largeurWidthEcran = MediaQuery.of(context).size.width;
    var hauteurHeightEcran = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Aide',
      home: Scaffold(
        //Here you can set what ever background color you need.
        backgroundColor: Color(0xFFea5455),
        body:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children:[
                  SizedBox(width: largeurWidthEcran*0.02),
                  Image.asset("asset/image/drapeau.png",
                  height: hauteurHeightEcran*0.11,
                  width: largeurWidthEcran*0.11),
                  SizedBox(width: largeurWidthEcran*0.03),
                  Text("Aide",style: TextStyle(fontFamily: 'Langar',fontSize: 40))
                  ]),
              Container(
                margin: const EdgeInsets.all(16),
                child : const Text("Les règles sont simples. Il faut dessiner des lignes entre les points pour former une boucle unique sans croisement."
                  "La boucle doit passer à travers tous les cercles blancs et noirs de la façon suivante :\n"
                  "- On doit passer à travers les cercles blancs en ligne droite, mais la boucle doit tourner dans la cellule précédente et/ou suivante.\n"
                  "- La boucle doit tourner sur les cercles noirs et aller tout droit dans la cellule précédente et la cellule suivante.",
                  style: TextStyle(fontFamily: 'Langar',fontSize: 24))),

              SizedBox(height: hauteurHeightEcran*0.05),
        SizedBox(
            height: hauteurHeightEcran*0.085,
            width: largeurWidthEcran*0.72,
            child :ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  },
                style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFF002B5B)),
                child: const Text('OK',   style: TextStyle(fontFamily: 'Langar',fontSize: 28)),
              ),
            ),
        ),
            ]
        ),

      ),
    );
  }
}
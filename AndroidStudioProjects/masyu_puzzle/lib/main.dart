import 'package:flutter/material.dart';
import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/MyGrille.dart';
import 'package:masyu_puzzle/chrono.dart';
import 'package:masyu_puzzle/game.dart';
import 'package:masyu_puzzle/grid.dart';
import 'package:masyu_puzzle/partie_enregistre.dart';
import 'package:masyu_puzzle/screen_game.dart';

import 'aide.dart';
void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Accueil(),
        '/screengame': (context) => MyScreenGame(),
        '/aide': (context) => Aide(),
        '/enregistrepartie': (context) =>  EnregistrePartie(),
      },
    );
  }
}


class Accueil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var largeurWidthEcran = MediaQuery.of(context).size.width;
    var hauteurHeightEcran = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Masyu',
      home: Scaffold(
        //Here you can set what ever background color you need.
        backgroundColor: Color(0xFFea5455),
        body: Center(child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Masyu Puzzle",
                  style: TextStyle(fontFamily: 'Langar',fontSize: 55)),

              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'asset/image/accueil_masyu.jpg',
                  height: hauteurHeightEcran*0.250,
                  width: largeurWidthEcran*0.500,
                ),
              ),
              SizedBox(height: hauteurHeightEcran*0.04),
              SizedBox(
                height: hauteurHeightEcran*0.085,
                width: largeurWidthEcran*0.72,
                child :ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int taille = 4;
                      MyAppData data = MyAppData(Game());
                      data.setTaille(taille);
                      data.data.grid.gridGenerator(taille);
                      Navigator.pushNamed(
                      context,
                      '/screengame',
                        arguments:data,
                      );},
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFF002B5B)),
                    child: const Text('Facile',   style: TextStyle(fontFamily: 'Langar',fontSize: 28)),
                  ),
                ),
              ),
              SizedBox(height: hauteurHeightEcran*0.02),
              SizedBox(
                height: hauteurHeightEcran*0.085,
                width: largeurWidthEcran*0.72,
                child :ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int taille = 5;
                      MyAppData data = MyAppData(Game());
                      data.setTaille(taille);
                      data.data.grid.gridGenerator(taille);
                      Navigator.pushNamed(
                        context,
                        '/screengame',
                        arguments:data,
                    );},
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFF002B5B)),
                    child: const Text('Intermediaire',   style: TextStyle(fontFamily: 'Langar',fontSize: 28)),
                  ),
                ),
              ),
              SizedBox(height: hauteurHeightEcran*0.02),
              SizedBox(
                height: hauteurHeightEcran*0.085,
                width: largeurWidthEcran*0.72,
                child :ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int taille = 6;
                      MyAppData data = MyAppData(Game());
                      data.setTaille(taille);
                      data.data.grid.gridGenerator(taille);
                      Navigator.pushNamed(
                        context,
                        '/screengame',
                        arguments:data,
                    );},
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFF002B5B)),
                    child: const Text('Difficile',   style: TextStyle(fontFamily: 'Langar',fontSize: 28)),
                  ),
                ),
              ),
              SizedBox(height: hauteurHeightEcran*0.02),
              SizedBox(
                height: hauteurHeightEcran*0.085,
                width: largeurWidthEcran*0.72,
                child :ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int taille = 7;
                      MyAppData data = MyAppData(Game());
                      data.setTaille(taille);
                      data.data.grid.gridGenerator(taille);
                      Navigator.pushNamed(
                        context,
                        '/screengame',
                        arguments:data,
                    );},
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFF002B5B)),
                    child: const Text('Démoniaque',   style: TextStyle(fontFamily: 'Langar',fontSize: 28)),
                  ),
                ),
              ),
              SizedBox(height: hauteurHeightEcran*0.02),
              SizedBox(
                height: hauteurHeightEcran*0.085,
                width: largeurWidthEcran*0.72,
                child :ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushNamed(
                      context,
                      '/enregistrepartie',
                    );},
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFF002B5B)),
                    child: const Text('Parties enregitrées',   style: TextStyle(fontFamily: 'Langar',fontSize: 28)),
                  ),
                ),
              ),
            ]
        ),
        ),
      ),
    );
  }
}
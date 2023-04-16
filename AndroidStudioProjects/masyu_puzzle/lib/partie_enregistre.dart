import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/charge_game.dart';
import 'package:masyu_puzzle/save_game.dart';

import 'game.dart';
import 'grid.dart'; // Importez le fichier où se trouve la fonction `getNumberOfGames()`

class EnregistrePartie extends StatefulWidget {
  const EnregistrePartie({super.key});

  @override
  State<StatefulWidget> createState() => _EnregistrePartie();
}

class _EnregistrePartie extends State<EnregistrePartie> {
  int numberOfGames =0;

  @override
  void initState() {
    super.initState();
    loadNumberOfGames();
  }

  void loadNumberOfGames() async {
    numberOfGames = await getNumberOfGames();
    setState(() {});
  }


  Future<void> loadGameAndNavigate(BuildContext context, int index) async {
    setState(() async {
      Game g = await chargeGame(index);
      MyAppData data = MyAppData(g);
      data.setTaille(g.grid.getlisteCellule().length);
      if(data.taille == 4){
        data.setDifficulte('Facile');
      }
      else if(data.taille == 5){
        data.setDifficulte('Intermédiaire');
      }
      else if(data.taille == 6){
        data.setDifficulte('Difficile');
      }
      else{
        data.setDifficulte('Démoniaque');
      }
      Navigator.pushNamed(
        context,
        '/screengame',
        arguments: data,
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    double largeurWidthEcran = MediaQuery.of(context).size.width;
    double hauteurHeightEcran = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEA5455),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: hauteurHeightEcran*0.09),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: SizedBox(
              height: hauteurHeightEcran*0.06,
              width: largeurWidthEcran*0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF002B5B),
                  ),
                  child: const Text(
                    'Retour',
                    style: TextStyle(fontFamily: 'Langar', fontSize: 23),
                  ),
                ),
              ),
            ),
          ),
      SizedBox(height: hauteurHeightEcran*0.03),
      Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Parties Enregistrées',
                style: TextStyle(fontFamily: 'Langar', fontSize: 28),
              ),
            ],
          ),
        ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  numberOfGames == null
                      ? CircularProgressIndicator()
                      : Expanded(
                    child: ListView.builder(
                      itemCount: numberOfGames,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Partie ${index + 1}',style: TextStyle(fontFamily: 'Langar',fontSize: 28),),
                          trailing: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF002B5B),
                                ),
                                onPressed: () => loadGameAndNavigate(context, index),
                                child: Text('Charger',style:TextStyle(fontFamily: 'Langar',fontSize: 23)),
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

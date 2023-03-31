import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScreenGame extends StatefulWidget {
  const MyScreenGame({super.key});

  @override
  State<StatefulWidget> createState() => _MyScreenGame();
}

class _MyScreenGame extends State<MyScreenGame> {
  @override
  Widget build(BuildContext context) {
    double largeurWidthEcran = MediaQuery.of(context).size.width;
    double hauteurHeightEcran = MediaQuery.of(context).size.height;
    double opaciteWin = 0;
    bool isWin = false;
    return Scaffold(
        backgroundColor: Color(0xffEA5455),
        body: SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, hauteurHeightEcran * 0.04, 0, 0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: largeurWidthEcran * 0.06),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: largeurWidthEcran * 0.175,
                                height: hauteurHeightEcran * 0.06,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: Color(0xFF002B5B)),
                                  child: const Text('Retour',
                                      style: TextStyle(
                                          fontFamily: 'Langar', fontSize: 18)),
                                ),
                              ),
                            ),
                          ),
                          const Text("Facile",
                              style: TextStyle(fontFamily: 'Langar', fontSize: 28)),
                        ]),
                    Container(
                      color: const Color(0xffEA5455),
                      child: const Text("⏱️00:00:22",
                          style: TextStyle(fontFamily: 'Langar', fontSize: 28)),
                    ),
                    SizedBox(height: hauteurHeightEcran * 0.02),
                    SizedBox(
                      height: hauteurHeightEcran * 0.55,
                      width: largeurWidthEcran * 0.9,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF002B5B)),
                        child: const Text('Ma grille',
                            style: TextStyle(fontFamily: 'Langar', fontSize: 28)),
                      ),
                    ),
                    SizedBox(height: hauteurHeightEcran * 0.03),
                    Column(
                      children: [
                        SizedBox(
                          width: largeurWidthEcran,
                          height: hauteurHeightEcran * 0.06,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                opaciteWin = 1;
                                isWin = true;
                                print("C'est gagné! ");
                                print("Opacité:  " + opaciteWin.toString());
                                print("isWin: " + isWin.toString());
                              },
                              child: Text('Soumettre',
                                  style: TextStyle(
                                      fontFamily: 'Langar', fontSize: 28)),
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Color(0xFF002B5B)),
                            ),
                          ),
                        ),
                        SizedBox(height: hauteurHeightEcran * 0.02),
                        SizedBox(
                          width: largeurWidthEcran,
                          height: hauteurHeightEcran * 0.06,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: const Color(0xFF002B5B)),
                              child: const Text('Enregistrer',
                                  style: TextStyle(
                                      fontFamily: 'Langar', fontSize: 28)),
                            ),
                          ),
                        ),
                        SizedBox(height: hauteurHeightEcran * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: largeurWidthEcran * 0.5,
                              height: hauteurHeightEcran * 0.06,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: Color(0xFF002B5B)),
                                  child: const Text('Reset',
                                      style: TextStyle(
                                          fontFamily: 'Langar', fontSize: 28)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: largeurWidthEcran * 0.5,
                              height: hauteurHeightEcran * 0.06,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Aide',
                                      style: TextStyle(
                                          fontFamily: 'Langar', fontSize: 28)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: Color(0xFF002B5B)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),
                ),
                if(isWin) BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text("C'est gagné",
                            style: TextStyle(
                                fontFamily: 'Langar',
                                fontSize: 28,
                                color: Colors.white)),
                      ),
                      SizedBox(
                        width: largeurWidthEcran * 0.4,
                      ),
                      Align(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('ACCEUIL',
                                style: TextStyle(fontFamily: 'Langar', fontSize: 28)),
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }
}

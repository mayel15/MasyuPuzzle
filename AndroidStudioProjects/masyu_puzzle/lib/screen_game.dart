import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masyu_puzzle/chrono.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:masyu_puzzle/MyAppData.dart';
import 'package:masyu_puzzle/MyGrille.dart';
import 'package:masyu_puzzle/game.dart';

class MyScreenGame extends StatefulWidget {
  const MyScreenGame({super.key});

  @override
  State<StatefulWidget> createState() => _MyScreenGame();
}

class _MyScreenGame extends State<MyScreenGame> {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;
  bool isWin = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _audioPlayer, prefix: 'asset/music/');

    _playAudio();
  }

  void _playAudio() async {
    await _audioCache.loop('game_song.mp3');
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Chronometer c1 = Chronometer();
    double largeurWidthEcran = MediaQuery.of(context).size.width;
    double hauteurHeightEcran = MediaQuery.of(context).size.height;
    double opaciteWin = 1;
    final data = ModalRoute
        .of(context)!
        .settings
        .arguments as MyAppData;
      print("taille " + data.taille.toString());

    return Scaffold(
        backgroundColor: Color(0xffEA5455),
        body: SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, hauteurHeightEcran * 0.01, 0, 0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: largeurWidthEcran * 0.06),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: largeurWidthEcran * 0.250,
                                height: hauteurHeightEcran * 0.06,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/',
                                    );
                                    _stopAudio();
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
                      child: c1,
                    ),
                    SizedBox(height: hauteurHeightEcran * 0.02),
                    SizedBox(
                      height: hauteurHeightEcran * 0.50,
                      width: largeurWidthEcran * 0.90,
                      child: MyGameContext(gameData: data, child: MyGrille()),
                    ),
                    SizedBox(height: hauteurHeightEcran * 0.05),
                    Column(
                      children: [
                        SizedBox(
                          width: largeurWidthEcran,
                          height: hauteurHeightEcran * 0.06,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _stopAudio();
                                  opaciteWin = 0;
                                  isWin = true;
                                  print("C'est gagné! ");
                                  print("Opacité:  " + opaciteWin.toString());
                                  print("isWin: " + isWin.toString());
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Color(0xFF002B5B)),
                              child: const Text('Soumettre',
                                  style: TextStyle(
                                      fontFamily: 'Langar', fontSize: 28)),
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
                              onPressed: () {
                              },
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
                                  onPressed: () {
                                    setState(() {
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: Color(0xFF002B5B)
                                  ),
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                        fontFamily: 'Langar',
                                        fontSize: 28
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: largeurWidthEcran * 0.5,
                              height: hauteurHeightEcran * 0.06,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: ElevatedButton(
                                  onPressed: () {Navigator.pushNamed(
                                    context,
                                    '/aide',
                                  );},
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
                                color: Colors.black)),
                      ),
                      SizedBox(
                        width: largeurWidthEcran * 0.4,
                      ),
                      Align(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(
                                  context,
                                  '/',
                                );
                              });

                            },
                            child: const Text('ACCUEIL',
                                style: TextStyle(fontFamily: 'Langar', fontSize: 28)),
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }
}
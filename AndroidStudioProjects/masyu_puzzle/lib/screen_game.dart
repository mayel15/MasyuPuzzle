import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScreenGame extends StatefulWidget{
  const MyScreenGame({super.key});

  @override
  State<StatefulWidget> createState() => _MyScreenGame();
}

class _MyScreenGame extends State<MyScreenGame>{
  @override
  Widget build(BuildContext context) {
    var largeurWidthEcran = MediaQuery.of(context).size.width;
    var hauteurHeightEcran = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEA5455),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Container(
            color: Color(0xffEA5455),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: largeurWidthEcran*0.25,
                  height: hauteurHeightEcran*0.06,
                  child :ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Retour',   style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Color(0xFF002B5B)),
                    ),
                  ),
                ),
                Text("Facile"),
              ],
            ),
          ),
          Container(
            color: Color(0xffEA5455),
            child: Text("⏱️00:00:22",style: TextStyle(fontWeight: FontWeight.bold)),
          ),
            SizedBox(height: hauteurHeightEcran*0.02),

        SizedBox(height: hauteurHeightEcran*0.5, width: largeurWidthEcran*0.9,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Ma grille',   style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom( backgroundColor: Color(0xFF002B5B)),
              ),
            ),
            SizedBox(height: hauteurHeightEcran*0.015),

            Column(
              children: [
                SizedBox(
                  width: largeurWidthEcran,
                  height: hauteurHeightEcran*0.06,
                  child :ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Soumettre',   style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Color(0xFF002B5B)),
                    ),
                  ),
                ),

                SizedBox(height: hauteurHeightEcran*0.015),
                SizedBox(
                  width: largeurWidthEcran,
                  height: hauteurHeightEcran*0.06,
                  child :ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Enregistrer',   style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Color(0xFF002B5B)),
                    ),
                  ),
                ),

                SizedBox(height: hauteurHeightEcran*0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(
                      width: largeurWidthEcran*0.5,
                      height: hauteurHeightEcran*0.06,
                      child :ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Reset',   style: TextStyle(fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Color(0xFF002B5B)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: largeurWidthEcran*0.5,
                      height: hauteurHeightEcran*0.06,
                      child :ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Aide',   style: TextStyle(fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(shape: StadiumBorder(), backgroundColor: Color(0xFF002B5B)),
                        ),
                      ),
                    ),

                  ],
                )
              ],

            )

        ]
      ),
    );
  }
}


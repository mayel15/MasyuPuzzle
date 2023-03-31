import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnregistrePartie extends StatefulWidget {
  const EnregistrePartie({super.key});

  @override
  State<StatefulWidget> createState() => _EnregistrePartie();
}

class _EnregistrePartie extends State<EnregistrePartie> {
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
          Expanded(
            child: Container(
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
          ),
        ],
      ),
    );
  }
}

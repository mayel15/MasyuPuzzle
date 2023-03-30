import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Masyu',
      home: Scaffold(
        //Here you can set what ever background color you need.
        backgroundColor: Color(0xFFea5455),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Masyu Puzzle",
              style: TextStyle(fontFamily: 'Langar',fontSize: 55)),
              Image.asset('accueil_masyu.jpg'),
            ]
        ),
      ),
    );
  }
}
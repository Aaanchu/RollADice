import 'package:flutter/material.dart';
import 'package:dice/HomePage.dart';

void main() {
  runApp(Dice());
}

class Dice extends StatelessWidget {
  const Dice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

import 'package:paradice/dice.dart';
import 'dart:math';

class Dice10 extends Dice{
  Dice10() : super(10);

  @override
  void lancer() {
    res = Random().nextInt(10) + 1;
  }
}
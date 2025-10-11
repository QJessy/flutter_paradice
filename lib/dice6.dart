import 'package:paradice/dice.dart';
import 'dart:math';

class Dice6 extends Dice {
  Dice6() : super(6);

  @override
  void lancer() {
    res = Random().nextInt(6) + 1;
  }
}
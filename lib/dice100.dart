import 'package:paradice/dice.dart';
import 'dart:math';

class Dice100 extends Dice {
  Dice100() : super(100);

  @override
  void lancer() {
    res = Random().nextInt(100) + 1;
  }
}
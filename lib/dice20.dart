import 'package:paradice/dice.dart';
import 'dart:math';

class Dice20 extends Dice {
  Dice20() : super(20);

  @override
  void lancer() {
    res = Random().nextInt(20) + 1;
  }
}
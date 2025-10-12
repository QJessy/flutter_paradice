import 'package:paradice/classes/dice.dart';
import 'dart:math';

// Classe Dice6 en héritage de la classe Dice qui réecris la méthode "lancer" pour permettre de réaliser le lancer de dés avec le dés à 6 faces
class Dice6 extends Dice {
  Dice6() : super(6);

  @override
  void lancer() {
    res = Random().nextInt(6) + 1;
  }
}
import 'package:paradice/classes/dice.dart';
import 'dart:math';

// Classe Dice100 en héritage de la classe Dice qui réecris la méthode "lancer" pour permettre de réaliser le lancer de dés avec le dés à 100 faces
class Dice100 extends Dice {
  Dice100() : super(100);

  @override
  void lancer() {
    res = Random().nextInt(100) + 1;
  }
}
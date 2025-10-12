import 'package:paradice/dice.dart';
import 'dart:math';

// Classe Dice20 en héritage de la classe Dice qui réecris la méthode "lancer" pour permettre de réaliser le lancer de dés avec le dés à 20 faces
class Dice20 extends Dice {
  Dice20() : super(20);

  @override
  void lancer() {
    res = Random().nextInt(20) + 1;
  }
}
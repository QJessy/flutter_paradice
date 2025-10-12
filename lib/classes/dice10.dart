import 'package:paradice/classes/dice.dart';
import 'dart:math';

// Classe Dice10 en héritage de la classe Dice qui réecris la méthode "lancer" pour permettre de réaliser le lancer de dés avec le dés à 10 faces
class Dice10 extends Dice{
  Dice10() : super(10);

  @override
  void lancer() {
    res = Random().nextInt(10) + 1;
  }
}
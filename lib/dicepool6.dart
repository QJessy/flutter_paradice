import 'package:paradice/dice6.dart';
import 'package:paradice/dicepool.dart';

class Dicepool6 extends Dicepool {
  Dicepool6() {
    addDice();
  }

  @override
  void addDice() {
    lesDices.add(Dice6());
  }
}
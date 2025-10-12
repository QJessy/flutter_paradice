import 'package:paradice/classes/dice6.dart';
import 'package:paradice/classes/dicepool.dart';

class Dicepool6 extends Dicepool {
  Dicepool6() {
    addDice();
  }

  @override
  void addDice() {
    lesDices.add(Dice6());
  }
}
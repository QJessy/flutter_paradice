import 'package:paradice/dice10.dart';
import 'package:paradice/dicepool.dart';

class Dicepool10 extends Dicepool {
  Dicepool10() {
    addDice();
  }

  @override
  void addDice() {
    lesDices.add(Dice10());
  }
}
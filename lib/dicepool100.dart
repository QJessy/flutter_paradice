import 'package:paradice/dice100.dart';
import 'package:paradice/dicepool.dart';

class Dicepool100 extends Dicepool {
  Dicepool100() {
    addDice();
  }

  @override
  void addDice() {
    lesDices.add(Dice100());
  }
}
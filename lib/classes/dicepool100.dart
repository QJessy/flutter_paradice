import 'package:paradice/classes/dice100.dart';
import 'package:paradice/classes/dicepool.dart';

class Dicepool100 extends Dicepool {
  Dicepool100() {
    addDice();
  }

  @override
  void addDice() {
    lesDices.add(Dice100());
  }
}
import 'package:paradice/classes/dice20.dart';
import 'package:paradice/classes/dicepool.dart';

class Dicepool20 extends Dicepool {
  Dicepool20() {
    addDice();
  }

  @override
  void addDice() {
    lesDices.add(Dice20());
  }
}
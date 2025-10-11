import 'package:flutter/rendering.dart';
import 'package:paradice/dice.dart';

abstract class Dicepool {
  List<Dice> lesDices = [];
  List<int> lesResultats = [];

  Dicepool();
  
  void addDice() {}

  List<int> getLesResultats() {
    return lesResultats;
  }

  List<Dice> getLesDices() {
    return lesDices;
  }

  void removeDice() {
    if (lesDices.isNotEmpty) {
      lesDices.removeLast();
    }
  }

  int getNbDices() {
    return lesDices.length;
  }

  void lancerLesDices() {
    initTabResultats();
    for (Dice unDice in lesDices) {
      unDice.lancer();
      lesResultats.add(unDice.getRes());
    }
  }

  void initTabResultats() {
    lesResultats.clear();
  }

  List<int> calculResultat() {
    // Trouver le nombre maximum de faces parmi tous les dés
    int maxFaces = 0;
    for (var dice in lesDices) {
      if (dice.getNbFaces() > maxFaces) {
        maxFaces = dice.getNbFaces();
      }
    }
    
    // Créer une liste avec maxFaces+1 éléments (index 0 inutilisé)
    List<int> occurrences = List.filled(maxFaces + 1, 0);
    
    // Compter les occurrences
    for (var result in lesResultats) {
      if (result <= maxFaces) {
        occurrences[result]++;
      }
    }
    
    return occurrences;
  }

  double calculMoyenne() {
    int total = 0;
    for (int unResultat in lesResultats) {
      total = total + unResultat;
    }
    return total / getNbDices();
  }
}
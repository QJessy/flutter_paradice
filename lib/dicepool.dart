import 'package:flutter/rendering.dart';
import 'package:paradice/dice.dart';

// Classe abstraite qui va être utilisée comme héritage pour les classes dicepool6.dart, dicepool10.dart, dicepool20.dart, dicepool100.dart
abstract class Dicepool {
  List<Dice> lesDices = [];
  List<int> lesResultats = [];

  // Constructeur de la classe Dicepool
  Dicepool();

  // Getter
  List<int> getLesResultats() {
    return lesResultats;
  }

  List<Dice> getLesDices() {
    return lesDices;
  }

  // Méthode astraite réecris dans les autres classes en héritage de Dicepool
  void addDice() {}

  // Méthode permettant d'enlever un dés
  void removeDice() {
    if (lesDices.isNotEmpty) {
      lesDices.removeLast();
    }
  }

  // Méthode permettant de récupérer la taille de liste "LesDices" pour savoir le nombre de dés à jouer
  int getNbDices() {
    return lesDices.length;
  }

  // Méthode permettant d'effectué le lancer de dés en utilisant une boucle dans la liste "LesDices"
  void lancerLesDices() {
    initTabResultats();
    for (Dice unDice in lesDices) {
      unDice.lancer();
      lesResultats.add(unDice.getRes());
    }
  }

  // Méthode permettant d'initialiser le tableau des résultats (on vide le tableau)
  void initTabResultats() {
    lesResultats.clear();
  }

  void calculResultat() {
  
  }

  // Fonction qui va calculer la moyenne du lancer de dés
  double calculMoyenne() {
    int total = 0;
    for (int unResultat in lesResultats) {
      total = total + unResultat;
    }
    return total / getNbDices();
  }
}

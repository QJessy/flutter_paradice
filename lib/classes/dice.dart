// Classe abstraite qui va être utilisée comme héritage pour les classes dice6.dart, dice10.dart, dice20.dart, dice100.dart
abstract class Dice {
  int nbFace = 0;
  int res = 0;

  // Constructeur de la classe Dice
  Dice(this.nbFace);

  // Getter
  int getNbFaces() {
    return nbFace;
  }

  int getRes() {
    return res;
  }

  // Méthode astraite réecris dans les autres classes en héritage de Dice
  void lancer() {}
}
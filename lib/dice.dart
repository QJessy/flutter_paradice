abstract class Dice {
  int nbFace = 0;
  int res = 0;

  Dice(this.nbFace);

  int getNbFaces() {
    return nbFace;
  }

  int getRes() {
    return res;
  }

  void lancer() {}
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paradice/classes/dicepool.dart';
import 'package:paradice/classes/dicepool6.dart';
import 'package:paradice/classes/dicepool10.dart';
import 'package:paradice/classes/dicepool20.dart';
import 'package:paradice/classes/dicepool100.dart';

class StatistiquesScreen extends StatefulWidget {
  const StatistiquesScreen({super.key, required this.title});
  final String title;

  @override
  State<StatistiquesScreen> createState() => _StatistiquesScreenState();
}

class _StatistiquesScreenState extends State<StatistiquesScreen> {
  // Déclaration des variables nécessaires au fonctionnement de l'application
  int typeDes = 0;
  Dicepool desActuel = Dicepool6();
  String nomDes = '6';
  List<int> occurrences = [];
  double moyenneDes = 0;

  // Switch case permettant de séléctionner le type de dés avec lequel on veut jouer
  void changerTypeDes(int type) {
    typeDes = type;
    switch (type) {
      case 0:
        desActuel = Dicepool6();
        nomDes = '6';
        break;
      case 1:
        desActuel = Dicepool10();
        nomDes = '10';
        break;
      case 2:
        desActuel = Dicepool20();
        nomDes = '20';
        break;
      case 3:
        desActuel = Dicepool100();
        nomDes = '100';
        break;
    }
    setState(() {});
  }

  // Méthode permettant d'ajouter 1 dès au compteur du nombre de dés total
  void ajouterDes() {
    desActuel.addDice();
    setState(() {});
  }

  // Méthode permettant d'ajouter 10 dès au compteur du nombre de dés total
  void ajouterDixDes() {
    for (int i = 0; i < 10; i++) {
      desActuel.addDice();
    }
    setState(() {});
  }

  // Méthode permettant de retirer 1 dés au compteur du nombre de dés total
  void retirerDes() {
    if (desActuel.getNbDices() > 0 && desActuel.getNbDices() != 1) {
      desActuel.removeDice();
      setState(() {});
    }
  }

  // Méthode permettant de retirer 10 dès au compteur du nombre de dés total
  void retirerDixDes() {
    if (desActuel.getNbDices() > 0) {
      if (desActuel.getNbDices() <= 10) {
        desActuel.lesDices.clear();
        desActuel.addDice();
      } else {
        for (int i = 0; i < 10; i++) {
          desActuel.removeDice();
        }
      }
    }
    setState(() {});
  }

  // Méthode pour remettre le compteur de nombre de dés à 1
  void resetDes() {
    desActuel.lesDices.clear();
    desActuel.addDice();
    setState(() {});
  }

  // Méthode permettant de lancer les dés en utilisant les méthodes/fonctions crée dans dicepool.dart
  void lancerDes() {
    desActuel.lancerLesDices();
    desActuel.calculResultat();
    moyenneDes = desActuel.calculMoyenne();
    setState(() {});
  }

  // Widget permettant de créer l'affichage des statistiques avec les occurances pour chaque face
  Widget affichageResultats() {
    int nbFaces = 0;

    // Permet de vérifier que la liste "LesDices" possède un dés :
    //    - Si oui, nbFaces va récupérer comme valeur le nombre de face du dés utilisés
    //    - Sinon, nbFaces prend par défaut le dés à 6 faces
    if (desActuel.getLesDices().isNotEmpty) {
      nbFaces = desActuel.getLesDices()[0].getNbFaces();
    } else {
      nbFaces = 6;
    }

    // Création de tableau des occurances en le remplissant avec des 0 sur le nombre de faces que le dé possède + 1 (car la face 0 existe pas)
    List<int> occurrences = List.filled(nbFaces + 1, 0);
    for (int UnResultat in desActuel.getLesResultats()) {
      if (UnResultat >= 1 && UnResultat <= nbFaces) {
        occurrences[UnResultat]++;
      }
    }

    List<Widget> colonneGauche = [];
    List<Widget> colonneDroite = [];

    // Permet de calculer le nombre d'occurances qu'une face est tombé pendant le lancer de dés
    // et ceci pour le nombre de face qu'il y a si le nombre est pas tombé alors on met 0 par défaut
    for (int i = 1; i <= nbFaces; i++) {
      int compteur = 0;
      if (i < occurrences.length) {
        compteur = occurrences[i];
      }

      // On crée un widget "Ligne" qui va permettre de créer l'affichage des lignes "Nombre de .. : .." en utilisant l'index de la boucle à chaque tour
      Widget ligne = Container(
        child: Text(
          'Nombre de $i: $compteur',
          style: const TextStyle(fontSize: 16),
        ),
      );

      // Va permettre de créer 2 colonnes pour améliorer la présentation des statistiques
      // Les faces impaires à gauche, les faces paires à droite
      if (i % 2 != 0) {
        colonneGauche.add(ligne);
      } else {
        colonneDroite.add(ligne);
      }
    }

    // Permet de créer l'affichage en ligne en utilisant les infos stockés dans "colonneGauche" et "colonneDroite" et en utilisant un SingleChildScrollView pour éviter que les statstiques remplissent toute la page
    return Container(
      height: 5 * 28, // Hauteur fixe pour 5 lignes
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: colonneGauche,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: colonneDroite,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        title: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Color.fromARGB(225, 255, 255, 255)),
            ),
          ],
        ),
        elevation: 8,
        shadowColor: Colors.black.withValues(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF2E7D32),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/paradice_logo.png',
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 3,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    // Permet de créer les boutons de sélection du type de dès en utilisant la méthode contenant le switch case du choix de dés
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => changerTypeDes(0),
                          child: Text(
                            "D6",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => changerTypeDes(1),
                          child: Text(
                            "D10",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => changerTypeDes(2),
                          child: Text(
                            "D20",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => changerTypeDes(3),
                          child: Text(
                            "D100",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Bouton permettant de gérer l'ajout, le retrait ou le reset du nombre de dés total à jouer (utilisation des méthodes correspondantes)
                        ElevatedButton(
                          onPressed: retirerDixDes,
                          child: Text(
                            "-10",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: retirerDes,
                          child: Text(
                            "-1",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: resetDes,
                          child: Text(
                            "1",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: ajouterDes,
                          child: Text(
                            "+1",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: ajouterDixDes,
                          child: Text(
                            "+10",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Permet d'informer à l'utilisateur du type de dés utilisés (D6, D10, D20, D100) et le nombre de dés au total à jouer tout en étant responsive à la taille de l'écran
                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nombre de D$nomDes: ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal, // Pas en gras
                              color: Colors.black, // Couleur noire normale
                            ),
                          ),
                          TextSpan(
                            text: '${desActuel.getNbDices()}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold, // En gras
                              color: Color(0xFF2E7D32), // Vert de l'application
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Ecris un texte "Les résultats" tout en étant responsive à la taille de l'écran
                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      'Les résultats :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Utilise la fonction "affichageResultats" permettant d'afficher les lignes pour chaque face utilisé tout en étant responsive à la taille de l'écran
                  affichageResultats(),

                  // Permet d'afficher la moyenne obtenue sur le lancer de dés effectué
                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      'Moyenne obtenue: ${moyenneDes.toStringAsFixed(1)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bouton permettant de lancer les dés
      floatingActionButton: FloatingActionButton(
        onPressed: lancerDes,
        tooltip: 'Lancer les dés',
        child: const FaIcon(FontAwesomeIcons.dice),
      ),
    );
  }
}

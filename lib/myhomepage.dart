import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paradice/dicepool.dart';
import 'package:paradice/dicepool6.dart';
import 'package:paradice/dicepool10.dart';
import 'package:paradice/dicepool20.dart';
import 'package:paradice/dicepool100.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int typeDes = 0;
  Dicepool desActuel = Dicepool6();
  String nomDes = '';
  List<int> occurrences = [];
  double moyenneDes = 0;

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

  void ajouterDes() {
    desActuel.addDice();
    setState(() {});
  }

  void ajouterDixDes() {
    for (int i = 0; i < 10; i++) {
      desActuel.addDice();
    }
    setState(() {});
  }

  void retirerDes() {
    if (desActuel.getNbDices() > 0 && desActuel.getNbDices() != 1) {
      desActuel.removeDice();
      setState(() {});
    }
  }

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

  void resetDes() {
    desActuel.lesDices.clear();
    desActuel.addDice();
    setState(() {});
  }

  void lancerDes() {
    desActuel.lancerLesDices();
    occurrences = desActuel.calculResultat();
    moyenneDes = desActuel.calculMoyenne();
    setState(() {});
  }

  Widget affichageResultats() {
    return Text('---------- A FAIRE -----------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => changerTypeDes(0),
                    child: Text("D6"),
                  ),
                  ElevatedButton(
                    onPressed: () => changerTypeDes(1),
                    child: Text("D10"),
                  ),
                  ElevatedButton(
                    onPressed: () => changerTypeDes(2),
                    child: Text("D20"),
                  ),
                  ElevatedButton(
                    onPressed: () => changerTypeDes(3),
                    child: Text("D100"),
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
                  ElevatedButton(onPressed: retirerDixDes, child: Text("-10")),
                  ElevatedButton(onPressed: retirerDes, child: Text("-1")),
                  ElevatedButton(onPressed: resetDes, child: Text("1")),
                  ElevatedButton(onPressed: ajouterDes, child: Text("+1")),
                  ElevatedButton(onPressed: ajouterDixDes, child: Text("+10")),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(
                'Nombre de D$nomDes: ${desActuel.getNbDices()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(
                'Les résultats :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            affichageResultats(),

            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(
                'Moyenne obtenue: ${moyenneDes.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lancerDes,
        tooltip: 'Lancer les dés',
        child: const FaIcon(FontAwesomeIcons.dice),
      ),
    );
  }
}

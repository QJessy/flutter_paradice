import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nbDes = 1;
  int nbUn = 0;
  int nbDeux = 0;
  int nbTrois = 0;
  int nbQuatre = 0;
  int nbCinq = 0;
  int nbSix = 0;
  double moyenneDes = 0;

  void lancerDes() {
    nbUn = 0;
    nbDeux = 0;
    nbTrois = 0;
    nbQuatre = 0;
    nbCinq = 0;
    nbSix = 0;
    int total = 0;

    for (int i = 0; i < nbDes; i++) {
      int resultat = Random().nextInt(6) + 1;
      total = total + resultat;

      switch (resultat) {
        case 1:
          nbUn++;
          break;
        case 2:
          nbDeux++;
          break;
        case 3:
          nbTrois++;
          break;
        case 4:
          nbQuatre++;
          break;
        case 5:
          nbCinq++;
          break;
        case 6:
          nbSix++;
          break;
      }
    }

    moyenneDes = total / nbDes;
    setState(() {});
  }

  void dUn() {
    nbDes = 1;
    setState(() {});
  }

  void dPlusUn() {
    nbDes++;
    setState(() {});
  }

  void dMinusUn() {
    if (nbDes > 1) {
      nbDes--;
    }
    setState(() {});
  }

  void dPlusDix() {
    nbDes = nbDes + 10;
    setState(() {});
  }

  void dMinusDix() {
    if (nbDes < 10) {
      nbDes = 1;
    } else {
      nbDes = nbDes - 10;
    }
    setState(() {});
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
                MediaQuery.of(context).size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: dMinusDix, child: Text("-10")),
                  ElevatedButton(onPressed: dMinusUn, child: Text("-1")),
                  ElevatedButton(onPressed: dUn, child: Text("1")),
                  ElevatedButton(onPressed: dPlusUn, child: Text("+1")),
                  ElevatedButton(onPressed: dPlusDix, child: Text("+10")),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(
                'Nombre de D6: $nbDes',
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

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Nombre de 1: $nbUn'),
                    Text('Nombre de 4: $nbQuatre'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Nombre de 2: $nbDeux'),
                    Text('Nombre de 5: $nbCinq'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Nombre de 3: $nbTrois'),
                    Text('Nombre de 6: $nbSix'),
                  ],
                ),
              ],
            ),

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

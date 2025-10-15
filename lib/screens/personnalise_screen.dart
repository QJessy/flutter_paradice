import 'package:flutter/material.dart';
import 'package:paradice/classes/dice.dart';
import 'package:paradice/classes/dice10.dart';
import 'package:paradice/classes/dice100.dart';
import 'package:paradice/classes/dice20.dart';
import 'package:paradice/classes/dice6.dart';

class PersonaliseScreen extends StatefulWidget {
  const PersonaliseScreen({super.key, required this.title});
  final String title;

  @override
  State<PersonaliseScreen> createState() => _PersonaliseScreenState();
}

class ResultatDes {
  final int faces;
  int nombre;
  int somme;

  ResultatDes(this.faces, this.nombre, this.somme);
}

class _PersonaliseScreenState extends State<PersonaliseScreen> {
  String _valeurSaisie = '';
  final _formKey = GlobalKey<FormState>();
  List<Dice> lesDicesPersonnalises = [];

  void addDice(int faces) {
    switch (faces) {
      case 6:
        lesDicesPersonnalises.add(Dice6());
        break;
      case 10:
        lesDicesPersonnalises.add(Dice10());
        break;
      case 20:
        lesDicesPersonnalises.add(Dice20());
        break;
      case 100:
        lesDicesPersonnalises.add(Dice100());
        break;
    }
    setState(() {});
    print(lesDicesPersonnalises.length);
  }

  void viderPool() {
    lesDicesPersonnalises.clear();
  }

  void ajouterDePersonnalise() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personnalisé',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2E7D32),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Nombre de faces",
                        ),
                        validator: (valeur) {
                          if (valeur == null || valeur.isEmpty) {
                            return 'Veuillez entrer un nombre de faces';
                          } else {
                            _valeurSaisie = valeur.toString();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text('Ajouter'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.02,
              ),
              // Permet de créer les boutons de sélection du type de dès en utilisant la méthode contenant le switch case du choix de dés
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => addDice(6),
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
                    onPressed: () => addDice(10),
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
                    onPressed: () => addDice(20),
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
                    onPressed: () => addDice(100),
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
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => viderPool(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Color.fromARGB(225, 255, 255, 255),
                    ),
                    child: const Text('Vider le pool de dés'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2E7D32),
                      foregroundColor: Color.fromARGB(225, 255, 255, 255),
                    ),
                    child: const Text('Lancer les dés'),
                  ),
                ],
              ),
            ),

            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[500],
            ),

            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Center(
                child: Text(
                  'Les résultats :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nb faces',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nb dés',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Résultat',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Moyenne',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

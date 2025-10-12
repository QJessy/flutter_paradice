import 'package:flutter/material.dart';
import 'package:paradice/classes/dicepool.dart';
import 'package:paradice/classes/dicepool10.dart';
import 'package:paradice/classes/dicepool100.dart';
import 'package:paradice/classes/dicepool20.dart';
import 'package:paradice/classes/dicepool6.dart';

class PersonaliseScreen extends StatefulWidget {
  const PersonaliseScreen({super.key, required this.title});
  final String title;

  @override
  State<PersonaliseScreen> createState() => _PersonaliseScreenState();
}

class _PersonaliseScreenState extends State<PersonaliseScreen> {
  int typeDes = 0;
  Dicepool desActuel = Dicepool6();
  TextEditingController facesController = TextEditingController();

  @override
  void changerTypeDes(int type) {
    typeDes = type;
    switch (type) {
      case 0:
        desActuel = Dicepool6();
        break;
      case 1:
        desActuel = Dicepool10();
        break;
      case 2:
        desActuel = Dicepool20();
        break;
      case 3:
        desActuel = Dicepool100();
        break;
    }
    setState(() {});
  }

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
                        color: Color(0xFF2E7D32),
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
                        color: Color(0xFF2E7D32),
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
                        color: Color(0xFF2E7D32),
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
                        color: Color(0xFF2E7D32),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2E7D32),
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
                      child: Text('...', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('...', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '...',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '...',
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

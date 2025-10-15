import 'package:flutter/material.dart';
import 'package:paradice/screens/statistiques_screen.dart';
import 'package:paradice/screens/personnalise_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: TextStyle(color: Color.fromARGB(225, 255, 255, 255)),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 8,
        shadowColor: Colors.black.withValues(),
      ),
      // Ajout d'un drawer qui quand on appuie sur le logo en question, ça ouvre un panel sur la gauche où on peut se rediriger vers les pages existantes
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(height: 1, width: 200, color: Colors.grey[500]),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Permet quand on clique sur le texte de nous amener vers la page
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const StatistiquesScreen(title: 'Statistiques'),
                        ),
                      );
                    },
                    // Affiche une ligne de texte nommé "Accès aux statistiques" qui fait nous redirige vers la page en question
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Accès aux statistiques',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                    ),
                  ),

                  // Permet quand on clique sur le texte de nous amener vers la page
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PersonaliseScreen(title: 'Personnalisé'),
                        ),
                      );
                    },
                    // Affiche une ligne de texte nommé "Accès aux dés personnalisés" qui fait nous redirige vers la page en question
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Accès aux dés personnalisés',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Affiche le logo para'dice sur un fond vert
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
              // Création du bouton "Accès aux statistiques" permettant d'aller sur la page des statistiques
              Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * 0.02,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const StatistiquesScreen(title: 'Statistiques'),
                      ),
                    );
                  },
                  child: const Text('Accès aux statistiques'),
                ),
              ),
              // Création du bouton "Accès aux dés personnalisés" permettant d'aller sur la page des dés customs
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PersonaliseScreen(title: 'Personnalisé'),
                    ),
                  );
                },
                child: const Text('Accès aux dés personnalisés'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

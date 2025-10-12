import 'package:flutter/material.dart';
import 'package:paradice/myhomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// Page de chargement avant d'afficher le menu de l'application
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Créer un délai de 5s où la page de chargement apparaît avant d'afficher le menu
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Para\'Dice'),
        ),
      );
    });
  }

  // Affichage des outils à afficher : Logo de l'application sur fond vert et un cercle blanc qui tourne pour montrer le chargement
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/paradice_logo.png',
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 3,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

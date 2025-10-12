# Para'Dice - Projet réalisée par Jessy Quarez

Para'Dice est une application Flutter développée dans le cadre du projet n°1 du Bloc 2 de compétence
Ce projet est une simulation d'un lancer de dés. 
Cette application permet aux joueurs de lancer un nombre personnalisable de dés à six faces (D6), dix faces (D10), vingt faces (D20) et cent faces (D100) et d'obtenir la moyenne du lancer de dés effectués.

## Fonctionnalités principales du projet
- **Lancement de 1 à N dès** à 6, 10, 20 et 100 faces
- **Affichage des statistiques** par face avec occurances
- **Calcul de la moyenne** du lancer de dés
- **Personnalisation du nombre** de dès à lancer
- **Affichage responsive** en fonction de l'écran

## Arboresence du projet

### Fichiers principaux de l'application
- **main.dart :** Fichier de configuration générale de l'application
- **myhomepage.dart :** Fichier gérant l'interface principale

### Fichiers contenant les classes abstraites
- **dice.dart :** Classe abstraite définissant la structure commune à tous les dés
- **dicepool.dart :** Classe abstraite définissant la gestion des collections de dés

### Implémentation des différents types de dés
- **dice6.dart :** Classe héritant de Dice pour les dés à 6 faces
- **dice10.dart :** Classe héritant de Dice pour les dés à 10 faces
- **dice20.dart :** Classe héritant de Dice pour les dés à 20 faces
- **dice100.dart :** Classe héritant de Dice pour les dés à 100 faces

### Implémentation des différentes collections pour chaque types de dés
- **dicepool6.dart :** Classe héritant de DicePool pour gérer les collections de D6 en utilisant Dice6
- **dicepool10.dart :** Classe héritant de DicePool pour gérer les collections de D10 en utilisant Dice10
- **dicepool20.dart :** Classe héritant de DicePool pour gérer les collections de D20 en utilisant Dice20
- **dicepool100.dart :** Classe héritant de DicePool pour gérer les collections de D100 en utilisant Dice100

## Fonctionnement de l'application

### Configuration de l'application
1) **Choix du type de dé :** L'utilisateur possède le choix entre 4 types de dès prédéfinis (D6, D10, D20, D100 soient 6, 10, 20, 100 faces)
2) **Choix du nombre de dés à lancer** : L'utilisateur peut ajuster le nombre de dés à lancer grâce aux boutons -10, -1, 1, +1, +10
3) **Lancement de l'application** : L'utilisateur, après avoir régler l'application, peut appuyer sur le bouton en bas à droite pour procéder au lancement des dés

### Affichage des résultats
L'utilisateur, après avoir appuyé sur le bouton du lancement des dés, voit sur son écran, les différents informations pour conclure son lancement de dés :
    - Les statistiques du nombre d'occurances pour chaque face
    - La moyenne du lancer de dés

## Installation et Utilisation
1) git clone git@github.com:QJessy/flutter_paradice.git
2) flutter pub get (installation des extensions du projet)
3) flutter run (pour lancer l'application)

# Para'Dice - Projet réalisée par Jessy Quarez dans le cadre du BTS SIO

Para'Dice est une application Flutter développée dans le cadre du projet n°1 du Bloc 2 de compétence
Ce projet est une simulation d'un lancer de dés. 
Cette application permet aux joueurs de lancer un nombre personnalisable de dés à six faces (D6), dix faces (D10), vingt faces (D20) et cent faces (D100) et d'obtenir la moyenne du lancer de dés effectués.

## Fonctionnalités principales du projet
- Lancement de 1 à N dès à 6, 10, 20 et 100 faces
- Affichage des statistiques par face avec occurances
- Calcul de la moyenne du lancer de dés
- Personnalisation du nombre dès à lancer
- Affichage responsive en fonction de l'écran

## Arboresence du projet

Fichiers principaux de l'application
- main.dart : Fichier de configuration générale de l'application
- myhomepage.dart : Fichier gérant l'interface principale

Fichiers contenant les classes abstraites
- dice.dart : Classe abstraite définissant la structure commune à tous les dés
- dicepool.dart : Classe abstraite définissant la gestion des collections de dés

Implémentation des différents types de dés
- dice6.dart : Classe héritant de Dice pour les dés à 6 faces
- dice10.dart : Classe héritant de Dice pour les dés à 10 faces
- dice20.dart : Classe héritant de Dice pour les dés à 20 faces
- dice100.dart : Classe héritant de Dice pour les dés à 100 faces

Implémentation des différentes collections pour chaque types de dés
- dicepool6.dart : Classe héritant de DicePool pour gérer les collections de D6 en utilisant Dice6
- dicepool10.dart : Classe héritant de DicePool pour gérer les collections de D10 en utilisant Dice10
- dicepool20.dart : Classe héritant de DicePool pour gérer les collections de D20 en utilisant Dice20
- dicepool100.dart : Classe héritant de DicePool pour gérer les collections de D100 en utilisant Dice100

## Fonctionnement de l'application

L'utilisateur peut choisir le type de dès qu'il souhaite entre un dès à 6 faces, 10 faces, 20 faces et 100 faces en utilisant les boutons D6, D10, D20 et D100 
Il peut aussi ajuster le nombre de dès qu'il souhaite lancer en appuyant sur les boutons -10, -1, 1, +1, +10 et lancer le lancer de dès en cliquant sur le bouton en bas à droite avec une icone de dés
Les résultats sont affichés instantanément affichant le nombre de fois qu'une face est tombé et la moyenne du lancer de dés réalisé

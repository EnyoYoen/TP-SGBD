-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 7 : Donnez le code permettant de supprimer les tables que vous avez crées.

/*
On supprime d'abord les tables contenant des clés étrangères, 
puis le reste
*/

DROP TABLE Joue;
DROP TABLE Projection;
DROP TABLE Film;

DROP TABLE Salle;
DROP TABLE Cinema;
DROP TABLE Artiste;
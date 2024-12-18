-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 
-- Membre 2 : 
-- Membre 3 : 

-- Probleme 1 - Question 2 : Donnez le code nécessaire pour que le nom d'un artiste soit toujours stocké en majuscules.

ALTER TABLE Artiste
ADD CONSTRAINT majuscule_nomArtiste CHECK (nomArtiste = UPPER(nomArtiste));
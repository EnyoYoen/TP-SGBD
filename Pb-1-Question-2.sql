-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 2 : Donnez le code nécessaire pour que le nom d'un artiste soit toujours stocké en majuscules.

ALTER TABLE Artiste
ADD CONSTRAINT majuscule_nomArtiste CHECK (nomArtiste = UPPER(nomArtiste));

-- Tests

INSERT INTO Artiste VALUES (1, 'Dupont', 'Jean', '01-JAN-2000'); -- Erreur

INSERT INTO Artiste VALUES (1, 'DUPONT', 'Jean', '01-JAN-2000'); -- OK

COMMIT;
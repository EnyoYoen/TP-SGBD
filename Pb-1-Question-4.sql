-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 4 : Donnez le code nécessaire pour que la capacité d'une salle soit supérieure à 30.

ALTER TABLE Salle
ADD CONSTRAINT capacite_sup CHECK (capacite > 30);

-- Tests
INSERT INTO Salle VALUES (1, 1, 30, 1); -- Erreur

INSERT INTO Salle VALUES (1, 1, 31, 1); -- OK
COMMIT;
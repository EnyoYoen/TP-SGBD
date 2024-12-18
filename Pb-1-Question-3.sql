-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 3 : Donnez le code nécessaire pour que l'adresse d'un cinéma soit connue.

ALTER TABLE Cinema
ADD CONSTRAINT adresse_connue CHECK (address IS NOT NULL);

-- Tests
INSERT INTO Cinema VALUES (1, 'Cinema 1', 1, NULL); -- Erreur

INSERT INTO Cinema VALUES (1, 'Cinema 1', 1, '123 rue de la rue'); -- OK

COMMIT;
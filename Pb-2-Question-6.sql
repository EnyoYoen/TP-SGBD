-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 6 : Nombre de lacs situés sur un seul pays.
SELECT name, (
    SELECT COUNT(*)
        FROM geo_lake
        WHERE code = country
    ) AS nb_lakes -- on compte le nombre de lac pour chaque pays, de cette facon on a tous les pays
  FROM country;
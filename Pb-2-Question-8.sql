-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 8 : Pour les pays de superficie supérieure ou égale à 8 millions de $km^{2
SELECT DISTINCT code, lake
    FROM Country c LEFT OUTER JOIN geo_lake g ON (c.code = g.country)
    WHERE area >= 8000000
    ORDER BY code ASC, lake ASC;
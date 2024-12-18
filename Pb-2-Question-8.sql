-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 8 : Pour les pays de superficie supérieure ou égale à 8 millions de $km^{2
SELECT DISTINCT c.code, l.lake
    FROM country c LEFT OUTER JOIN geo_lake l on c.code = l.country
    WHERE area >= 8000000
    ORDER BY c.code, l.lake;
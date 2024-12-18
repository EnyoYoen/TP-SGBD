-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 3 : Nom des lacs pour lesquels aucune des provinces sur lesquels ils sont situés n’a de montagne répertoriée. Classer les noms par ordre alphabétique.
SELECT DISTINCT l.NAME
    FROM Lake l, geo_lake g 
    WHERE l.NAME = g.LAKE AND l.AREA >= 50000 AND (g.PROVINCE, g.COUNTRY) NOT IN (
        SELECT name, country
        FROM Province 
        WHERE (name, country) NOT IN (
            SELECT province, country
            FROM geo_mountain
        )
    )
    ORDER BY l.NAME ASC;

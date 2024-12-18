-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 3 : Nom des lacs pour lesquels aucune des provinces sur lesquels ils sont situés n’a de montagne répertoriée. Classer les noms par ordre alphabétique.
SELECT DISTINCT lake
    FROM geo_lake
    WHERE (province, country) NOT IN (
        SELECT province, country -- les provinces qui n'ont pas de montagnes
        FROM geo_mountain
    )
    ORDER BY lake ASC;

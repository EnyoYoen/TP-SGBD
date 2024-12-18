-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 7 : Pays qui dispos(ent) de la plus grande superficie totale de lacs (on comptera la surface d’un lac que celui-ci soit totalement situé dans le pays ou non)
SELECT c.name
    FROM geo_lake g, Lake l, Country c
    WHERE l.name = g.lake AND c.code = g.country
    GROUP BY g.country, c.name
    HAVING SUM(l.area) = (
        SELECT MAX(s.somme)
        FROM (
            SELECT SUM(area) AS somme
            FROM geo_lake, Lake
            WHERE lake = name
            GROUP BY country
        ) s
    );
    

SELECT c.name
FROM country c, geo_lake l, lake ll
WHERE c.code = l.country AND lake = ll.name
GROUP BY c.name
ORDER BY SUM(ll.area) DESC
FETCH FIRST ROW ONLY;
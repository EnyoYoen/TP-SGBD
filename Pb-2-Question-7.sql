-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 7 : Pays qui dispos(ent) de la plus grande superficie totale de lacs (on comptera la surface d’un lac que celui-ci soit totalement situé dans le pays ou non)
SELECT c.name
    FROM geo_lake g, Lake l, Country c
    WHERE l.name = g.lake AND c.code = g.country
    GROUP BY g.country, c.name
    HAVING SUM(l.area) = ( -- On verifie que la somme des superficies est egale au max
        SELECT MAX(s.somme) -- On recupere le maximum des superficies
        FROM (
            SELECT SUM(area) AS somme -- On recupere la somme de la superficie des lacs pour chaque pays
            FROM geo_lake, Lake
            WHERE lake = name
            GROUP BY country
        ) s
    );
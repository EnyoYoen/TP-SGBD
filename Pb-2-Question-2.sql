-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 2 : Nom des lacs de plus de 50000 $km^{2}

SELECT DISTINCT name
    FROM lake, geo_lake
    WHERE lake = name AND area >= 50000 AND (country, province) NOT IN ( -- les lacs qui ne sont pas dans une province ayant une montagnes 
        SELECT country, province -- les provinces qui ont une montagne
        FROM geo_mountain
    )
    ORDER BY name ASC;

-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 1 : Nom des lacs qui sont situés sur 5 provinces ou plus. Afficher le nom du lac et le nombre de provinces, par ordre décroissant de ce nombre.

SELECT name, COUNT(PROVINCE)
    FROM Lake, geo_lake           -- On selectionne les tables Lake et geo_lake
    WHERE lake = name             -- on effectue une jointure entre elles (par le nom)
    GROUP BY name                 -- on regroupe par le nom
    HAVING COUNT(province) >= 5   -- on garde les lacs qui ont plus de 5 provinces
    ORDER BY COUNT(province) DESC;-- et on ordonne par nombre de provinces decroissant
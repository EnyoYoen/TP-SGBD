-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 

-- Probleme 2 - Question 1 : Nom des lacs qui sont situés sur 5 provinces ou plus. Afficher le nom du lac et le nombre de provinces, par ordre décroissant de ce nombre.
SELECT name, COUNT(PROVINCE) FROM Lake, geo_lake WHERE LAKE = NAME GROUP BY NAME HAVING COUNT(PROVINCE) >= 5 ORDER BY COUNT(PROVINCE) DESC;
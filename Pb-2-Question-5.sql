-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 5 : Villes situées près du lac Michigan (Lake Michigan) ; Afficher le nom de la ville, la province, le pays, et la surface du pays.
SELECT l.city, l.province, l.country, c.area
    FROM located l, Country c
    WHERE c.code = l.country AND l.lake IS NOT NULL AND l.lake = 'Lake Michigan';
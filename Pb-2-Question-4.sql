-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 4 : Nom du lac (ou des lacs) qui a (ont) la plus grande superficie.
SELECT name
    FROM lake
    WHERE area = ( -- On compare pour trouver les lacs ayant une superficie maximale
        SELECT MAX(area) -- On recupere la superficie du lac ayant la plus grande
        FROM lake
    );
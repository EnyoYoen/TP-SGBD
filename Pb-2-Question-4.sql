-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 4 : Nom du lac (ou des lacs) qui a (ont) la plus grande superficie.
select name
  from lake
 where area = (
   select max(area)
     from lake
);

select name
  from lake
 where area = (
   select max(area)
     from lake
);
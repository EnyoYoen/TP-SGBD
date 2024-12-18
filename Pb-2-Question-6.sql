-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 6 : Nombre de lacs situés sur un seul pays.
select name,
       (
          select count(*)
            from geo_lake
           where code = country
       ) as nb_lakes
  from country;
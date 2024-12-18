-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 2 : Nom des lacs de plus de 50000 $km^{2}

select distinct name -- Chaque lac apparait une fois pour chacune de ses provinces, il faut un distinct
  from lake,
       geo_lake l,
       geo_mountain m
 where lake = name
   and area >= 50000 -- Lac de plus de 50000 km^2
   and ( l.country,
         l.province ) not in ( -- si au moins une des provinces n'a pas de montagne
   select country,
          province -- Trouve toutes les provinces ayant une montagne
     from geo_mountain
)
 order by name asc;
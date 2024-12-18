-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 2 : Nom des lacs de plus de 50000 $km^{2}
select distinct l.name
  from lake l,
       geo_lake g
 where l.name = g.lake
   and l.area >= 50000
   and ( g.province,
         g.country ) not in (
   select province,
          country
     from geo_mountain
)
 order by l.name asc;

select distinct name
  from lake,
       geo_lake l,
       geo_mountain m
 where lake = name
   and area >= 50000
   and ( l.country,
         l.province ) not in (
   select country,
          province
     from geo_mountain
)
 order by name asc;
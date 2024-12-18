-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 3 : Nom des lacs pour lesquels aucune des provinces sur lesquels ils sont situés n’a de montagne répertoriée. Classer les noms par ordre alphabétique.

select distinct name
  from lake,
       geo_lake
 where name = geo_lake.lake
   and ( name,
         province,
         country ) not in (
   select l.lake,
          l.province,
          l.country
     from geo_lake l,
          geo_mountain m
    where l.province = m.province
      and l.country = m.country
)
 order by name asc;

select distinct lake
  from geo_lake
 where ( lake,
         province,
         country ) not in (
   select distinct l.lake,
                   l.province,
                   l.country
     from geo_lake l,
          geo_mountain m
    where l.province = m.province
      and l.country = m.country
)
 order by lake asc;
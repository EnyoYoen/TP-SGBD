-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 3 : Nom des lacs pour lesquels aucune des provinces sur lesquels ils sont situés n’a de montagne répertoriée. Classer les noms par ordre alphabétique.

select distinct lake -- Chaque lac apparait une fois pour chacune de ses provinces, il faut un distinct
  from geo_lake
 where ( lake, 
         province, -- il faut preciser province et country au cas où deux lacs différents auraient le même nom
         country ) not in ( -- le lac n'est pas dans la liste <=> le lac a exactement 0 province montagneuse
   select distinct l.lake, -- liste tous les lacs ayant au moins une province montagneuse
                   l.province,
                   l.country
     from geo_lake l,
          geo_mountain m
    where l.province = m.province
      and l.country = m.country
)
 order by lake asc;
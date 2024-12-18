-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 3 : Nom des lacs pour lesquels aucune des provinces sur lesquels ils sont situés n’a de montagne répertoriée. Classer les noms par ordre alphabétique.
select distinct l.name
  from lake l,
       geo_lake g
 where l.name = g.lake
   and l.area >= 50000
   and ( g.province,
         g.country ) not in (
   select name,
          country
     from province
    where ( name,
            country ) not in (
      select province,
             country
        from geo_mountain
   )
)
 order by l.name asc;

select DISTINCT name
  from lake, geo_lake
 where name = geo_lake.lake and
 (name, province, country) not in (
   select l.lake, l.PROVINCE, l.COUNTRY
     from geo_lake l,
          geo_mountain m
    where l.province = m.province
      and l.country = m.country
)
 order by name asc;
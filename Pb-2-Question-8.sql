-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 8 : Pour les pays de superficie supérieure ou égale à 8 millions de $km^{2
select distinct code,
                lake
  from country c
  left outer join geo_lake g
on ( c.code = g.country )
 where area >= 8000000
 order by code asc,
          lake asc;

select distinct c.code, l.lake
  from country c
  left join geo_lake l on c.code = l.country
 where area >= 8000000
 order by c.code, l.lake;
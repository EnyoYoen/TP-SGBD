-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437		   Michaud	William

-- Probleme 2 - Question 9 : Donnez le nombre de pays ayant 0 lac, le nombre de pays ayant au moins un lac, mais moins de 10, nombre de pays ayant au moins 10 lacs mais moins de 100 et nombre de plays ayant plus de 100 lacs.

/*
-- Tests pour vérifier les résultats
select name
  from country
 where country.code not in (
   select country
     from geo_lake
);

select country,
       count(lake)
  from geo_lake
 group by country
having count(lake) < 10;

select country,
       count(lake)
  from geo_lake
 group by country
having count(lake) >= 10
   and count(lake) < 100;

select country,
       count(lake)
  from geo_lake
 group by country
having count(lake) >= 100;

select COUNT(*) FROM COUNTRY;
*/

select COUNT(case when lake_count = 0 then 1 end) as "Nombre de pays ayant 0 lac",
       COUNT(case when lake_count > 0 and lake_count < 10 then 1 end) as "Nombre de pays ayant au moins un lac, mais moins de 10",
       COUNT(case when lake_count >= 10 and lake_count < 100 then 1 end) as "Nombre de pays ayant au moins 10 lacs mais moins de 100",
       COUNT(case when lake_count >= 100 then 1 end) as "Nombre de pays ayant plus de 100 lacs"
  from (
    select country.code,
           count(geo_lake.lake) as lake_count
      from country
      left join geo_lake
        on country.code = geo_lake.country
     group by country.code
  );
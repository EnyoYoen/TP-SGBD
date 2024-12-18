-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 5 : Donnez le code nécessaire pour que l'année de naissance d'un acteur soit inférieure à l'année de sortie de tous les films dans lesquels il a un rôle.

create or replace trigger check_birth_year before
   insert or update on joue
   for each row
declare
   v_birth_year   number;
   v_release_year number;
begin
   select extract(year from datenaissance)
     into v_birth_year
     from artiste
    where idartiste = :new.idartiste;

   for film in (
      select extract(year from f.datesortie) as release_year
        from film f
       where f.idfilm = :new.idfilm
   ) loop
      if v_birth_year >= film.release_year then
         raise_application_error(
            -20001,
            'L''année de naissance de l''acteur doit être inférieure à l''année de sortie de tous les films dans lesquels il a un rôle.'
         );
      end if;
   end loop;
end;
/

-- Tests

insert into film values ( 1,
                          'Film 1',
                          '01-JAN-2000',
                          1 );
insert into film values ( 2,
                          'Film 2',
                          '01-JAN-2001',
                          1 );

INSERT INTO ARTISTE VALUES (2, 'DUPONT', 'Pierre', '01-JAN-1999');

INSERT INTO Joue VALUES (1, 1, 'Role 1'); -- Erreur
INSERT INTO Joue VALUES (2, 2, 'Role 2'); -- OK

COMMIT;
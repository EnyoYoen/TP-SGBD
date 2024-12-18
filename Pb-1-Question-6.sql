-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 6 : Donnez le code SQL permettant de supprimer un artiste que l'on sait identifier par sa clé dans votre schéma.

/*
Cette procédure ne supprime un artiste que s'il existe une entrée pour l'id donné.
On ne peut donc pas supprimer un artiste qui n'existe pas.

Elle a pour conséquence de supprimer toutes les références à cet artiste dans la base de donnée,
on aura donc possiblement des films sans réalisateur et des rôles manquants.
Pour le cas des films, on pourrait considérer qu'un film sans réalisateur n'a pas de sens et donc 
supprimer toutes les entrées de film sans réalisateur, il faudrait alors supprimer les references à ce film dans Projection
*/
create or replace procedure supprimer_artiste (
   id int
) is
begin
   delete from joue
    where idartiste = id;

   update film
      set
      realisepar = null
    where realisepar = id;

   delete from artiste
    where id = artiste.idartiste;
   commit;
end;
/

-- Tests

insert into artiste values ( 3,
                             'DUPONT',
                             'Pierre',
                             '01-JAN-1999' );
insert into film values ( 3,
                          'Film1',
                          '01-JAN-2000',
                          3 );
commit;

EXECUTE supprimer_artiste(3);

select *
  from artiste;
select *
  from film;
-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William


-- Probleme 1 - Question 6 : Donnez le code SQL permettant de supprimer un artiste que l'on sait identifier par sa clé dans votre schéma.

/*
Cette procédure ne supprime un artiste que s'il existe un artiste pour l'id donné.
Elle a pour conséquence de supprimer toutes les références à cet artiste dans la base de donnée,
on aura donc possiblement des films sans réalisateur et des rôles manquants.
*/
create or replace procedure supprimer_artiste (
   id int
) is
begin
   delete from joue
    where idartiste = artiste.idartiste;

   update film
      set
      idrealisateur = null
    where idrealisateur = artiste.idartiste;

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
commit;

EXECUTE supprimer_artiste(3);

select *
  from artiste;
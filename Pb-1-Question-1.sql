-- Contrôle de TP
--            NumEtudiant      Nom      Prénom 
-- Membre 1 : 04028297         Peyrot   Yoen
-- Membre 2 : 4028437			Michaud	William

-- Probleme 1 - Question 1 : Donnez le code permettant de créer les tables correspondantes sous Oracle.

CREATE TABLE Cinema (
	idCinema INT PRIMARY KEY,
	nomCinema VARCHAR(50),
	arrondissement INT,
	address VARCHAR(100)
);

CREATE TABLE Artiste (
	idArtiste INT PRIMARY KEY,
	nomArtiste VARCHAR(50),
	prenomArtiste VARCHAR(50),
	dateNaissance DATE
);

CREATE TABLE Film (
	idFilm INT PRIMARY KEY,
	titre VARCHAR(50),
	dateSortie DATE,
	realisePar INT,
	FOREIGN KEY (realisePar) REFERENCES Artiste(idArtiste)
);

CREATE TABLE Salle (
	idSalle INT PRIMARY KEY,
	numero INT,
	capacite INT,
	idCinema INT,
	FOREIGN KEY (idCinema) REFERENCES Cinema(idCinema)
);

CREATE TABLE Projection (
	idSalles INT,
	idFilms INT,
	dateProjection DATE,
	heureDebut TIMESTAMP, -- en heure locale
	heureFin TIMESTAMP, -- en heure locale
	PRIMARY KEY (idSalles, idFilms),
	FOREIGN KEY (idSalles) REFERENCES Salle(idSalle),
	FOREIGN KEY (idFilms) REFERENCES Film(idFilm)
); 

CREATE TABLE Joue (
	idArtiste INT,
	idFilm INT,
	nomRole VARCHAR(50),
	PRIMARY KEY (idArtiste, idFilm),
	FOREIGN KEY (idArtiste) REFERENCES Artiste(idArtiste),
	FOREIGN KEY (idFilm) REFERENCES Film(idFilm)
);
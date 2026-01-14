CREATE TABLE joueurs_par_id_club (
	id_club varchar,
	nom_club varchar STATIC,
	ville_club varchar STATIC,
	id_joueur varchar,
	nom_joueur varchar,
	prenom_joueur varchar,
	date_naissance timestamp,
	ville_joueur varchar,
	PRIMARY KEY (id_club, id_joueur)
);

CREATE TABLE resultats_par_id_joueur (
	id_joueur varchar,
	nom_joueur varchar STATIC,
	prenom_joueur varchar STATIC,
	id_tournoi varchar,
	nom_tournoi varchar,
	classement int,
	PRIMARY KEY (id_joueur, id_tournoi)
);

INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J1', 'Ouzy', 'Jacques', '1955-10-02', 'Montpellier', 'C1', 'La bille noire', 'Montpellier');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J2', 'Bricot', 'Judas', '1965-12-02', 'Vendargues', 'C1', 'La bille noire', 'Montpellier');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J3', 'Nemard', 'Jean', '1992-04-08', 'Montpellier', 'C1', 'La bille noire', 'Montpellier');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J4', 'Peuplu', 'Jean', '1995-02-28', 'Baillargues', 'C1', 'La bille noire', 'Montpellier');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J5', 'Masse', 'Lara', '1975-05-01', 'Montpellier', 'C2', 'La bille blanche', 'Montpellier');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J6', 'Ochon', 'Paul', '1994-12-25', 'Ganges', 'C2', 'La bille blanche', 'Montpellier');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J7', 'Tomie', 'Anna', '2005-01-01', 'Nimes', 'C3', 'CrocoBilles', 'Nimes');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J8', 'Draté', 'Daisy', '2002-06-21', 'Aimargues', 'C3', 'CrocoBilles', 'Nimes');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J9', 'Diccule', 'Terry', '2014-07-02', 'Nimes', 'C3', 'CrocoBilles', 'Nimes');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J10', 'Zémoi', 'Elie', '1970-08-15', 'Béziers', 'C4', 'La billeroise', 'Béziers');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J11', 'Deuf', 'John', '1970-08-15', 'Sérignan', 'C4', 'La billeroise', 'Béziers');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J12', 'Nanas', 'Judas', '2000-09-08', 'Montpellier', 'C4', 'La billeroise', 'Béziers');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J13', 'Pique', 'Sam', '1998-08-15', 'Mende', 'C5', 'La billamende', 'Mende');
INSERT INTO joueurs_par_id_club (id_joueur, nom_joueur, prenom_joueur, date_naissance, ville_joueur, id_club, nom_club, ville_club) VALUES ('J14', 'Gratte', 'Sam', '2006-11-15', 'Chanac', 'C5', 'La billamende', 'Mende');


INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J1', 'Ouzy', 'Jacques', 1);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J2', 'Bricot', 'Judas', 2);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J3', 'Nemard', 'Jean', 3);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J7', 'Tomie', 'Anna', 4);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J8', 'Draté', 'Daisy', NULL);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J9', 'Diccule', 'Terry', 5);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T1', 'Les crocodiles mangent des billes','J10', 'Zémoi', 'Elie', 6);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T2', 'Billes en fête','J1', 'Ouzy', 'Jacques', 1);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T2', 'Billes en fête','J10', 'Zémoi', 'Elie', 2);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T2', 'Billes en fête','J2', 'Bricot', 'Judas', 3);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T2', 'Billes en fête','J11', 'Deuf', 'John', 4);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T2', 'Billes en fête','J12', 'Nanas', 'Judas', 5);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T3', 'Les billes babillent','J1', 'Ouzy', 'Jacques', 1);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T3', 'Les billes babillent','J2', 'Bricot', 'Judas', 2);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T3', 'Les billes babillent','J4', 'Peuplu', 'Jean', 3);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T3', 'Les billes babillent','J3', 'Nemard', 'Jean', 4);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J13', 'Pique', 'Sam', 1);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J14', 'Gratte', 'Sam', 2);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J1', 'Ouzy', 'Jacques', 3);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J6', 'Ochon', 'Paul', 4);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J3', 'Nemard', 'Jean', 5);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J9', 'Diccule', 'Terry', 6);
INSERT INTO resultats_par_id_joueur (id_tournoi, nom_tournoi, id_joueur, nom_joueur, prenom_joueur, classement) VALUES ('T4', 'Les joutes billetistes','J8', 'Draté', 'Daisy', 7);

/* ------- ANIME -------- */

CREATE TABLE etudiants_par_id_classe (
id_classe varchar,
nom_classe varchar STATIC,
niveau_classe varchar STATIC,
id_etudiant varchar,
nom_etudiant varchar,
dateNaissance_etudiant timestamp,
PRIMARY KEY (id_classe, nom_etudiant, id_etudiant)
);

CREATE TABLE detail_notes (
id_etudiant varchar,
nom_etudiant varchar STATIC,
prenom_etudiant varchar STATIC,
dateNaissance_etudiant timestamp STATIC,
telephone_etudiant varchar STATIC,
email_etudiant varchar STATIC,
id_classe varchar STATIC,
nom_classe varchar STATIC,
niveau_classe varchar STATIC,
id_matiere varchar,
nom_matiere varchar,
note int,
PRIMARY KEY (id_etudiant, id_matiere)
)
WITH CLUSTERING ORDER BY (id_matiere DESC);

/* --------------- */

CREATE TABLE hotel {
    nom VARCHAR,
    nbEtoiles NUMBER,
    adresse VARCHAR,
};

SELECT 
DROP TYPE employe_type FORCE;
DROP TYPE voiture_type FORCE;
DROP TYPE ville_type FORCE;
DROP TYPE client_type FORCE;
DROP TYPE projet_type FORCE;
DROP TYPE voiture_type FORCE;

-- 1) CREATION DES TYPES

CREATE OR REPLACE TYPE projet_type AS OBJECT
    (idProjet VARCHAR(5), nom VARCHAR(20), budget NUMBER, ref_chef REF employe_type,
     MEMBER FUNCTION salaireMensuelMoyen RETURN NUMBER,
     MEMBER PROCEDURE affecterEmploye(p_idEmploye VARCHAR, p_poste VARCHAR)
     MEMBER FUNCTION nbProjets RETURN NUMBER
    ) NOT FINAL;

CREATE OR REPLACE TYPE nt_projets AS TABLE OF projet_type;

CREATE OR REPLACE TYPE posseder_type AS OBJECT
(ref_projet REF projet_type);

CREATE OR REPLACE TYPE ville_type AS OBJECT
    (idVille VARCHAR(5), nom VARCHAR(20), nbHabitants NUMBER, departement VARCHAR2(20),
     MEMBER FUNCTION nbClients RETURN NUMBER,
     MEMBER FUNCTION nbEmployes RETURN NUMBER) ;

CREATE OR REPLACE TYPE voiture_type AS OBJECT
    (immatriculation VARCHAR(20), marque VARCHAR(20));

CREATE OR REPLACE TYPE employe_type AS OBJECT
    (idEmploye VARCHAR(5), nom VARCHAR(20), prenom VARCHAR(20), salaireFixe NUMBER, ref_ville REF ville_type, voiture voiture_type,
     MEMBER FUNCTION nbProjets RETURN NUMBER,
     MEMBER FUNCTION nbChef RETURN NUMBER,
     MEMBER FUNCTION salaireMensuel RETURN NUMBER,
     MEMBER FUNCTION estRiche RETURN NUMBER,
     STATIC FUNCTION salaireMoyenMensuel RETURN NUMBER) NOT FINAL;

CREATE OR REPLACE TYPE client_type AS OBJECT
    (idClient VARCHAR(20), nom VARCHAR(20), ref_ville REF ville_type, projets posseder_type,
     MEMBER FUNCTION chiffreAffaires RETURN NUMBER,
     MEMBER FUNCTION nbProjets RETURN NUMBER);

CREATE OR REPLACE TYPE voiture_type AS OBJECT
    (immatrictulation VARCHAR(5), marque VARCHAR(20));

-- 2) CREATION DES TABLES

CREATE TABLE VILLE OF ville_type;
CREATE TABLE EMPLOYE OF employe_type;
CREATE TABLE PROJET OF projet_type;
CREATE TABLE CLIENT OF client_type;

-- 3) INSERTIONS TABLES
INSERT INTO Ville
VALUES (
        ville_type('V1', 'Montpellier', 300000, 'Herault'),
        ville_type('V2', 'Béziers', 75000, 'Herault'),
        ville_type('V3', 'Nîmes', 5000, 'Gard'),
        ville_type('V4', 'Perpignan', 100000, 'Catalogne')
        );

INSERT INTO Employe
VALUES (
        employe_type('E1','Greux','Nadine',2500),
        employe_type('E2','Golade','Larry',3000),
        employe_type('E3','Ancieux','Cécile',1900),
        employe_type('E4','Zieuvert','Bruno',1800)
        );

INSERT INTO Projet
VALUES (
        projet_type('P1','Eclipse',1000000,'E1'),
        projet_type('P2','Juno', 800000, 'E2'),
        projet_type('P3','Gallileo', 500000,'E2'),
        projet_type('P4','Europa',400000,null)
        );
z
SELECT VALUE(t) FROM VILLE t;
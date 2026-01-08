/*
 VILLE (idVille, nom, nbHabitants, departement)
EMPLOYE (idEmploye, nom, prenom, salaireFixe, @ref_ville, voiture)
PROJET (idProjet, nom, budget, @ref_chef)
CLIENT (idClient, nom, @ref_ville, projets{@ref_projet})
 */

SELECT VALUE(v) from Ville v ;
SELECT REF(v) FROM Ville v ;
SELECT idClient, nom, c.ref_ville FROM Client c ;
SELECT idClient, nom, DEREF(c.ref_ville) FROM Client c ;

/*
R1 : Le nom des projets qui ont un chef.
NOM
---------
Eclipse
JunoGallileo
 */


/*
R2 : Le nom et le prénom des employés qui ont une Volkswagen.
NOM PRENOM
-------- -------
Ancieux Cécile
 */


/*
R3 : L'immatriculation des voitures des employés qui habitent dans le département de la
Catalogne
IMMAT
------
DD66
 */


/*
R4 : Pour chacun des projets, indiquer le nom du projet ainsi que le nom et le prénom du
chef de projet.
NOM NOMCHEF PRENOMCHEF
--------- -------- -----------
Eclipse Greux Nadine
Juno Golade Larry
Gallileo Golade Larry
Europa
 */


/*
R5 : Le nom du projet pour lequel Nadine Greux est chef.

NOM
--------
Eclipse
IUT Montpellier – Informatique – 3A 2024-2025
BD5 — TP Dossier 2 3
 */


/*R6 : l’identifiant, le nom, le prénom et la ville des employés qui sont chefs d'un projet qui a
un budget de plus de 500 000 €.
IDCHEF NOMCHEF PRENOMCHEF VILLECHEF
------- -------- ----------- -------------
E1 Greux Nadine Montpellier
E2 Golade Larry Montpellier
 */


/*R7 : Le nom des projets qui ont un chef montpelliérain.
NOM
----------
Eclipse
Juno
Gallileo
 */


/*R8 : le nom et le prénom des employés qui habitent dans la même ville que le client IBM.
NOM PRENOM
------- -------
Golade Larry
Greux Nadine
 */


/*R9 : le nombre de projets de chaque client.
NOM NB
---------- ---
IBM 2
Microsoft 1
R10 : le nom des projets du client IBM.
NOM
----------
Eclipse
Juno
 */


/*R11 : le nom, le prénom et la ville du chef de projet de chacun des projets qui concernent un
client nîmois.
NOM PRENOM VILLE
------- ------- ------------
Golade Larry Montpellier
 */


/*R12 : le nom des clients qui ont un projet dont le budget est inférieur à 600 000 €.
NOM
----------
Microsoft

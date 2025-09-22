/*
PROFS (codeProf, nomProf, prenomProf, sexeProf, typeProf, dateProf, salaireProf)
CLASSES (nomClasse, codeProfPrincipal#)
ETUDIANTS (numEtudiant, nomEtudiant, prenomEtudiant, dateEtudiant, nomClasse#, numEtudiantParrain#)
UV (codeUV, nomUV, nomComposante, codeProfResponsable#)
ORAUX (idOral, numEtudiant#, codeUV#, note)

 1 : le nom des classes qui n’ont pas de professeur principal
NOMCLASSE
----------
S3
 */

SELECT NOMCLASSE
FROM CLASSES
WHERE CODEPROFPRINCIPAL IS NULL;

/*
 R2 : le nom, prénom, type et salaire des profs qui ne sont pas ‘Vacataire’, classés du mieux
payé au moins bien payé.
 NOMPROF PRENOMPROF TYPEPROF SALAIREPROF
----------- ------------ ---------- ------------
Palleja Xavier Titulaire 5500
Mugnier Marie-Laure Titulaire 3500
Garcia Titulaire 2800
Bellahsene Zohra
 */

SELECT NOMPROF, COALESCE(PRENOMPROF,'prenom inconnu') AS PRENOMETUDIANT, COALESCE(TYPEPROF,'type inconnu') AS TYPEPROF, COALESCE(SALAIREPROF,0) AS SALAIREPROF
FROM PROFS
WHERE COALESCE(TYPEPROF,'type inconnu') <> 'Vacataire'
ORDER BY SALAIREPROF DESC;

/*
 R3 : le nom et le prénom des étudiants qui ne sont pas parrain.
 réaliser cette requête de deux façons différentes :
- en utilisant un quantificateur NOT IN
- sans utiliser un NOT IN
NOMETUDIANT PRENOMETUDIANT
------------ ---------------
Zeblouse Agathe
Terieur Alex
Zétofrais
Ouzy Jacques
 */

-- version NOT IN
SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS
WHERE NUMETUDIANT NOT IN (
    SELECT COALESCE(NUMETUDIANTPARRAIN,'parrain inconnu')
    FROM ETUDIANTS
);

-- version sans NOT IN
SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS parrin
WHERE NOT EXISTS(
    SELECT *
    FROM Etudiants e
    WHERE parrin.NUMETUDIANT = e.NUMETUDIANTPARRAIN
    AND e.NUMETUDIANTPARRAIN IS NOT NULL
);

/*
 R4 : le nom et le prénom de l’étudiant qui obtenu la note la plus élevée dans la table des
Oraux.
 réaliser cette requête de deux façons différentes :
- en utilisant un quantificateur ALL
- sans utiliser un quantificateur ALL
NOMETUDIANT PRENOMETUDIANT
------------ ---------------
Terieur Alex
 */

-- version avec ALL
SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS
NATURAL JOIN ORAUX
WHERE NOTE >= ALL (
    SELECT COALESCE(NOTE,0)
    FROM ORAUX
);

-- version sans ALL
SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS
NATURAL JOIN ORAUX
WHERE NOTE = (
    SELECT MAX(COALESCE(NOTE,0))
    FROM ORAUX
);

/*
 R5 : le nom et prénom des étudiants qui n’ont pas de note.
NOMETUDIANT PRENOMETUDIANT
------------ ---------------
Zétofrais
Ouzy Jacques
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS
NATURAL JOIN ORAUX
WHERE NOTE IS NULL;

/*
 R6 : pour chaque étudiant, le nom et le prénom de l’étudiant, ainsi que le nombre d’oraux
passés, le nombre de notes obtenues et le nombre d’UV dans lesquelles l’étudiant a
passé des oraux.
NOMETUDIANT PRENOMETUDIANT NBORAUX NBNOTES NBUVORAUX
------------ --------------- -------- -------- ----------
Némard Jean 5 4 4
Terieur Alain 5 5 4
Terieur Alex 4 4 3
Zétofrais 1 0 0
Bricot Judas 1 1 1
Zeblouse Agathe 4 4 2
Ouzy Jacques 0 0 0
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT,
       COUNT(IDORAL) AS NBORAUX, COUNT(COALESCE(note,0)) AS NBNOTES, COUNT(COALESCE(CODEUV,'code uv inconnu')) AS NBUV
FROM ETUDIANTS
NATURAL JOIN ORAUX
GROUP BY NOMETUDIANT, PRENOMETUDIANT;

/*
 R7 : le nombre d’étudiants par classe.
CLASSE NBETUDIANTS
------------ ------------
S1 4
S2 2
S3 0
Sans classe 1
 */

SELECT COALESCE(NOMCLASSE,'nom classe inconnu') AS nomClasse, COUNT(COALESCE(NOMETUDIANT,'nom inconnu')) AS NBETUDIANT
FROM ETUDIANTS
NATURAL FULL JOIN CLASSES
GROUP BY NOMCLASSE;

/*
 R8 : le nom, le prénom et le résultat de chaque étudiant. Un étudiant est ‘Admis’ s’il a la
moyenne générale et Ajourné s’il ne l’a pas. Il faut préciser si un étudiant n’a pas de note.
NOMETUDIANT PRENOMETUDIANT RESULTAT
------------ --------------- ---------
Bricot Judas Admis
Terieur Alain Admis
Terieur Alex Admis
Zeblouse Agathe Admis
Némard Jean Ajourné
Ouzy Jacques Pas de note
Zétofrais Pas de note
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS
;

/*
 R9 : le nom et le prénom des étudiants qui ont eu une note dans toutes les UV.

 NOMETUDIANT PRENOMETUDIANT
------------ ---------------
Terieur Alain
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS;

/*
 pour chaque note, indiquer le numéro de l’étudiant qui a obtenu la note, le code de
l’UV concernée par la note, la moyenne générale de l’étudiant, la moyenne générale de
l’UV de la note, le rang de la note, et le rang de l’étudiant (par rapport à sa moyenne).
NOTE RANGNOTE CODEUV MOYENNEUV NUMETUDIANT MOYENNEETUDIANT RANGETUDIANT
----- --------- ------- ---------- ------------ ---------------- -------------
13 5 01 8,86 E2 13 1
8 13 01 8,86 E4 11,25 2
8 13 01 8,86 E4 11,25 2
15 2 03 12,67 E4 11,25 2
14 3 03 12,67 E4 11,25 2
10 8 04 11,67 E1 11,2 3
12 6 9 E1 11,2 3
14 3 01 8,86 E1 11,2 3
11 7 02 10 E1 11,2 3
9 10 03 12,67 E1 11,2 3
9 10 02 10 E5 10,25 4
9 10 01 8,86 E5 10,25 4
6 16 9 E5 10,25 4
17 1 04 11,67 E5 10,25 4
6 16 01 8,86 E3 7 5
8 13 04 11,67 E3 7 5
4 18 01 8,86 E3 7 5
10 8 02 10 E3 7 5
 */

/*
 Série 2 :
R11 : le nom et le prénom des étudiants qui sont plus jeunes que tous les profs.
NOMETUDIANT PRENOMETUDIANT
------------ ---------------
Némard Jean
Terieur Alain
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS;

/*
 R12 : afficher les 3 meilleurs notes de la table Oraux. Pour chaque note indiquer la valeur de
la note, ainsi que le numéro de l’étudiant qui a obtenu la note.
NOTE NUMETUDIANT
----- ---------------
17 E5
15 E4
14 E1
14 E4
 */

/*
R13 : pour chaque prof, le nom et le prénom du prof ainsi que la moyenne des notes des
oraux qu’il a fait passer (le prof qui fait passer l’oral est celui qui est responsable de
l’UV de l’oral).
NOMPROF PRENOMPROF MOYENNENOTES
----------- ------------ -------------
Garcia 12,67
Gasquet Malo 11,67
Mugnier Marie-Laure 10
Palleja Xavier 8,86
Palleja Nathalie
Bellahsene Zohra
 */

/*
 R14 : le résultat de chaque étudiant. Comme pour la requête 8, mais cette fois on veut prendre en
compte les étudiants dont on ne peut pas connaitre le résultat car ils sont en attente de
notation (au moins un de leurs oraux n’a pas de note).
NOMETUDIANT PRENOMETUDIANT RESULTAT
------------ --------------- -------------------
Bricot Judas Admis
Terieur Alain Admis
Terieur Alex Admis
Zeblouse Agathe Admis
Némard Jean En attente de note
Zétofrais En attente de note
Ouzy Jacques Pas de note
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS;

/*
 R15 : le nom et le prénom des étudiants qui ont obtenu une note dans toutes les composantes
NOMETUDIANT PRENOMETUDIANT
------------ ---------------
Némard Jean
Terieur Alex
Terieur Alain
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS;

/*
 R16 : pour tous les étudiants qui possèdent un prénom, indiquer le nom et le prénom de
l’étudiant ainsi que le nombre de filleuls directs ou indirects qu’il possède.
NOMETUDIANT PRENOMETUDIANT NB
------------ --------------- ---
Terieur Alain 5
Bricot Judas 3
Némard Jean 2
Zeblouse Agathe 0
Terieur Alex 0
Ouzy Jacques 0
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS;

/*
 R17 : pour chaque étudiant de la classe S1 qui n’a pas eu de note dans toutes les UV,
indiquer le numéro, le nom et le prénom de l’étudiant ainsi que les UV pour lesquelles
il n’a pas de note.
NUMETUDIANT NOMETUDIANT PRENOMETUDIANT NOMUV
------------ ------------ --------------- -------
E3 Némard Jean BD
E4 Zeblouse Agathe GESTION
E4 Zeblouse Agathe IHM
E7 Ouzy Jacques BD
E7 Ouzy Jacques GESTION
E7 Ouzy Jacques IHM
E7 Ouzy Jacques PROG
 */

/*
 R18 : pour chaque classe, indiquer le nom et le prénom de l’étudiant qui a le plus de notes
NOMCLASSE NOMETUDIANT PRENOMETUDIANT
---------- ------------ ---------------
S1 Terieur Alain
S2 Terieur Alex
S3
 */

SELECT NOMETUDIANT, COALESCE(PRENOMETUDIANT,'prénom inconnu') AS PRENOMETUDIANT
FROM ETUDIANTS;
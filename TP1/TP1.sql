/*
    CLIENTS (numClient, nomClient, categorieClient, codeVille#)
    VILLES (codeVille, nomVille, departementVille)
    TRAINS (codeVilleDepart#, codeVilleArrivee#, temps)
    PROJETS (codeProjet, nomProjet, typeProjet, budgetProjet, numClient#)
    SALARIES (numSalarie, nomSalarie, prenomSalarie, dateNaissanceSalarie, codeVilleNaissance#,
    categorieSalarie, salaireSalarie, numSalarieChef#)

    ETREAFFECTE (codeProjet#, numSalarie#)
    DIPLOMES (referenceDiplome, nomDiplome)
    POSSEDER (referenceDiplome#, numSalarie#)
    TECHNOLOGIES (codeTechnologie, nomTechnologie, categorieTechnologie)
    CONNAITRE (codeTechnologie#, numSalarie#)

 R1 :
le nom et le prénom du salarié le mieux payé.
 réaliser cette requête de deux façons différentes :
- en utilisant un quantificateur ALL ou ANY (et sans utiliser une fonction)
- en utilisant une fonction (et sans utiliser un quantificateur)
NOMSALARIE PRENOMSALARIE
----------- --------------
Palleja
Xavier
 */

SELECT nomSalarie, prenomSalarie
FROM Salaries
WHERE salaireSalarie >= ALL (
    SELECT salaireSalarie
    FROM Salaries
);

/*
 R2 :
le code et le nom des projets de type Cascade qui ont un budget plus important qu'un
des projets de type Agile.
 réaliser cette requête de deux façons différentes :
- en utilisant un quantificateur ALL ou ANY (et sans utiliser une fonction)
- en utilisant une fonction (et sans utiliser un quantificateur)
CODEPROJET NOMPROJET
----------- -------------
P6
Site Web EDF
*/

SELECT codeProjet, nomProjet
FROM Projets
WHERE typeProjet='Cascade'
AND budgetProjet > ANY (
    SELECT budgetProjet
    FROM Projets
    WHERE typeProjet='Agile'
);

/*
 R3 :
2025-2026
le nom du projet qui possède le plus de salariés.
 réaliser cette requête de deux façons différentes :
- en utilisant un quantificateur ALL ou ANY
- en utilisant une fonction (en effectuant éventuellement un SELECT dans un FROM)
NOMPROJET
-----------------
Site Web Renault
Site Web Peugeot
 */

SELECT nomProjet
FROM Projets p
NATURAL JOIN EtreAffecte
GROUP BY codeProjet, nomProjet
HAVING COUNT(*) = (
    SELECT MAX(COUNT(codeProjet))
    FROM ETREAFFECTE
    GROUP BY codeProjet
);

/*
 R4 :
le nom et prénom des salariés qui ne sont pas affectés à un projet qui contient plus de
trois salariés.
 pour réaliser cette requête, on utilisera une expression de table WITH qui contient le code
des projets qui possèdent plus de trois salariés
NOMSALARIE PRENOMSALARIE
----------- --------------
Palleja
Xavier
Beaux-Nau
Jean
Outan
Laurent
 */
WITH cteProjetTroisSalaries AS (
    SELECT codeProjet
    FROM EtreAffecte
    GROUP BY codeProjet
    HAVING COUNT(numSalarie) > 3
)
SELECT nomSalarie, prenomSalarie
FROM Salaries s
WHERE NOT EXISTS(
    SELECT *
    FROM EtreAffecte ea
    NATURAL JOIN cteProjetTroisSalaries
    WHERE s.numSalarie = ea.numSalarie
);

/*
 R5 :
le pourcentage de salariés qui ont un salarie supérieur à 3500 €.
 pour réaliser cette requête, on utilisera deux expressions de table
POURCENTAGE
------------
40
 */

WITH cteTotalSalarieRiches AS (
    SELECT numSalarie
    FROM Salaries
    WHERE salaireSalarie > 3500
)SELECT COUNT
    (SELECT numSalarie
    FROM Salaries
    WHERE salaireSalarie > 3500)
    /
    (SELECT COUNT(codeSalarie)
    FROM Salaries
    WHERE salaireSalarie > 3500)
    AS pourcentage;
/*
 R6 :
le nom et le prénom des salariés qui connaissent toutes les technologies.
 on fera cette division avec un double NOT EXISTS
NOMSALARIE PRENOMSALARIE
----------- --------------
Stické
Sophie
 */

SELECT nomSalarie, prenomSalarie
FROM Salaries s
WHERE NOT EXISTS(
    SELECT *
    FROM TECHNOLOGIES t
    WHERE NOT EXISTS(
        SELECT *
        FROM CONNAITRE c
        WHERE s.numSalarie = c.numSalarie
        AND t.codeTechnologie = c.codeTechnologie
    )
);

/*
 R7 :
le nom et le prénom des salariés qui connaissent toutes les technologies de la catégorie
Système.
NOMSALARIE PRENOMSALARIE
----------- --------------
Stické
Sophie
Bricot
Judas
 */

SELECT nomSalarie, prenomSalarie
FROM Salaries s
WHERE NOT EXISTS(
    SELECT *
    FROM Technologies t
    WHERE categorieTechnologie='Système'
    AND NOT EXISTS(
        SELECT *
        FROM CONNAITRE c
        WHERE s.numSalarie = c.numSalarie
        AND t.codeTechnologie = c.codeTechnologie
    )
);

/*
 R8 :
le nom et le prénom des salariés qui connaissent toutes les technologies connues par le
salarié Mélanie Zétofrais.
NOMSALARIE PRENOMSALARIE
----------- --------------
Zétofrais
Mélanie
Stické
Sophie
Outan
Laurent
 */

SELECT nomSalarie, prenomSalarie
FROM Salaries s
WHERE prenomSalarie='Mélanie'
AND nomSalarie='Zétofrais'
AND NOT EXISTS(
    SELECT *
    FROM TECHNOLOGIES t
    WHERE NOT EXISTS(
    SELECT *
    FROM CONNAITRE c
    WHERE s.numSalarie = c.numSalarie
    AND t.codeTechnologie = c.codeTechnologie
    )
);

/*
 R9 :
pour chacun des diplômes de la table Diplômes, le nombre de salariés titulaires du
diplôme.
DIPLOMES (referenceDiplome, nomDiplome)
POSSEDER (referenceDiplome#, numSalarie#)

NOMDIPLOME
NB
------------ ---
DUT
6
Licence Pro 5
BTS
4
Ingénieur
1
CAP
0
 */

SELECT nomDiplome, COUNT(numSalarie) AS NB
FROM Diplomes d
NATURAL JOIN Posseder
GROUP BY referenceDiplome, nomDiplome;

/*
 R10 : pour chaque client de la table Clients, le nom du client ainsi que le budget moyen de
ses projets.

CLIENTS (numClient, nomClient, categorieClient, codeVille#)
PROJETS (codeProjet, nomProjet, typeProjet, budgetProjet, numClient#)

NOMCLIENT
BUDGETMOYEN
------------- ------------
Renault
1000000
Peugeot
900000
EDF
550000
IUT
100000
Pizza''maman
 */

SELECT nomClient, AVG(budgetProjet) AS BudgetMoyen
FROM Clients c
NATURAL JOIN Projets
GROUP BY numClient, nomClient;

/*
 R11 : Pour chaque salarié de la table Salariés, le budget moyen des projets sur lesquels il a
été affecté.
NOMSALARIE PRENOMSALARIE BUDGETMOYEN
----------- -------------- -----------------------------------
Stické
Sophie
1150000
Zétofrais
Mélanie
1000000
Sticko
Judas
900000
Zeblouse
Agathe
900000
Némard
Jean
842857
Bricot
Judas
500000
Ouzy
Jacques
300000
Outan
Laurent
300000
Palleja
Xavier
100000
Beaux-Nau
Jean
 */

/*
 R12 : Le code et le nom des projets de type Agile qui ont un budget inférieur à un des projets
de type Cascade.
 réaliser cette requête avec une inéquijointure
CODEPROJET NOMPROJET
----------- ----------
P9
Site XP
 */

/*
 R13 : le nom et le prénom du salarié qui possède le moins de diplômes.
NOMSALARIE PRENOMSALARIE
----------- --------------
Outan
Laurent
 */

/*
 R14 : le code et le nom des projets pour lesquels aucun salarié affecté ne possède plusieurs
diplômes.
CODEPROJET NOMPROJET
----------- -------------
P6
Site Web EDF
P7
CRM EDF
P8
Site Web IUT
 */

/*
 R15 : le nom et le prénom des salariés qui possèdent tous les diplômes qu’a obtenu le salarié
Jean Beaux-Nau.
NOMSALARIE PRENOMSALARIE
----------- --------------
Zeblouse
Agathe
Stické
Sophie
Beaux-Nau
Jean
 */

/*
 R16 : pour chaque client, le nombre de salariés différents qui ont travaillé sur ses projets.
NOMCLIENT
NBSALARIES
------------ -----------
Renault
4
Peugeot
4
EDF
2
IUT
1
Pizza'maman 0
 */

/*
 R17 : pour chaque salarié, le nom et prénom du salarié ainsi que le nombre de (salariés)
subordonnés directs.
NOMSALARIE PRENOMSALARIE NBSUBORDONNES
----------- -------------- --------------
Stické
Sophie
3
Zétofrais
Mélanie
2
Zeblouse
Agathe
2
Palleja
Xavier
2
Beaux-Nau
Jean
0
Némard
Jean
0
Ouzy
Jacques
0
Outan
Laurent
0
Sticko
Judas
0
Bricot
Judas
0
 */

/*
 R18 : pour chacun des clients de la table Clients, afficher le nombre de projets de plus de
500 000 € qui ont été contractés.
NOMCLIENT
NB
----------- ---
Renault
2
EDF
1
Peugeot
1
Pizza'maman 0
IUT
0
 */

/*
 R19 : le nom et le budget des 5 projets qui possèdent les plus gros budgets.
NOMPROJET
BUDGETPROJET
----------------- -----------------
ERP Renault
2000000
ERP Peugeot
1500000
CRM EDF
800000
CRM Renault
700000
Site Web Peugeot
300000
Site Web EDF
300000
Site Web Renault
300000
 */

SELECT nomsalarie -- recupere le nom des salairies
FROM salaries -- depuis la table salaries
WHERE prenomsalarie='Xavier'; -- qui ont pour prenom Xavier
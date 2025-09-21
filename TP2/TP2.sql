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
Serie 3 :
 */

 /*
  R20 : le nom et prénom des supérieurs hiérarchiques (directs et indirects) de la salariée
Sophie Stické.
NIVEAU NOMSALARIE PRENOMSALARIE
*/

SELECT nomSalarie, prenomSalarie
FROM Salaries
START WITH  NOMSALARIE='Stické' AND PRENOMSALARIE='Sophie'
CONNECT BY PRIOR NUMSALARIECHEF = NUMSALARIE;

-- OU ALORS

WITH A (numSalarie, nomSalarie, prenomSalarie, numSalarieChef, niveau)
    AS (
        SELECT numSalarie, nomSalarie, prenomSalarie, numSalarieChef, 1
        FROM Salaries
        WHERE nomSalarie = 'Stické' AND prenomSalarie = 'Sophie'
        UNION ALL
        SELECT chef.numSalarie, chef.nomSalarie,chef.prenomSalarie, chef.numSalarieChef, niveau + 1
        FROM A sub
        JOIN Salaries chef ON sub.numSalarieChef = chef.numSalarie
    )
SELECT niveau, nomSalarie, prenomSalarie
FROM A a;

/*
 R21 : le nom et le prénom des subordonnés directs ou indirects du salarié Mélanie Zétofrais.
NIVEAU NOMSALARIE PRENOMSALARIE
*/

WITH A (numSalarie, nomSalarie, prenomSalarie, numSalarieChef, niveau)
    AS (
        SELECT numSalarie, nomSalarie, prenomSalarie, numSalarieChef, 1
        FROM Salaries
        WHERE nomSalarie = 'Zétofrais' AND prenomSalarie = 'Mélanie'
        UNION ALL
        SELECT sub.numSalarie, sub.nomSalarie,sub.prenomSalarie, sub.numSalarieChef, niveau + 1
        FROM A chef
        JOIN Salaries sub ON sub.numSalarieChef = chef.numSalarie
    )
SELECT niveau, nomSalarie, prenomSalarie
FROM A a;

/*
 R22 : le nom et le prénom des salariés qui sont nés à la même date qu’un autre salarié.
NOMSALARIE PRENOMSALARIE
----------- --------------
Outan
Laurent
Zétofrais
Mélanie
 */

SELECT nomSalarie,prenomSalarie
FROM Salaries s
WHERE dateNaissanceSalarie = ANY (
    SELECT dateNaissanceSalarie
    FROM Salaries s2
    WHERE s.numSalarie <> s2.numSalarie
    );

/*
 R23 : le nom et le prénom des salariés qui ont un salaire supérieur au salaire moyen des
salariés de leur catégorie.
NOMSALARIE PRENOMSALARIE
 */

SELECT nomSalarie, prenomSalarie
FROM Salaries s
WHERE salaireSalarie > ALL (
    SELECT AVG(salaireSalarie)
    FROM Salaries s2
    WHERE s.CATEGORIESALARIE = s2.CATEGORIESALARIE
    );

/*
 R24 : pour chaque catégorie de salarié, indiquer le nom et le prénom du salarié le mieux
payé.
CATEGORIESALARIE NOMSALARIE PRENOMSALARIE
----------------- ----------- --------------
Cadre
Palleja
Xavier
Consultant
Stické
Sophie
Sous-Fifre
Némard
Jean
 */

SELECT CATEGORIESALARIE,NOMSALARIE, PRENOMSALARIE
FROM SALARIES
WHERE SALAIRESALARIE = (
    SELECT MAX(SALAIRESALARIE)
    FROM SALARIES
);

/*
 R25 : Le nom du salarié qui a le nom le plus long.
NOMSALARIE
-----------
Zétofrais
Beaux-Nau
 */

SELECT NUMSALARIE, NOMSALARIE, PRENOMSALARIE
FROM Salaries s
GROUP BY NUMSALARIE, NOMSALARIE, PRENOMSALARIE
HAVING length(NOMSALARIE) = (SELECT MAX(length(NOMSALARIE)) FROM Salaries s2);

/*
 R26 : Le nom des salariés qui ont un nom composé. Le nom des salariés doit être affiché en
lettres majuscules.
NOM
---------
BEAUX-NAU
 */

/*
 R27 : Le nom du projet pour lequel les salaires des salariés ont le plus grand écart-type. On
souhaite que le nom du projet soit écrit en lettres minuscules mais que la première
lettre soit en majuscules.
PROJET
------------
Crm Renault
 */

/*
 R28 : Pour chaque salarié de la table Salaries, le nom, le prénom et le salaire du salarié ainsi
que son classement par rapport à son salaire.
NOMSALARIE PRENOMSALARIE SALAIRESALARIE CLASSEMENT
----------- -------------- --------------- -----------
Palleja
Xavier
5800
1
Zétofrais
Mélanie
4400
2
Zeblouse
Agathe
4000
3
Stické
Sophie
4000
3
Sticko
Judas
3500
5
Bricot
Judas
2800
6
Ouzy
Jacques
2800
6
Némard
Jean
2800
6
Beaux-Nau
Jean
2200
9
Outan
Laurent
2000
10
 */

/*
 R29 : Le nom, le prénom et le salaire des trois salariés les mieux payés.
NOMSALARIE PRENOMSALARIE SALAIRESALARIE
----------- -------------- ---------------
Palleja
Xavier
5800
Zétofrais
Mélanie
4400
Zeblouse
Agathe
4000
Stické
Sophie
4000
 */

/*
 R30 : Afficher la liste des salariés classées par rapport à leur salaire. Pour chacun des salariés
on veut les informations suivantes :
- le nom, le prénom, le salaire et la catégorie
- le nombre de salariés qui sont dans sa catégorie (en le comptant lui-même)
- le classement du salarié selon son salaire par rapport à l’ensemble des salariés
de l’entreprise
- le classement du salarié selon son salaire par rapport aux salariés qui sont dans
sa catégorie
- la différence entre son salaire et le salaire du salarié de la ligne précédente
- la différence entre son salaire et la moyenne des salaires des salariés de sa
catégorie

 */

/*
 Serie 4 :
R31 : Le nom, le prénom et la date de naissance des salariés qui ont leur anniversaire le
même jour qu’un autre salarié.
NOMSALARIE PRENOMSALARIE DATENAISSANCESALARIE
----------- -------------- ---------------------
Palleja
Xavier
26/03/92
Beaux-Nau
Jean
26/03/01
Zétofrais
Mélanie
18/04/99
Outan
Laurent
18/04/99
 */

/*
R32 : Le nom, le prénom, l’âge et le jour de naissance (Lundi, Mardi, …) des salariés qui
sont nés un Dimanche ou un Jeudi.
 */

/*
 R33 : le numéro, le nom, le prénom et le code de la ville de naissance des salariés qui ont été
affectés à tous les projets des clients qui se trouvent dans la ville où ils sont nés.
 on ne doit pas avoir Judas Bricot dans le résultat car il n’existe pas de projets qui
concernent des clients qui sont dans sa ville de naissance.
 */

/*
 R34 : pour chaque catégorie de technologie, le nom de la technologie qui est connue par le
plus grand nombre de salariés.
 */

/*
 R35 : pour chaque catégorie de client, le nom du client qui possède le moins de projets.
 */

/*
 R36 : le nombre de subordonnés directs ou indirects de chacun des salariés de la table
Salaries.
 */

/*
 R37 : le trajet qu’il faut emprunter en train pour aller du siège social de LOGISOFT chez le
client ‘Peugeot’ afin d’avoir le moins de correspondances possible.
 */

/*
 R38 : le trajet qu’il faut emprunter en train pour aller du siège social de LOGISOFT chez le
client ‘Peugeot’ afin d’avoir le trajet le plus court possible (en temps).
 */
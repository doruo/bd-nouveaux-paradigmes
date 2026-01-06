use hayem;

// TP9 - MongoDB

// Partie 1

// R1 : Le nombre de commandes.

db.commandes.count

// R2 : Le nombre de commandes de type ‘Magasin’

db.commandes.find({
    "type": "Magasin"
});

// Partie 1

// R1 : Le nombre de commandes.

db.commandes.countDocuments();

// R2 : Le nombre de commandes de type ‘Magasin’

db.commandes.find({"type": "Magasin"}).count();

// R3 : La  date  (et  uniquement  la  date,  on  ne  veut  pas  l’identifiant  de  la  commande)  
// des commandes de type ‘Interne’.

db.commandes.find(
{ "type": "Interne"},
{ "date.annee": 1,"date.mois": 1,"date.jour": 1});

// R4 : L’identifiant des commandes ainsi que le nom et le prénom du client de la commande 
// de toutes les commandes qui ont été passées par un client sétois. 

db.commandes.find(
{ "client.ville": "Sète"},
{ "client.nom": 1,"client.nom": 1});

// R5 : L’identifiant  des  commandes  passées  par  un  client  qui  n'est  ni  à  Montpellier,  ni  à Nimes, ni à Sète.

db.commandes.find({
    "client.ville": {$nin: ["Montpellier", "Sète", "Nimes"]}
});


// R6 : L’identifiant des 3 commandes les plus vieilles.

// R7 : L’identifiant des commandes de type ‘Interne’ dont le paiement est en ‘Nature’.

// R8 : L’identifiant et le type des commandes passées par Claire Delune.

// R9 : L’identifiant  et  le  type  des commandes passées par le client Tibulaire ou par le client Fassolassie

// R10 : L’identifiant  des  commandes  passées  par  le  client  Claire  Delune  ou  un  31  décembre. 
// Les commandes doivent être classées de la plus vieille à la plus récente

// R11 : L’identifiant des commandes dont on ne connait pas le moyen de paiement.

// R12 : L’identifiant des commandes dont on ne connait pas le moyen de paiement ni le type

// Partie 2

// Partie 3

// R21 : Le nombre de clients qui ont passé au moins une commande.

db.commandes.distinct("client").length;

// R22 : L’identifiant des commandes passées par un client dont le nom commence par un 'A'.

db.commandes.find();

// R23 : L'identifiant des commandes passées par des clients qui ont deux fois la lettre ‘i’ dans leur nom.

// R24 : L'identifiant des commandes passées par des clients qui ont deux lettres ‘c’ consécutives dans leur nom.
// R3 : La  date  (et  uniquement  la  date,  on  ne  veut  pas  l’identifiant  de  la  commande)  
// des commandes de type ‘Interne’.


// R4 : L’identifiant des commandes ainsi que le nom et le prénom du client de la commande 
// de toutes les commandes qui ont été passées par un client sétois. 

// Partie 2

// Partie 3

// R21 : Le nombre de clients qui ont passé au moins une commande.

db.commandes.distinct("client").length;

// R22 : L’identifiant des commandes passées par un client dont le nom commence par un 'A'.

db.commandes.find();

// R23 : L'identifiant des commandes passées par des clients qui ont deux fois la lettre ‘i’ dans leur nom.

// R24 : L'identifiant des commandes passées par des clients qui ont deux lettres ‘c’ consécutives dans leur nom.
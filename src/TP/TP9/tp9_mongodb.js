use("hayem");

// TP9 - MongoDB
// Partie 1

// R1 : Le nombre de commandes.

db.commandes.countDocuments();

// R2 : Le nombre de commandes de type ‘Magasin’

db.commandes.find({"type": "Magasin"}).count();

// R3 : La  date  (et  uniquement  la  date,
// on  ne  veut  pas  l’identifiant  de  la  commande)  
// des commandes de type ‘Interne’.

db.commandes.find(
    { "type": "Interne"},
    { "_id":0 ,"date": 1}
);

// R4 : L’identifiant des commandes 
// ainsi que le nom et le prénom du client de la commande 
// de toutes les commandes qui ont été passées par un client sétois. 

db.commandes.find(
    { "client.ville": "Sète"},
    { "client.nom": 1,"client.nom": 1}
);

// R5 : L’identifiant  des  commandes  passées  par  un  client  
// qui  n'est  ni  à  Montpellier,  ni  à Nimes, ni à Sète.

db.commandes.find(
    {"client.ville": {$nin: ["Montpellier", "Sète", "Nimes"]}},
    {"_id": 1}
);

// R6 : L’identifiant des 3 commandes les plus vieilles.

db.commandes.find(
    {}, 
    {"_id": 1}
)
.sort(
    {"date": -1}
)
.limit(3);

// R7 : L’identifiant des commandes de type ‘Interne’ 
// dont le paiement est en ‘Nature’.

db.commandes.find(
    {"type": "Interne"},
    {"paiement": "Nature"},
    {"_id": 1}
);

// R8 : L’identifiant et le type des 
// commandes passées par Claire Delune.

db.commandes.find(
    {"client.prenom": "Claire", "client.nom": "Delune"},
    {"_id": 1, "type": 1}
);

// R9 : L’identifiant et le type des commandes 
// passées par le client Tibulaire ou par le client Fassolassie

db.commandes.find(
    {$or: [
        {"client.nom": "Tibulaire"},
        {"client.nom": "Fassolassie"}
    ]},
    {"_id": 1, "type": 1}
);

// R10 : L’identifiant  des  commandes  
// passées  par  le  client  Claire  Delune  ou  un  31  décembre. 
// Les commandes doivent être classées de la plus vieille à la plus récente

db.commandes.find(
    {$or: [
        {"client.prenom": "Claire", "client.nom": "Delune"},
        {"date.jour": 31, "date.mois": 12}
    ]},
    {"_id": 1, "type": 1}
)
.sort({"date": -1});

// R11 : L’identifiant des commandes dont on ne connait pas le moyen de paiement.

db.commandes.find(
    {}, 
    {"_id": 1}
);

// R12 : L’identifiant des commandes dont on ne connait pas le moyen de paiement ni le type

db.commandes.find(
    {}, 
    {"_id": 1}
);

// Partie 2

// Partie 3

// R21 : Le nombre de clients qui ont passé au moins une commande.

db.commandes.distinct("client").length;

// R22 : L’identifiant des commandes passées par un client dont le nom commence par un 'A'.

db.commandes.find(
    {"client.nom": /^a/}, 
    {"_id": 1}
);

// R23 : L'identifiant des commandes passées 
// par des clients qui ont deux fois la lettre ‘i’ dans leur nom.

db.commandes.find(
    {"client.nom": /i.*i/}, 
    {"_id": 1}
);

// R24 : L'identifiant des commandes passées 
// par des clients qui ont deux lettres ‘c’ consécutives dans leur nom.

db.commandes.find(
    {"client.nom": /cc/}, 
    {"_id": 1}
);
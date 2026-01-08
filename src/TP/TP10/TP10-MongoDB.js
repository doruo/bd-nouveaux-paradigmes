// TP10 - MongoDB

// The current database to use.
use("hayem");

// Partie 1

// Partie 2

// Partie 3

// R30 : Le nombre de commandes.

db.commandes.aggregate([
    {$count: "nbCommandes"}
]);

// R31 : Les commandes de type ‘Interne’.

db.commandes.aggregate([
    {$project: {"type": "Interne"}}
]);

// R32 : Le nombre de commandes de type ‘Interne’ payées en ‘Nature’. 

db.commandes.aggregate([
    {$project: {"type": "Interne", "paiement": "Nature"}},
    {$count: "nbCommandes"}
]);

// R33 : l’identifiant  des  commandes  passées  
// par  le  client  Claire  Delune  qui  concernent  une Cravate,
// classées selon l'identifiant.

db.commandes.aggregate([
    {
        $project: 
        {
            "client.prenom": "Claire", 
            "client.nom": "Delune",
            "produits.nom": "Cravate"
        }
    },
    {$sort: {"_id": 1}}
]);
// R34 : L’identifiant des commandes qui ont une ‘Cravate’ à 31 €.

db.commandes.aggregate([
    {
        $project: 
        {
            "produits.nom": "Cravate",
            "produits.prix": 31
        }
    },
    {$sort: {"_id": 1}}
]);

// R35 : Le nombre de magasins dans chaque ville.

db.commandes.aggregate([]);

// R36 : Le nombre de commandes de chaque client.

db.commandes.aggregate([]);

// R37 : Le  montant  total  de  chaque  commande.  
// Les  commandes  doivent  être  classées  de  la 
// plus chère à la moins chère.

db.commandes.aggregate([]);
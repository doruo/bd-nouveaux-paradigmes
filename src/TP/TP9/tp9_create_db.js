use("hayem");

db.magasins.drop();
db.commandes.drop();

db.createCollection("magasins");
db.createCollection("commandes");

db.magasins.insertMany([
  {
    "_id": "M1",
    "description": "Au cœur de la ville de Frontignan se dresse majestueusement Le Pénitencier, un magasin aux allures mystérieuses et captivantes. Ses murs en pierre grise et ses grandes portes de chêne accueillent les curieux avec une aura envoûtante. À l'intérieur, l'atmosphère est teintée de secrets anciens et de mystères contemporains. Des artefacts rares et des curiosités énigmatiques ornent les étagères sombres, suscitant la curiosité des visiteurs. Parmi les trésors exposés, une statue ancestrale de Ninja trône en gardien silencieux, ajoutant une touche de légende à cet établissement intrigant.",
    "nom": "Le Pénitencier",
    "ville": "Frontignan"
  },
  {
    "_id": "M2",
    "description": "La Conciergerie, éblouissant joyau niché au cœur de Marsillargues, séduit par son élégance intemporelle. Ses vitrines aux nuances chatoyantes invitent à une expérience shopping unique. À l'intérieur, ce bazar sophistiqué offre une panoplie d'articles exquis, allant des objets d'artisanat local aux trouvailles exotiques. Les étagères regorgent de livres rares sur le SQL, d'œuvres d'art envoûtantes et de gadgets ingénieux. Au milieu de cette collection variée, trône un Tamagotchi parlant couramment le SQL, le langage des dieux de l'informatique, symbole de la modernité s'alliant harmonieusement à l'atmosphère envoûtante de cet établissement.",
    "nom": "La Conciergerie",
    "ville": "Marsillargues"
  },
  {
    "_id": "M3",
    "description": "Près du port de Frontignan se dresse majestueusement La Santé, un magasin singulier dédié au bien-être et à la découverte. Ses façades blanches, ornées de touches vertes apaisantes, invitent à un voyage intérieur. À l'intérieur, une collection soigneusement sélectionnée d'articles pour la santé et le bien-être attend les visiteurs : herbes aromatiques, thés exotiques, équipements de yoga, et même des ouvrages sur la médecine ancestrale. Parmi les rayons, un livre sur les secrets de la santé Ninja attire l'attention, tandis que des hologrammes diffusent subtilement des informations sur le langage SQL, fusionnant ainsi savoir ancien et technologie moderne.",
    "nom": "La Santé",
    "ville": "Frontignan"
  }
]);

db.commandes.insertMany(
    [
  {
    "_id": "004",
    "client": {
      "id": "C4",
      "nom": "Fassolassie",
      "prenom": "Rémi",
      "categorie": "Client occasionnel"
    },
    "date": {
      "jour": 8,
      "mois": 2,
      "annee": 2023
    },
    "paiement": "Nature",
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 35
      },
      {
        "id": "P3",
        "nom": "Haut de Forme",
        "montant": 65
      }
    ],
    "type": "Magasin"
  },
  {
    "_id": "013",
    "client": {
      "id": "C7",
      "nom": "Tibulaire",
      "prenom": "Pat",
      "categorie": "Client patibulaire"
    },
    "date": {
      "jour": 4,
      "mois": 10,
      "annee": 2023
    },
    "paiement": "Liquide",
    "produits": [
      {
        "id": "P2",
        "nom": "Costume",
        "montant": 135
      },
      {
        "id": "P8",
        "nom": "Chaussettes Ninja",
        "montant": 100
      }
    ],
    "type": "Magasin"
  },
  {
    "_id": "007",
    "client": {
      "id": "C6",
      "nom": "Delune",
      "prenom": "Claire",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 23,
      "mois": 4,
      "annee": 2022
    },
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 35
      },
      {
        "id": "P2",
        "nom": "Costume",
        "montant": 135
      },
      {
        "id": "P6",
        "nom": "Noeud Papillon",
        "montant": 21
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "011",
    "client": {
      "id": "C1",
      "nom": "Niscotch",
      "prenom": "Nicole",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 15,
      "mois": 8,
      "annee": 2022
    },
    "paiement": "PayPal",
    "produits": [
      {
        "id": "P6",
        "nom": "Noeud Papillon",
        "montant": 18
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "005",
    "client": {
      "id": "C5",
      "nom": "Afrit",
      "prenom": "Barack",
      "categorie": "Bon client",
      "ville": "Sète"
    },
    "date": {
      "jour": 11,
      "mois": 3,
      "annee": 2023
    },
    "paiement": "Liquide",
    "produits": [
      {
        "id": "P5",
        "nom": "Veston",
        "montant": 58
      },
      {
        "id": "P7",
        "nom": "Ceinture",
        "montant": 36
      }
    ],
    "type": "Magasin"
  },
  {
    "_id": "012",
    "client": {
      "id": "C6",
      "nom": "Delune",
      "prenom": "Claire",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 15,
      "mois": 8,
      "annee": 2022
    },
    "paiement": "Liquide",
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 30
      },
      {
        "id": "P3",
        "nom": "Haut de Forme",
        "montant": 60
      },
      {
        "id": "P4",
        "nom": "Bretelles",
        "montant": 22
      },
      {
        "id": "P7",
        "nom": "Ceinture",
        "montant": 30
      },
      {
        "id": "P8",
        "nom": "Chaussettes Ninja",
        "montant": 120
      }
    ],
    "type": "Interne"
  },
  {
    "_id": "017",
    "client": {
      "id": "C9",
      "nom": "Menvussa",
      "prenom": "Gérard",
      "categorie": "Client occasionnel",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 31,
      "mois": 12,
      "annee": 2022
    },
    "paiement": "PayPal",
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 30
      },
      {
        "id": "P6",
        "nom": "Noeud Papillon",
        "montant": 16
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "010",
    "client": {
      "id": "C6",
      "nom": "Delune",
      "prenom": "Claire",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 1,
      "mois": 7,
      "annee": 2023
    },
    "paiement": "CB",
    "produits": [
      {
        "id": "P5",
        "nom": "Veston",
        "montant": 50
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "014",
    "client": {
      "id": "C5",
      "nom": "Afrit",
      "prenom": "Barack",
      "categorie": "Bon client",
      "ville": "Sète"
    },
    "date": {
      "jour": 16,
      "mois": 11,
      "annee": 2021
    },
    "paiement": "CB",
    "produits": [
      {
        "id": "P4",
        "nom": "Bretelles",
        "montant": 28
      }
    ],
    "type": "Magasin"
  },
  {
    "_id": "002",
    "client": {
      "id": "C2",
      "nom": "Diccule",
      "prenom": "Terry",
      "categorie": "Bon client",
      "ville": "Nimes"
    },
    "date": {
      "jour": 17,
      "mois": 12,
      "annee": 2022
    },
    "paiement": "CB",
    "produits": [
      {
        "id": "P2",
        "nom": "Costume",
        "montant": 135
      },
      {
        "id": "P3",
        "nom": "Haut de Forme",
        "montant": 65
      },
      {
        "id": "P4",
        "nom": "Bretelles",
        "montant": 28
      },
      {
        "id": "P5",
        "nom": "Veston",
        "montant": 58
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "015",
    "client": {
      "id": "C2",
      "nom": "Diccule",
      "prenom": "Terry",
      "categorie": "Bon client",
      "ville": "Nimes"
    },
    "date": {
      "jour": 31,
      "mois": 12,
      "annee": 2022
    },
    "paiement": "Nature",
    "produits": [
      {
        "id": "P3",
        "nom": "Haut de Forme",
        "montant": 60
      },
      {
        "id": "P5",
        "nom": "Veston",
        "montant": 53
      },
      {
        "id": "P6",
        "nom": "Noeud Papillon",
        "montant": 16
      }
    ],
    "type": "Interne"
  },
  {
    "_id": "001",
    "client": {
      "id": "C1",
      "nom": "Niscotch",
      "prenom": "Nicole",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 15,
      "mois": 1,
      "annee": 2022
    },
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 35
      },
      {
        "id": "P5",
        "nom": "Veston",
        "montant": 58
      },
      {
        "id": "P7",
        "nom": "Ceinture",
        "montant": 36
      }
    ]
  },
  {
    "_id": "009",
    "client": {
      "id": "C5",
      "nom": "Afrit",
      "prenom": "Barack",
      "categorie": "Bon client",
      "ville": "Sète"
    },
    "date": {
      "jour": 12,
      "mois": 6,
      "annee": 2022
    },
    "paiement": "Liquide",
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 31
      },
      {
        "id": "P2",
        "nom": "Costume",
        "montant": 100
      },
      {
        "id": "P3",
        "nom": "Haut de Forme",
        "montant": 60
      }
    ],
    "type": "Magasin"
  },
  {
    "_id": "016",
    "client": {
      "id": "C8",
      "nom": "Graff",
      "prenom": "Oto",
      "categorie": "Client patibulaire",
      "ville": "Nimes"
    },
    "date": {
      "jour": 31,
      "mois": 12,
      "annee": 2021
    },
    "paiement": "Paypal",
    "produits": [
      {
        "id": "P1",
        "nom": "Cravate",
        "montant": 30
      },
      {
        "id": "P7",
        "nom": "Ceinture",
        "montant": 31
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "006",
    "client": {
      "id": "C1",
      "nom": "Niscotch",
      "prenom": "Nicole",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 22,
      "mois": 4,
      "annee": 2023
    },
    "paiement": "CB",
    "produits": [
      {
        "id": "P4",
        "nom": "Bretelles",
        "montant": 28
      }
    ],
    "type": "Magasin"
  },
  {
    "_id": "003",
    "client": {
      "id": "C3",
      "nom": "Niscotch",
      "prenom": "Nicole",
      "categorie": "Client occasionnel"
    },
    "date": {
      "jour": 31,
      "mois": 1,
      "annee": 2022
    },
    "paiement": "CB",
    "produits": [
      {
        "id": "P2",
        "nom": "Costume",
        "montant": 135
      }
    ],
    "type": "Internet"
  },
  {
    "_id": "008",
    "client": {
      "id": "C1",
      "nom": "Niscotch",
      "prenom": "Nicole",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 13,
      "mois": 10,
      "annee": 2023
    },
    "paiement": "CB",
    "produits": [
      {
        "id": "P3",
        "nom": "Haut de Forme",
        "montant": 65
      },
      {
        "id": "P6",
        "nom": "Noeud Papillon",
        "montant": 21
      },
      {
        "id": "P8",
        "nom": "Chaussettes Ninja",
        "montant": 118
      }
    ]
  },
  {
    "_id": "018",
    "date": {
      "jour": 11,
      "mois": 12,
      "annee": 2023
    },
    "paiement": "CB",
    "produits": []
  },
  {
    "_id": "019",
    "client": {
      "id": "C1",
      "nom": "Niscotch",
      "prenom": "Nicole",
      "categorie": "Bon client",
      "ville": "Montpellier"
    },
    "date": {
      "jour": 11,
      "mois": 12,
      "annee": 2023
    },
    "paiement": "CB"
  }
]
);




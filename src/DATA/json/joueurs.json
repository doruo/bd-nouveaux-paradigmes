db.createCollection("joueurs", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "_id", "nom", "dateNaissance"],
         properties: {
            _id: {
               bsonType: "string",
               description: "'_id' est la clé et est obligatoire"
            },	
 			nom: {
               bsonType: "string",
               description: "'nom' doit être un string et est obligatoire"
            },
			prenom: {
               bsonType: "string",
               description: "'prenom' doit être un string"
            },
            dateNaissance: {
				bsonType: "object",
				required: [ "jour", "mois", "annee"],
                properties: {
                   jour: {
                   bsonType: "int",
				   minimum: 1,
                   maximum: 31,
                   description: "'jour' est entier compris entre 1 et 31 et est obligatoire"
                   },	
 			       mois: {
                   bsonType: "int",
				   minimum: 1,
                   maximum: 12,
                   description: "'mois' est entier compris entre 1 et 12 et est obligatoire"
                   },
			       annee: {
                   bsonType: "int",
                   description: "'annee' est entier et est obligatoire"
			       }
			    }
			},
			ville: {
               bsonType: "string",
               description: "'ville' doit être un string"
            },
			club: {
				bsonType: "object",
				required: [ "id", "nom"],
                properties: {
                   id: {
                   bsonType: "string",
                   description: "'id' est un string et est obligatoire"
                   },	
 			       nom: {
                   bsonType: "string",
				   description: "'nom' est un string et est obligatoire"
                   },
			       ville: {
                   bsonType: "string",
                   description: "'ville' est un string"
			       }
			    }
			},
			resultats: {
                bsonType: "array",
				required: [ "idTournoi", "nomTournoi"],
                items: {
				   bsonType:"object",
                   properties:{	
				      idTournoi: {
                      bsonType: "string",
                      description: "'idTournoi' est un string et est obligatoire"
                      },	
 			          nomTournoi: {
                      bsonType: "string",
				      description: "'nomTournoi' est un string et est obligatoire"
                      },
			          classement: {
                      bsonType: "int",
					  minimum: 1,
                      maximum: 10,
                      description: "'classement' est un entier"
			          }
				   }	  
			    }   
            }
          }
        }
   }
})
package stockage.mongo;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;
import metier.Joueur;
import java.util.List;

public class MongoDestinationMigration {

    private ConnexionMongoDB connexionMongoDB;
    private MongoClient client;

    protected MongoDatabase database;
    public MongoDestinationMigration(ConnexionMongoDB connexionMongoDB) {
        this.connexionMongoDB = connexionMongoDB;
    }

    /**
     * Permet au programme d'initialiser la connexion avec la base MongoDB.
     */
    public void connexion() {
        client = connexionMongoDB.ouvrirConnexion();
        database = client.getDatabase(connexionMongoDB.getDatabaseName());
        System.out.println("MongoDB connecté");
    }

    /**
     * Permet au programme de fermer la connexion avec la base MongoDB.
     */
    public void deconnexion() {
        client.close();
        System.out.println("MongoDB déconnecté");
    }

    /**
     * Migre (écrit) une liste d'objets "Joueur" dans la base de données Mongo en effectuant diverses requêtes.
     * Cette méthode assure la conversion des données contenues dans les objets en différents documents.
     * Les résultats des joueurs doivent aussi être migrés.
     * @param joueurs : liste de joueurs à migrer vers la base de données Mongo.
     */
    public void migrerJoueurs(List<Joueur> joueurs) {
        System.out.println("Migration des données vers Mongo...");

        //A compléter !

        System.out.println("Migration des données des joueurs vers Mongo effectuée.");
    }
}

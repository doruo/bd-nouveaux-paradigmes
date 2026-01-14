package stockage.mongo;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;


public class ConnexionMongoDB {

    private String url = "mongodb://loginACompleter:motDePasseACompleter@162.38.222.152:27018/iut";

    private String databaseName = "aCompleter";

    public MongoClient ouvrirConnexion() {
        return MongoClients.create(url);
    }

    public String getDatabaseName() {
        return databaseName;
    }
}

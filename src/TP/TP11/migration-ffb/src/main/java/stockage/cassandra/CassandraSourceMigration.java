package stockage.cassandra;

import metier.Joueur;
import metier.Resultat;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class CassandraSourceMigration {

    private ConnexionCassandra connexionCassandra;

    private Connection connection;

    private Statement st;

    public CassandraSourceMigration(ConnexionCassandra connexionCassandra) {
        this.connexionCassandra = connexionCassandra;
    }

    /**
     * Permet au programme d'initialiser la connexion avec la base Cassandra.
     */
    public void connexion() {
        try {
            connection = this.connexionCassandra.ouvrirConnexion();
            st = connection.createStatement();
            System.out.println("Cassandra connecté");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Permet au programme de fermer la connexion avec la base Cassandra.
     */
    public void deconnexion() {
        try {
            if(!st.isClosed()) {
                st.close();
            }
            connection.close();
            System.out.println("Cassandra déconnectée");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Effectue une requête auprès de la base de données Cassandra afin de récupérer les données des joueurs.
     * Cette méthode assure la conversion des données récupérées auprès de la base en objets métiers de type "Joueur".
     * Pour chaque joueur, il faudra aussi récupérer ses résultats.
     * @return Une liste d'objets "Joueur" construits à partir des données récupérées auprès de la base de données Cassandra.
     */
    public List<Joueur> recupererJoueurs() {
        throw new RuntimeException("Pas encore implémenté !");
    }

    /**
     * Effectue une requête auprès de la base de données Cassandra afin de récupérer les résultats d'un joueur.
     * Cette méthode assure la conversion des données récupérées auprès de la base en objets métiers de type "Resultat".
     * @param joueur : le joueur dont on osuhaite récupérer les résultats.
     * @return Une liste d'objets "Joueur" construits à partir des données récupérées auprès de la base de données Cassandra.
     */
    private List<Resultat> recupererResultatsJoueur(Joueur joueur) {
        throw new RuntimeException("Pas encore implémenté !");
    }
}

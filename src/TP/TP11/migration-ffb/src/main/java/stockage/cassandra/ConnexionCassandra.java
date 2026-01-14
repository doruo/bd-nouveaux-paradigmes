package stockage.cassandra;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionCassandra {
    String url = "jdbc:cassandra://162.38.222.152:9034/aCompleter";
    String driver = "com.dbschema.CassandraJdbcDriver";
    String user = "aCompleter";
    String pass = "aCompleter";
    public Connection ouvrirConnexion() {
        try {
            Class.forName(driver);
            return DriverManager.getConnection(url,user,pass);
        }
        catch(SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}

package projet_s3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.Statement;


public class EtudeMarcheDAOImpl implements EtudeMarcheDAO {
	private DaoFactory daoFactory;

	EtudeMarcheDAOImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void ajouter(EtudeMarche etudemarche) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            if (connexion != null) {
                System.out.println("Connexion réussie à la base de données !");
            } else {
                System.out.println("La connexion a échoué.");
            }

            preparedStatement = connexion.prepareStatement(
                "INSERT INTO etude_marche(nom_projet, type_investissement, ville_region, adresse_exacte, superficie_estimee, objectif_etude, type_clientele, concurrents, id_user) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);"
            );
            preparedStatement.setString(1, etudemarche.getNomProjet());
            preparedStatement.setString(2, etudemarche.getTypeInvestissement());
            preparedStatement.setString(3, etudemarche.getVilleRegion());
            preparedStatement.setString(4, etudemarche.getAdresseExacte());
            preparedStatement.setString(5, etudemarche.getSuperficieEstimee());
            preparedStatement.setString(6, etudemarche.getobjectifEtude());
            preparedStatement.setString(7, etudemarche.gettypeClientele());
            preparedStatement.setString(8, etudemarche.getconcurrents());
            preparedStatement.setInt(9, etudemarche.getIdUser());

            preparedStatement.executeUpdate();
            System.out.println("Enregistrement effectué avec succès.");
        } catch (SQLException e) {
            System.out.println("Erreur d'exécution SQL : " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connexion != null) connexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public List<EtudeMarche> lister() {
        List<EtudeMarche> etudem = new ArrayList<EtudeMarche>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
        	connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT nom_projet, type_investissement, ville_region, adresse_exacte, superficie_estimee, objectif_etude, type_clientele, concurrents, id_user FROM etude_marche;");


            while (resultat.next()) {
            	EtudeMarche etudemarche = new EtudeMarche();
                etudemarche.setNomProjet(resultat.getString("nom_projet"));
                etudemarche.setTypeInvestissement(resultat.getString("type_investissement"));
                etudemarche.setVilleRegion(resultat.getString("ville_region"));
                etudemarche.setAdresseExacte(resultat.getString("adresse_exacte"));
                etudemarche.setSuperficieEstimee(resultat.getString("superficie_estimee"));
                etudemarche.setobjectifEtude(resultat.getString("objectif_etude"));
                etudemarche.settypeClientele(resultat.getString("type_clientele"));
                etudemarche.setconcurrents(resultat.getString("concurrents"));
                etudemarche.setIdUser(resultat.getInt("id_user"));

                etudem.add(etudemarche);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return etudem;
    }

}
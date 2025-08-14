package projet_s3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.Statement;


public class EtudeFinancierDAOImpl implements EtudeFinancierDAO {
	private DaoFactory daoFactory;

	EtudeFinancierDAOImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void ajouter(EtudeFinancier etudefinancier) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement(
                "INSERT INTO etude_financier(nom_complet, telephone, nom_du_projet, type_investissement, ville_region, adresse_exacte, superficie_estimee, budget_estimee, source_financement) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);"
            );
            preparedStatement.setString(1, etudefinancier.getNomComplet());
            preparedStatement.setString(2, etudefinancier.getTelephone());
            preparedStatement.setString(3, etudefinancier.getNomDuProjet());
            preparedStatement.setString(4, etudefinancier.getTypeInvestissement());
            preparedStatement.setString(5, etudefinancier.getVilleRegion());
            preparedStatement.setString(6, etudefinancier.getAdresseExacte());
            preparedStatement.setString(7, etudefinancier.getSuperficieEstimee());
            preparedStatement.setString(8, etudefinancier.getBudgetEstimee());
            preparedStatement.setString(9, etudefinancier.getSourceFinancement());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        
    }

    @Override
    public List<EtudeFinancier> lister() {
        List<EtudeFinancier> etudef = new ArrayList<EtudeFinancier>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
        	connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT nom_complet, telephone, nom_du_projet, type_investissement, ville_region, adresse_exacte, superficie_estimee, budget_estimee, source_financement FROM etude_financier;");


            while (resultat.next()) {
            	EtudeFinancier etudefinancier = new EtudeFinancier();
                etudefinancier.setNomComplet(resultat.getString("nom_complet"));
                etudefinancier.setTelephone(resultat.getString("telephone"));
                etudefinancier.setNomDuProjet(resultat.getString("nom_du_projet"));
                etudefinancier.setTypeInvestissement(resultat.getString("type_investissement"));
                etudefinancier.setVilleRegion(resultat.getString("ville_region"));
                etudefinancier.setAdresseExacte(resultat.getString("adresse_exacte"));
                etudefinancier.setSuperficieEstimee(resultat.getString("superficie_estimee"));
                etudefinancier.setBudgetEstimee(resultat.getString("budget_estimee"));
                etudefinancier.setSourceFinancement(resultat.getString("source_financement"));

                etudef.add(etudefinancier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return etudef;
    }

}
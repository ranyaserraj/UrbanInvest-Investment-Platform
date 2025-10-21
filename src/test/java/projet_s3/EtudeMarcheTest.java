package projet_s3;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests unitaires pour la classe EtudeMarche
 */
public class EtudeMarcheTest {

    private EtudeMarche etudeMarche;

    @BeforeEach
    public void setUp() {
        etudeMarche = new EtudeMarche();
    }

    @Test
    public void testGetSetNomProjet() {
        // Test getter et setter pour nomProjet
        String nomProjet = "Étude de marché immobilier";
        etudeMarche.setNomProjet(nomProjet);
        assertEquals(nomProjet, etudeMarche.getNomProjet());
    }

    @Test
    public void testGetSetTypeInvestissement() {
        // Test getter et setter pour typeInvestissement
        String typeInvestissement = "Commercial";
        etudeMarche.setTypeInvestissement(typeInvestissement);
        assertEquals(typeInvestissement, etudeMarche.getTypeInvestissement());
    }

    @Test
    public void testGetSetVilleRegion() {
        // Test getter et setter pour villeRegion
        String villeRegion = "Marseille";
        etudeMarche.setVilleRegion(villeRegion);
        assertEquals(villeRegion, etudeMarche.getVilleRegion());
    }

    @Test
    public void testGetSetAdresseExacte() {
        // Test getter et setter pour adresseExacte
        String adresseExacte = "789 Boulevard de la République, 13001 Marseille";
        etudeMarche.setAdresseExacte(adresseExacte);
        assertEquals(adresseExacte, etudeMarche.getAdresseExacte());
    }

    @Test
    public void testGetSetSuperficieEstimee() {
        // Test getter et setter pour superficieEstimee
        String superficieEstimee = "200 m²";
        etudeMarche.setSuperficieEstimee(superficieEstimee);
        assertEquals(superficieEstimee, etudeMarche.getSuperficieEstimee());
    }

    @Test
    public void testGetSetObjectifEtude() {
        // Test getter et setter pour objectifEtude
        String objectifEtude = "Analyser la faisabilité du projet";
        etudeMarche.setobjectifEtude(objectifEtude);
        assertEquals(objectifEtude, etudeMarche.getobjectifEtude());
    }

    @Test
    public void testGetSetTypeClientele() {
        // Test getter et setter pour typeClientele
        String typeClientele = "Entreprises";
        etudeMarche.settypeClientele(typeClientele);
        assertEquals(typeClientele, etudeMarche.gettypeClientele());
    }

    @Test
    public void testGetSetConcurrents() {
        // Test getter et setter pour concurrents
        String concurrents = "Concurrent A, Concurrent B";
        etudeMarche.setconcurrents(concurrents);
        assertEquals(concurrents, etudeMarche.getconcurrents());
    }

    @Test
    public void testGetSetIdUser() {
        // Test getter et setter pour idUser
        int idUser = 123;
        etudeMarche.setIdUser(idUser);
        assertEquals(idUser, etudeMarche.getIdUser());
    }

    @Test
    public void testEtudeMarcheComplet() {
        // Test d'un objet EtudeMarche complet
        etudeMarche.setNomProjet("Étude marché commercial");
        etudeMarche.setTypeInvestissement("Bureau");
        etudeMarche.setVilleRegion("Toulouse");
        etudeMarche.setAdresseExacte("321 Rue de la Garonne, 31000 Toulouse");
        etudeMarche.setSuperficieEstimee("300 m²");
        etudeMarche.setobjectifEtude("Évaluer la demande locale");
        etudeMarche.settypeClientele("PME");
        etudeMarche.setconcurrents("Concurrent 1, Concurrent 2, Concurrent 3");
        etudeMarche.setIdUser(456);

        assertEquals("Étude marché commercial", etudeMarche.getNomProjet());
        assertEquals("Bureau", etudeMarche.getTypeInvestissement());
        assertEquals("Toulouse", etudeMarche.getVilleRegion());
        assertEquals("321 Rue de la Garonne, 31000 Toulouse", etudeMarche.getAdresseExacte());
        assertEquals("300 m²", etudeMarche.getSuperficieEstimee());
        assertEquals("Évaluer la demande locale", etudeMarche.getobjectifEtude());
        assertEquals("PME", etudeMarche.gettypeClientele());
        assertEquals("Concurrent 1, Concurrent 2, Concurrent 3", etudeMarche.getconcurrents());
        assertEquals(456, etudeMarche.getIdUser());
    }

    @Test
    public void testEtudeMarcheVide() {
        // Test d'un objet EtudeMarche vide
        assertNull(etudeMarche.getNomProjet());
        assertNull(etudeMarche.getTypeInvestissement());
        assertNull(etudeMarche.getVilleRegion());
        assertNull(etudeMarche.getAdresseExacte());
        assertNull(etudeMarche.getSuperficieEstimee());
        assertNull(etudeMarche.getobjectifEtude());
        assertNull(etudeMarche.gettypeClientele());
        assertNull(etudeMarche.getconcurrents());
        assertEquals(0, etudeMarche.getIdUser());
    }

    @Test
    public void testIdUserParDefaut() {
        // Test que l'idUser est 0 par défaut
        assertEquals(0, etudeMarche.getIdUser());
    }
}

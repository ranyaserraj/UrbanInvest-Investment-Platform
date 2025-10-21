package projet_s3;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests unitaires pour la classe EtudeFinancier
 */
public class EtudeFinancierTest {

    private EtudeFinancier etudeFinancier;

    @BeforeEach
    public void setUp() {
        etudeFinancier = new EtudeFinancier();
    }

    @Test
    public void testGetSetNomComplet() {
        // Test getter et setter pour nomComplet
        String nomComplet = "John Doe";
        etudeFinancier.setNomComplet(nomComplet);
        assertEquals(nomComplet, etudeFinancier.getNomComplet());
    }

    @Test
    public void testGetSetTelephone() {
        // Test getter et setter pour telephone
        String telephone = "0123456789";
        etudeFinancier.setTelephone(telephone);
        assertEquals(telephone, etudeFinancier.getTelephone());
    }

    @Test
    public void testGetSetNomDuProjet() {
        // Test getter et setter pour nomDuProjet
        String nomDuProjet = "Projet Immobilier";
        etudeFinancier.setNomDuProjet(nomDuProjet);
        assertEquals(nomDuProjet, etudeFinancier.getNomDuProjet());
    }

    @Test
    public void testGetSetTypeInvestissement() {
        // Test getter et setter pour typeInvestissement
        String typeInvestissement = "Immobilier";
        etudeFinancier.setTypeInvestissement(typeInvestissement);
        assertEquals(typeInvestissement, etudeFinancier.getTypeInvestissement());
    }

    @Test
    public void testGetSetVilleRegion() {
        // Test getter et setter pour villeRegion
        String villeRegion = "Paris";
        etudeFinancier.setVilleRegion(villeRegion);
        assertEquals(villeRegion, etudeFinancier.getVilleRegion());
    }

    @Test
    public void testGetSetAdresseExacte() {
        // Test getter et setter pour adresseExacte
        String adresseExacte = "123 Rue de la Paix, 75001 Paris";
        etudeFinancier.setAdresseExacte(adresseExacte);
        assertEquals(adresseExacte, etudeFinancier.getAdresseExacte());
    }

    @Test
    public void testGetSetSuperficieEstimee() {
        // Test getter et setter pour superficieEstimee
        String superficieEstimee = "100 m²";
        etudeFinancier.setSuperficieEstimee(superficieEstimee);
        assertEquals(superficieEstimee, etudeFinancier.getSuperficieEstimee());
    }

    @Test
    public void testGetSetBudgetEstimee() {
        // Test getter et setter pour budgetEstimee
        String budgetEstimee = "500000 €";
        etudeFinancier.setBudgetEstimee(budgetEstimee);
        assertEquals(budgetEstimee, etudeFinancier.getBudgetEstimee());
    }

    @Test
    public void testGetSetSourceFinancement() {
        // Test getter et setter pour sourceFinancement
        String sourceFinancement = "Prêt bancaire";
        etudeFinancier.setSourceFinancement(sourceFinancement);
        assertEquals(sourceFinancement, etudeFinancier.getSourceFinancement());
    }

    @Test
    public void testEtudeFinancierComplet() {
        // Test d'un objet EtudeFinancier complet
        etudeFinancier.setNomComplet("Jane Smith");
        etudeFinancier.setTelephone("0987654321");
        etudeFinancier.setNomDuProjet("Résidence Les Jardins");
        etudeFinancier.setTypeInvestissement("Résidentiel");
        etudeFinancier.setVilleRegion("Lyon");
        etudeFinancier.setAdresseExacte("456 Avenue des Champs, 69000 Lyon");
        etudeFinancier.setSuperficieEstimee("150 m²");
        etudeFinancier.setBudgetEstimee("750000 €");
        etudeFinancier.setSourceFinancement("Épargne personnelle");

        assertEquals("Jane Smith", etudeFinancier.getNomComplet());
        assertEquals("0987654321", etudeFinancier.getTelephone());
        assertEquals("Résidence Les Jardins", etudeFinancier.getNomDuProjet());
        assertEquals("Résidentiel", etudeFinancier.getTypeInvestissement());
        assertEquals("Lyon", etudeFinancier.getVilleRegion());
        assertEquals("456 Avenue des Champs, 69000 Lyon", etudeFinancier.getAdresseExacte());
        assertEquals("150 m²", etudeFinancier.getSuperficieEstimee());
        assertEquals("750000 €", etudeFinancier.getBudgetEstimee());
        assertEquals("Épargne personnelle", etudeFinancier.getSourceFinancement());
    }

    @Test
    public void testEtudeFinancierVide() {
        // Test d'un objet EtudeFinancier vide
        assertNull(etudeFinancier.getNomComplet());
        assertNull(etudeFinancier.getTelephone());
        assertNull(etudeFinancier.getNomDuProjet());
        assertNull(etudeFinancier.getTypeInvestissement());
        assertNull(etudeFinancier.getVilleRegion());
        assertNull(etudeFinancier.getAdresseExacte());
        assertNull(etudeFinancier.getSuperficieEstimee());
        assertNull(etudeFinancier.getBudgetEstimee());
        assertNull(etudeFinancier.getSourceFinancement());
    }
}

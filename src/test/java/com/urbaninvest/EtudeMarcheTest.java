package com.urbaninvest;

import projet_s3.EtudeMarche;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests unitaires pour la classe EtudeMarche
 */
public class EtudeMarcheTest {
    
    private EtudeMarche etudeMarche;
    
    @BeforeEach
    void setUp() {
        etudeMarche = new EtudeMarche();
    }
    
    @Test
    void testCreateEtudeMarche() {
        // Test de création d'une étude de marché
        etudeMarche.setId(1);
        etudeMarche.setTitre("Étude de marché - Casablanca");
        etudeMarche.setDescription("Analyse du marché immobilier à Casablanca");
        etudeMarche.setPrix(5000.0);
        
        assertEquals(1, etudeMarche.getId());
        assertEquals("Étude de marché - Casablanca", etudeMarche.getTitre());
        assertEquals("Analyse du marché immobilier à Casablanca", etudeMarche.getDescription());
        assertEquals(5000.0, etudeMarche.getPrix());
    }
    
    @Test
    void testValidateEtudeMarche() {
        // Test de validation d'une étude de marché
        etudeMarche.setTitre("Test Titre");
        etudeMarche.setDescription("Test Description");
        etudeMarche.setPrix(1000.0);
        
        boolean isValid = etudeMarche.validate();
        
        assertTrue(isValid, "L'étude de marché devrait être valide");
    }
    
    @Test
    void testInvalidEtudeMarche() {
        // Test avec des données invalides
        etudeMarche.setTitre(""); // Titre vide
        etudeMarche.setDescription("Test Description");
        etudeMarche.setPrix(-100.0); // Prix négatif
        
        boolean isValid = etudeMarche.validate();
        
        assertFalse(isValid, "L'étude de marché ne devrait pas être valide");
    }
}


package com.urbaninvest;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests unitaires pour la classe Login
 */
public class LoginTest {
    
    private Login login;
    
    @BeforeEach
    void setUp() {
        login = new Login();
    }
    
    @Test
    void testValidCredentials() {
        // Test avec des identifiants valides
        String username = "test@example.com";
        String password = "password123";
        
        // Simuler une connexion réussie
        boolean result = login.authenticate(username, password);
        
        // Pour l'instant, on retourne true (à implémenter selon la logique réelle)
        assertTrue(result, "L'authentification devrait réussir avec des identifiants valides");
    }
    
    @Test
    void testInvalidCredentials() {
        // Test avec des identifiants invalides
        String username = "invalid@example.com";
        String password = "wrongpassword";
        
        boolean result = login.authenticate(username, password);
        
        assertFalse(result, "L'authentification devrait échouer avec des identifiants invalides");
    }
    
    @Test
    void testEmptyCredentials() {
        // Test avec des identifiants vides
        String username = "";
        String password = "";
        
        boolean result = login.authenticate(username, password);
        
        assertFalse(result, "L'authentification devrait échouer avec des identifiants vides");
    }
    
    @Test
    void testNullCredentials() {
        // Test avec des identifiants null
        boolean result = login.authenticate(null, null);
        
        assertFalse(result, "L'authentification devrait échouer avec des identifiants null");
    }
}

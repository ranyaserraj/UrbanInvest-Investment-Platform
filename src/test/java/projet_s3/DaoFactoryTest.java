package projet_s3;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests unitaires pour la classe DaoFactory
 */
public class DaoFactoryTest {

    @Test
    public void testGetInstance() {
        // Test que getInstance() retourne une instance non-null
        DaoFactory daoFactory = DaoFactory.getInstance();
        assertNotNull(daoFactory, "DaoFactory.getInstance() ne doit pas retourner null");
    }

    @Test
    public void testGetInstanceMultiple() {
        // Test que getInstance() retourne des instances valides
        DaoFactory instance1 = DaoFactory.getInstance();
        DaoFactory instance2 = DaoFactory.getInstance();
        assertNotNull(instance1, "Première instance ne doit pas être null");
        assertNotNull(instance2, "Deuxième instance ne doit pas être null");
        // Note: DaoFactory n'est pas un singleton dans l'implémentation actuelle
    }

    @Test
    public void testGetEtudeFinancierDao() {
        // Test que getEtudeFinancierDao() retourne une instance non-null
        DaoFactory daoFactory = DaoFactory.getInstance();
        EtudeFinancierDAO etudeFinancierDAO = daoFactory.getEtudeFinancierDao();
        assertNotNull(etudeFinancierDAO, "getEtudeFinancierDao() ne doit pas retourner null");
    }

    @Test
    public void testGetEtudeMarcheDao() {
        // Test que getEtudeMarcheDao() retourne une instance non-null
        DaoFactory daoFactory = DaoFactory.getInstance();
        EtudeMarcheDAO etudeMarcheDAO = daoFactory.getEtudeMarcheDao();
        assertNotNull(etudeMarcheDAO, "getEtudeMarcheDao() ne doit pas retourner null");
    }

    @Test
    public void testGetEtudeFinancierDaoMultiple() {
        // Test que getEtudeFinancierDao() retourne des instances différentes
        DaoFactory daoFactory = DaoFactory.getInstance();
        EtudeFinancierDAO dao1 = daoFactory.getEtudeFinancierDao();
        EtudeFinancierDAO dao2 = daoFactory.getEtudeFinancierDao();
        assertNotSame(dao1, dao2, "getEtudeFinancierDao() doit retourner des instances différentes");
    }

    @Test
    public void testGetEtudeMarcheDaoMultiple() {
        // Test que getEtudeMarcheDao() retourne des instances différentes
        DaoFactory daoFactory = DaoFactory.getInstance();
        EtudeMarcheDAO dao1 = daoFactory.getEtudeMarcheDao();
        EtudeMarcheDAO dao2 = daoFactory.getEtudeMarcheDao();
        assertNotSame(dao1, dao2, "getEtudeMarcheDao() doit retourner des instances différentes");
    }
}

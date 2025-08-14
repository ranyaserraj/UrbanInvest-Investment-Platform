package projet_s3;
import java.util.List;

public interface EtudeFinancierDAO {
	    void ajouter( EtudeFinancier etudeFinancier );
	    List<EtudeFinancier> lister();
	}


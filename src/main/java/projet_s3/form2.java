package projet_s3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class form1
 */
@WebServlet("/form22")
public class form2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EtudeMarcheDAO etudeMarcheDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.etudeMarcheDao = daoFactory.getEtudeMarcheDao();
    }
        // TODO Auto-generated constructor stub


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("etudem", etudeMarcheDao.lister());
        this.getServletContext().getRequestDispatcher("/WEB-INF/etudeMarche.jsp").forward(request, response);
     // Récupérer l'id_user depuis la session
        
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		Integer idUser = (Integer) session.getAttribute("id_user");
		
		EtudeMarche etudem = new EtudeMarche();
		etudem.setIdUser(idUser);
        etudem.setNomProjet(request.getParameter("nomProjet"));
        etudem.setTypeInvestissement(request.getParameter("typeInvestissement"));
        etudem.setVilleRegion(request.getParameter("villeRegion"));
        etudem.setAdresseExacte(request.getParameter("adresseExacte"));
        etudem.setSuperficieEstimee(request.getParameter("superficieEstimee"));
        etudem.setobjectifEtude(request.getParameter("objectifEtude"));
        etudem.settypeClientele(request.getParameter("typeClientele"));
        etudem.setconcurrents(request.getParameter("concurrents"));
        
        
        
        etudeMarcheDao.ajouter(etudem);
        
        request.setAttribute("utilisateurs", etudeMarcheDao.lister());
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/etudeMarche.jsp").forward(request, response);
    }

}

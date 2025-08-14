package projet_s3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class form1
 */
@WebServlet("/form11")
public class form1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EtudeFinancierDAO etudeFinancierDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.etudeFinancierDao = daoFactory.getEtudeFinancierDao();
    }
        // TODO Auto-generated constructor stub


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("etudef", etudeFinancierDao.lister());
        this.getServletContext().getRequestDispatcher("/WEB-INF/etudeFinancier.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		EtudeFinancier etudef = new EtudeFinancier();
        etudef.setNomComplet(request.getParameter("nomComplet"));
        etudef.setTelephone(request.getParameter("telephone"));
        etudef.setNomDuProjet(request.getParameter("nomDuProjet"));
        etudef.setTypeInvestissement(request.getParameter("typeInvestissement"));
        etudef.setVilleRegion(request.getParameter("villeRegion"));
        etudef.setAdresseExacte(request.getParameter("adresseExacte"));
        etudef.setSourceFinancement(request.getParameter("sourceFinancement"));
        etudef.setSuperficieEstimee(request.getParameter("superficieEstimee"));
        etudef.setBudgetEstimee(request.getParameter("budgetEstimee"));

        
        etudeFinancierDao.ajouter(etudef);
        
        request.setAttribute("utilisateurs", etudeFinancierDao.lister());
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/etudeFinancier.jsp").forward(request, response);
    }

}

package projet_s3;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login") // URL pour accéder au servlet
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Gérer les requêtes GET, par exemple rediriger vers une page de connexion
        response.sendRedirect("login.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer les paramètres du formulaire de connexion
        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession(); // Obtenir ou créer une session
        RequestDispatcher dispatcher = null; // Préparer le dispatcher

        try {
            // Charger le driver JDBC pour MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Établir une connexion à la base de données
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet3?useSSL=false", "root", "");

            // Préparer la requête SQL pour vérifier les identifiants
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE uemail = ? AND upwd = ?");
            pst.setString(1, uemail);
            pst.setString(2, upwd);

            // Exécuter la requête et récupérer les résultats
            ResultSet rs = pst.executeQuery();

            // Vérifier si l'utilisateur existe
            if (rs.next()) { // Correction : `rs.nest()` -> `rs.next()`
            	int userId = rs.getInt("id");
            	session.setAttribute("id_user",userId);
                // Récupérer le nom de l'utilisateur (colonne "uname" dans la base)
                session.setAttribute("name", rs.getString("uname")); // Vérifiez que la colonne "uname" existe dans votre table
                response.sendRedirect("form2");
            } else {
                // Si les identifiants sont incorrects
                request.setAttribute("status", "failed"); // Ajouter un attribut de statut
                dispatcher = request.getRequestDispatcher("login.jsp"); // Retour à la page de connexion
            }

            // Transférer la requête et la réponse
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Gérer les exceptions
            e.printStackTrace(); // Correction : `e.printStachTrace()` -> `e.printStackTrace()`
        }
    }
}

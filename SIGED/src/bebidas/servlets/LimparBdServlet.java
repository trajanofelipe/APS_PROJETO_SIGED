
package bebidas.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bebidas.model.VinhoManager;

@WebServlet("/LimparBdVinho.do")
public class LimparBdServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VinhoManager.limparBDVinho();
		RequestDispatcher view = request.getRequestDispatcher("gerenciarVinhos.jsp");
		view.forward(request, response);
	}

}

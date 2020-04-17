


package empregados.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import empregados.model.EmpregadoManager;


@WebServlet("/CadastraNovoEmpregado.do")
public class CadastrarEmpregadoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int matEmpregado = Integer.parseInt(request.getParameter("matEmpregado").trim()); // campo obrigat�rio
		String nomeEmpregado = request.getParameter("nomeEmpregado").trim(); // campo obrigat�rio		
		String cargoEmpregado = request.getParameter("cargoEmpregado").trim(); // campo obrigat�rio
		int senhaEmpregado = Integer.parseInt(request.getParameter("senhaEmpregado").trim()); // campo obrigat�rio		
		
		
		// Encaminhar para a classe especialista
		String result = EmpregadoManager.cadastrarEmpregado( matEmpregado, nomeEmpregado, cargoEmpregado, senhaEmpregado);		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarEmpregados.jsp");
		
		if( result.contains("N�o foi poss�vel cadastrar")) {
			request.setAttribute("nomeEmpregado", nomeEmpregado);	
			request.setAttribute("matEmpregado", matEmpregado);	
			request.setAttribute("cargoEmpregado", cargoEmpregado);	
			request.setAttribute("senhaEmpregado", senhaEmpregado);	
			view = request.getRequestDispatcher("cadastrarEmpregado.jsp");
		}		
		
		view.forward(request, response);
	}
}

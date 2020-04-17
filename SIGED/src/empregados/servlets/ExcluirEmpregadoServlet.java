
package empregados.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import empregados.model.EmpregadoManager;

@WebServlet("/ExcluirEmpregado.do")
public class ExcluirEmpregadoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Empregado a ser excluido
		int matEmpregado = Integer.parseInt(request.getParameter("matEmpregado"));
		String nomeEmpregado = request.getParameter("nomeEmpregado");
		
		// Encaminhar para a classe especialista
		String result = "";
		result = EmpregadoManager.apagarEmpregado(matEmpregado);
		result += nomeEmpregado;
		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarEmpregados.jsp");
		view.forward(request, response);
	}

}
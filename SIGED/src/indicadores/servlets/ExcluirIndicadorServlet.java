
package indicadores.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import indicadores.model.IndicadorManager;

@WebServlet("/ExcluirIndicador.do")
public class ExcluirIndicadorServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Indicador a excluir
		int idIndicador = Integer.parseInt(request.getParameter("idIndicador"));
//		String nomeIndicador = request.getParameter("nomeIndicador");
		
		// Encaminhar para a classe especialista
		String result = null;
		result = IndicadorManager.apagarIndicador(idIndicador);
//		result += nomeIndicador;
		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarIndicadores.jsp");
		view.forward(request, response);
	}

}
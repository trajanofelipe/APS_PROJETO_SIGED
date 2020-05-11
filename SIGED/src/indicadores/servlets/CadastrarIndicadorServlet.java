
package indicadores.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import indicadores.model.*;
import utils.Utils;


@WebServlet("/CadastraNovoIndicador.do")
public class CadastrarIndicadorServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomeIndicador = request.getParameter("nomeIndicador").trim(); // campo obrigatório		
		String dataIndicador = request.getParameter("dataIndicador").trim(); // campo obrigatório		
		String depIndicador = request.getParameter("depIndicador").trim(); // campo obrigatório		
		double metaIndicador = Integer.parseInt(request.getParameter("metaIndicador").trim()); // campo obrigatório
//				Double.parseDouble(request.getParameter("valorIndicador").trim()); 
//				Integer.parseInt(request.getParameter("metaIndicador").trim()); // campo obrigatório
		double valorIndicador = 0;
//				Integer.parseInt(request.getParameter("valorIndicador").trim()); // campo obrigatório
//				Double.parseDouble(request.getParameter("metaIndicador").trim()); 
//				Integer.parseInt(request.getParameter("valorIndicador").trim()); // campo obrigatório		
				

		// Encaminhar para a classe especialista
		String result = IndicadorManager.cadastrarIndicador( nomeIndicador, dataIndicador, depIndicador, metaIndicador, valorIndicador );		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarIndicadores.jsp");
		
		if( result.contains("Não foi possível cadastrar")) {
			request.setAttribute("dataIndicador", dataIndicador);
			request.setAttribute("depIndicador", depIndicador);
			request.setAttribute("nomeIndicador", nomeIndicador);	
			request.setAttribute("valorIndicador", valorIndicador);
			request.setAttribute("metaIndicador", metaIndicador);
			view = request.getRequestDispatcher("cadastrarIndicador.jsp");
		}		
		
		view.forward(request, response);
	}
}

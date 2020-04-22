
package indicadores.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import indicadores.model.IndicadorManager;
import utils.Utils;


@WebServlet("/EditaIndicador.do")
public class EditarIndicadorServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idIndicador =  Integer.parseInt(request.getParameter("idIndicador").trim()); // campo obrigatório
		
		String dataIndicador = request.getParameter("dataIndicador").trim(); // campo obrigatório
		String nomeIndicador = request.getParameter("nomeIndicador").trim(); // campo obrigatório		
				
		String depIndicador = request.getParameter("depIndicador").trim(); // campo obrigatório		
		double metaIndicador = Double.parseDouble(request.getParameter("metaIndicador").trim()); // campo obrigatório
		double valorIndicador = Double.parseDouble(request.getParameter("valorIndicador").trim()); // campo obrigatório		
				

		// Encaminhar para a classe especialista
		String result = IndicadorManager.editarIndicador( idIndicador, dataIndicador,  nomeIndicador, depIndicador, metaIndicador, valorIndicador );		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarIndicadores.jsp");
		
		if( result.contains("Não foi possível cadastrar")) {
			request.setAttribute("idIndicador", idIndicador);
			request.setAttribute("dataIndicador", dataIndicador);
			request.setAttribute("nomeIndicador", nomeIndicador);
			request.setAttribute("depIndicador", depIndicador);
			request.setAttribute("metaIndicador", metaIndicador);	
			request.setAttribute("valorIndicador", valorIndicador);
			
			view = request.getRequestDispatcher("editarIndicador.jsp");
		}		
		
		view.forward(request, response);
	}
}
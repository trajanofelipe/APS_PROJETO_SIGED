
package indicadores.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import indicadores.model.Indicador;
import indicadores.model.IndicadorManager;


@WebServlet("/PainelIndicador.do")
public class PainelIndicadorServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int idIndicador =  Integer.parseInt(request.getParameter("idIndicador").trim()); // campo obrigatório
		
		String dataIndicador = request.getParameter("dataIndicador").trim(); // campo obrigatório
//		String nomeIndicador = request.getParameter("nomeIndicador").trim(); // campo obrigatório		
				
		String depIndicador = request.getParameter("depIndicador").trim(); // campo obrigatório		
//		int metaIndicador = Integer.parseInt(request.getParameter("metaIndicador").trim()); // campo obrigatório
//		int valorIndicador = Integer.parseInt(request.getParameter("valorIndicador").trim()); // campo obrigatório		
//				

		// Encaminhar para a classe especialista
		List<Indicador> result = IndicadorManager.consultarIndicadorPorDataDep(dataIndicador, depIndicador);		
//		request.setAttribute("mensagem", result);
//		RequestDispatcher view = request.getRequestDispatcher("verPainel.jsp");
		
//		if( result.contains("Não foi possível lançar")) {
		
//			request.setAttribute("idIndicador", idIndicador);
						
			request.setAttribute("dataIndicador", dataIndicador);
		
			request.setAttribute("depIndicador", depIndicador);
			
			
			RequestDispatcher view = request.getRequestDispatcher("verPainelGrafico.jsp");
//		}		
		
		view.forward(request, response);
	}
}
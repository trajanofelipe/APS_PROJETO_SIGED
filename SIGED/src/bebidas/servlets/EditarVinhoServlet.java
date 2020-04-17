
package bebidas.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bebidas.model.VinhoManager;
import utils.Utils;


@WebServlet("/EditaVinho.do")
public class EditarVinhoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idVinho = Integer.parseInt(request.getParameter("idVinho"));
		
		String nomeVinho = request.getParameter("nomeVinho").trim(); // campo obrigat�rio		
		String corVinho = request.getParameter("corVinho").trim(); // campo obrigat�rio		
		int anoVinho = Integer.parseInt(request.getParameter("anoVinho").trim()); // campo obrigat�rio	
		double precoVinho = Utils.strMoedaParaDouble(request.getParameter("precoVinho").trim()); // campo obrigat�rio		
		int qtdEstoque = Integer.parseInt(request.getParameter("qtdEstoque").trim()); // campo obrigat�rio		


		// Encaminhar para a classe especialista
		String result = VinhoManager.editarVinho(idVinho, nomeVinho, anoVinho, corVinho, precoVinho, qtdEstoque );	
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarVinhos.jsp");
		
		if( result.contains("N�o foi poss�vel editar")) {
			request.setAttribute("idVinho", idVinho);
			request.setAttribute("nomeVinho", nomeVinho);
			request.setAttribute("anoVinho", anoVinho);	
			request.setAttribute("corVinho", corVinho);	
			request.setAttribute("precoVinho", precoVinho);	
			request.setAttribute("qtdEstoque", qtdEstoque);	
			view = request.getRequestDispatcher("editarVinho.jsp");
		}		
		
		view.forward(request, response);
	}
}
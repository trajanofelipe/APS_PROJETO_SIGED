
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>	
	<%@include file="_import.jsp"%>	
	<!--  CONTAINER PRINCIPAL -->
	
	
	<div class="container">	 
		<div class="alert alert-warning">		
			<% 
				String operacao = request.getParameter("operacao"); 
				if( operacao.equals("excluirIndicador")) { %>
					<strong>Esta operação é irreversível e apagará o produto da base de dados. Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="ExcluirIndicador.do?idIndicador=<%=request.getParameter("idIndicador")%>" class="btn btn-primary">Sim</a>
					<a href="gerenciarIndicadores.jsp" class="btn btn-primary">Não</a>			
			<%	} else if( operacao.equals("popularBDIndicador")) { %>
					<strong>Esta operação é irreversível e irá popular o BD. Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="PopularBdIndicador.do" class="btn btn-primary">Sim</a>
					<a href="gerenciarIndicadores.jsp" class="btn btn-primary">Não</a>			
			<%	} else if( operacao.equals("limparBDIndicador")) { %>
					<strong>Esta operação é irreversível e irá limpar o BD. Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="LimparBdIndicador.do" class="btn btn-primary">Sim</a>
					<a href="gerenciarIndicadores.jsp" class="btn btn-primary">Não</a>			
					
			<%	} else if( operacao.equals("verpainel")) { %>
					<strong>Deseja proseguir para visualizar os indicadores de <%=request.getParameter("dataIndicador")%> - departamento <%=request.getParameter("depIndicador")%> ?</strong>			
					<br></br>
					<a href="PainelIndicador.do?depIndicador=<%=request.getParameter("depIndicador")%>
					&dataIndicador=<%=request.getParameter("dataIndicador")%>" class="btn btn-primary">Sim</a>
					<a href="index.jsp" class="btn btn-primary">Não</a>		
					
					
					
					
			<%	} %>
			
			
		</div>
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
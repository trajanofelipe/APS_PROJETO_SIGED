<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>	
	
	<!--  CONTAINER PRINCIPAL -->
	<div class="container">	 
		<div class="alert alert-warning">		
			<% 
				String operacao = request.getParameter("operacao"); 
				if( operacao.equals("excluirEmpregado")) { %>
					<strong>Esta opera��o � irrevers�vel e apagar� o empregado da base de dados.
					Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="ExcluirEmpregado.do?matEmpregado=<%=request.getParameter("matEmpregado")%>
					&nomeEmpregado=<%=request.getParameter("nomeEmpregado")%>" class="btn btn-primary">Sim</a>
					<a href="gerenciarEmpregados.jsp" class="btn btn-primary">N�o</a>			
			<%	} else if( operacao.equals("popularBDEmpregado")) { %>
					<strong>Esta opera��o � irrevers�vel e ir� popular o BD.
					Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="PopularBdEmpregado.do" class="btn btn-primary">Sim</a>
					<a href="gerenciarEmpregados.jsp" class="btn btn-primary">N�o</a>			
			<%	} else if( operacao.equals("limparBDEmpregado")) { %>
					<strong>Esta opera��o � irrevers�vel e ir� limpar o BD.
					Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="LimparBdEmpregado.do" class="btn btn-primary">Sim</a>
					<a href="gerenciarEmpregados.jsp" class="btn btn-primary">N�o</a>			
			<%	} %>
			
			
		</div>
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
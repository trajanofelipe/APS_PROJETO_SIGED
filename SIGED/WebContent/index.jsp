
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>

	
	
<%
	
	String usuario = (String) session.getAttribute("usuario");
	String senha = (String)	session.getAttribute("senha");

if(usuario == null || senha == null){
		
		response.sendRedirect("login.jsp");
// 		response.sendRedirect("loginDAO.java");
	} 
	else
		out.println("Bem-vindo, " + usuario + "<br/><br/>");
		
			
%>

		<a href="logoff.jsp">Encerrar sess�o</a>

	<%@include file="_cabecalho.jsp"%>
	<div class="container">

		<div class="panel panel-success">
		    <div class="panel-heading"><strong>GERENCIADOR DE TAREFAS</strong></div>
<!-- 		    AQUI, DEVE-SE AJUSTAR PARA QUE O NOME ACIMA SEJA DO CARGO DE QUEM FAZ O LOGIN -->
		    
		     		       	
	    	<div class="panel-body">
	    		<a href="gerenciarEmpregados.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite o cadastro, consulta, edi��o e remo��o de empregadps.">Gerenciar Empregados</a>
	    	</div>
	    	
	    	<div class="panel-body">
	    		<a href="lancarIndicador.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite o cadastro, consulta, edi��o e remo��o de empregadps.">Lan�ar Indicador</a>
	    	</div>
	    		
	    		
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite o cadastro, consulta, edi��o e remo��o de empregadps.">Painel</a>
	    	</div>
	    	
	    	
	    	
	    </div>
	    
	    <div class="panel panel-info">
		    <div class="panel-heading"><strong>ANTERIOR PRECISA TIRAR</strong></div>
<!-- 	    	<div class="panel-body"> -->
<!-- 	    		<a href="#" data-toggle="popover" data-trigger="hover" -->
<!-- 	    		data-content="Permite o cadastro de novo pedido, consulta, edi��o e remo��o de pedidos.">Gerenciar Pedidos</a> -->
<!-- 	    	</div> -->
<!-- 	    	<div class="panel-body"> -->
<!-- 	    		<a href="#" data-toggle="popover" data-trigger="hover" data-content="Exibe relat�rios das vendas.">Relat�rios</a> -->
	    		
	    		 <div class="panel-body"> 
	    		<a href="gerenciarVinhos.jsp" data-toggle="popover" data-trigger="hover" data-content=
				"Permite o cadastro de novo vinho, consulta, edi��o e remo��o de vinhos.">Gerenciar Vinhos</a> 
 	    	</div> 
	    	</div>
	    </div>
	    
	    
	    
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
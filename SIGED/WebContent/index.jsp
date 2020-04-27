<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>

	
	
<%
	
	String usuario = (String) session.getAttribute("usuario");
	String senha = (String)	session.getAttribute("senha");
	String cargo = (String) session.getAttribute("cargo");

if(usuario == null || senha == null || cargo == null){
		
		response.sendRedirect("login.jsp");
// 		response.sendRedirect("loginDAO.java");
	} 
	else {
		out.println("Bem-vindo, " + usuario + "<br/>");
		
// 		System.out.println(usuario + "" + senha + "" + cargo);
		
	}
			
%>

		<a href="logoff.jsp">Encerrar sessão</a>

	<%@include file="_cabecalho.jsp"%>
	<div class="container">

		<div class="panel panel-success">
		    <div class="panel-heading"><strong>GERENCIADOR DE TAREFAS</strong></div>
<!-- 		    AQUI, DEVE-SE AJUSTAR PARA QUE O NOME ACIMA SEJA DO CARGO DE QUEM FAZ O LOGIN -->
		    
		     <%
		  
		     if(cargo.equals("Analista do Sistema")){
		    	 
		    
		     %>
		     
		     		       	
	    	<div class="panel-body">
	    		<a href="gerenciarEmpregados.jsp" data-toggle="popover" data-trigger="hover" 
	    		data-content="Permite o cadastro, consulta, edição e remoção de empregados.">Gerenciar Usuários</a>
	    	</div>
	    	
	    	<div class="panel-body">
	    		<a href="gerenciarIndicadores.jsp" data-toggle="popover" data-trigger="hover" 
	    		data-content="Permite o cadastro, consulta, edição e remoção de Indicadores de Desempenho.">Gerenciar Indicadores</a>
	    	</div>
	    		
	    		
	    			<div class="panel-body">
	    		<a href="lancarIndicador.jsp" data-toggle="popover" data-trigger="hover" 
	    		data-content="Permite o lançamento de indicadores de Desempenho.">Lançar Indicador</a>
	    	</div>
	    		
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite visualizar os resultados alcançados.">Painel</a>
	    	</div>
	    	
	    	
	    	
	    	<%
} if(cargo.equals("Gestor")){
	
	
	


	    	%>
	    	
	    	
	    	
	    		
	    		
	    			<div class="panel-body">
	    		<a href="lancarIndicador.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite o lançamento de indicadores de Desempenho.">Lançar Indicador</a>
	    	</div>
	    		
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite visualizar os resultados alcançados.">Painel</a>
	    	</div>
	    	
	    	
	    	
	    	<%
} if(cargo.equals("Analista de Desenvolvimento")){
	
	
   	
	    	%>
	    	
	    	
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite visualizar os resultados alcançados.">Painel</a>
	    	</div>
	    	
	    	<%
	    	
}
	    	%>
	    	
	    	
	    	
	    	
	    	
<!-- 	    </div> -->
<!-- 	    <div class="panel panel-info"> -->
<!-- 		    <div class="panel-heading"><strong>ANTERIOR PRECISA TIRAR</strong></div> -->
<!--  	    	<div class="panel-body">  -->
<!--  	    		<a href="#" data-toggle="popover" data-trigger="hover" -->
<!--  	    		data-content="Permite o cadastro de novo pedido, consulta, edição e remoção de pedidos.">Gerenciar Pedidos</a> -->
<!--  	    	</div>  -->
<!-- 	    	<div class="panel-body">  -->
<!-- 	    		<a href="#" data-toggle="popover" data-trigger="hover" data-content="Exibe relatórios das vendas.">Relatórios</a>  -->
	    		
<!-- 	    		 <div class="panel-body">  -->
<!-- 	    		<a href="gerenciarVinhos.jsp" data-toggle="popover" data-trigger="hover" data-content= -->
<!-- 				"Permite o cadastro de novo vinho, consulta, edição e remoção de vinhos.">Gerenciar Vinhos</a>  -->
<!--  	    	</div>  -->
<!-- 	    	</div> -->
<!-- 	    </div>     -->
<!-- 	</div> -->
	
	
	<!-- fim .container da pagina -->
</body>
</html>
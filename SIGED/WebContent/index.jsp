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

		<a href="logoff.jsp">Encerrar sess�o</a>

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
	    		data-content="Permite o cadastro, consulta, edi��o e remo��o de empregados.">Gerenciar Usu�rios</a>
	    	</div>
	    	
	    	<div class="panel-body">
	    		<a href="gerenciarIndicadores.jsp" data-toggle="popover" data-trigger="hover" 
	    		data-content="Permite o cadastro, consulta, edi��o e remo��o de Indicadores de Desempenho.">Gerenciar Indicadores</a>
	    	</div>
	    		
	    		
<!-- 	    			<div class="panel-body"> -->
<!-- 	    		<a href="lancarIndicador.jsp" data-toggle="popover" data-trigger="hover"  -->
<!-- 	    		data-content="Permite o lan�amento de indicadores de Desempenho.">Lan�ar Indicador</a> -->
<!-- 	    	</div> -->
	    		
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite visualizar os resultados alcan�ados.">Painel</a>
	    	</div>
	    	
	    	
	    	
	    	<%
} if(cargo.equals("Gestor")){
	

	    	%>
	    	
	    	<div class="panel-body">
	    		<a href="lancarIndicador.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite o lan�amento de indicadores de Desempenho.">Lan�ar Indicador</a>
	    	</div>
	    		
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite visualizar os resultados alcan�ados.">Painel</a>
	    	</div>
	    	
	    	
	    	
	    	<%
} if(cargo.equals("Analista de Desenvolvimento")){
	
	
   	
	    	%>
	    	
	    	
	    	<div class="panel-body">
	    		<a href="verPainel.jsp" data-toggle="popover" data-trigger="hover"
	    		data-content="Permite visualizar os resultados alcan�ados.">Painel</a>
	    	</div>
	    	
	    	<%
	    	
}
	    	%>
	    	
	    
	
	<!-- fim .container da pagina -->
</body>
</html>
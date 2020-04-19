<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	

	<%			
		// Lista de indicadores
		List<Indicador> indicadores = IndicadorManager.consultarTodosIndicador();
		
		if( indicadores.isEmpty() ) {
	%>	
		<div class="container"> 
			<div class="alert alert-danger">		
				<strong>Não há indicadores cadastrados.</strong>
<!-- 				<br></br><a href="editarIndicador.jsp" class="btn btn-success">Lançar Novo</a> -->
				
			</div>
		</div>		
	<%
		} else {
	%>
		
		<!-- 	  CONTAINER DE MENSAGENS 
 	<%@include file="_containerMensagens.jsp"%> 
	
<!--   CONTAINER PRINCIPAL  -->
 	<div class="container">		 
<!-- 		<br><br/><a href="lancarIndicador.jsp" class="btn btn-success">Lançar Indicador</a> -->

		
		<div class="row">
	        <div class="panel panel-primary filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">Indicadores</h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtro</button>
	                </div>
	            </div>
	            <table class="table">
	                <thead>
	                    <tr class="filters">
	                        <th width="5%"></th>
	                        <th width="5%"><input type="text" class="form-control" placeholder="Id" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Data-Base" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Nome" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Departamento" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Meta" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Alcançado" disabled></th>
	                    </tr>
	                </thead>
	                <% for( Indicador indicador : indicadores) { %>
				      <tr>
				      	<td>
				      	
				      		<a href="lancarGestorIndicador.jsp?idIndicador=<%=indicador.getIdIndicador()%>" data-toggle="popover" data-trigger="hover" data-content="Lançar">
				      		
				      			
				      		<%
				      		if(indicador.getValorIndicador() == 0 ){
				      			
				      		%>
				      					      		
				      		<img src="images/lancar.png" alt="Lançar" title="Lançar" style="width:16px;height:16px;border:0;"></img></a>
				      		
				      		<%		
				      		} else {
				      			
				      		} %>
				      		
				      	
				      		
				      	</td>				      	
				      	<td><strong><%=indicador.getIdIndicador()%></strong></td>
				      	<td><%=indicador.getDataIndicador()%></td>
				      	<td><%=indicador.getNomeIndicador()%></td>				      	
				      	<td><%=indicador.getDepIndicador()%></td>
				      	<td><%=indicador.getMetaIndicador()%></td>
				      	<td><%=indicador.getValorIndicador()%></td>
				      	
				      </tr>
				    <% } %>
	            </table>
	        </div>
    	</div>  

		
	</div>
	<!-- fim .container da pagina -->
	<%
		}
	%>
</body>
</html>
	
	
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
	                <h3 class="panel-title">Indicadores - Painel </h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtro</button>
	                </div>
	            </div>
	            <table class="table">
	                <thead>
	                    <tr class="filters">
	                        <th width="5%"></th>
	                        
	                    
	                        
	                        <th><input type="text" class="form-control" placeholder="Data-Base" disabled></th>
	                       
	                        <th><input type="text" class="form-control" placeholder="Departamento" disabled></th>
	                       
	                    </tr>
	                </thead>
	              
	                
	            	  <%
	            	  List<String> novalista = new ArrayList<String>();
	            	  for( Indicador indicador : indicadores) {
	            	
				      	
			
				String indicador1 = indicador.getDataIndicador() + indicador.getDepIndicador();
				
				 
			    if(novalista.isEmpty()){
					
			    	%>
			    	
			    	<tr>
				      	<td>
				      	
				      	<%
				      	
				      	if(indicador.getValorIndicador() == 0){
				      		
				      		
				      	}else
				      	{
				      		
				      		%>
				      		
				      		
				      		
				      		<a href="confirmacaoIndicador.jsp?dataIndicador=<%=indicador.getDataIndicador()%>&depIndicador=<%=indicador.getDepIndicador()%>&operacao=verpainel"
 				      	   data-toggle="popover" data-trigger="hover" data-content="Painel">
 				      	   <img src="images/vetor.jpg" style="width:16px;height:16px;border:0;">
							      	</img></a>	
				      	
				      	
				      	<% } %>
				      	
				      	
<%-- 						<a href="confirmacao.jsp?idVinho=<%=vinho.getIdVinho()%>&nomeVinho=<%=vinho.getNomeVinho()%> --%>
<%-- 						&operacao=excluirVinho" data-toggle="popover" data-trigger="hover" data-content="Excluir"> --%>
<!-- 						<img src="images/delete-icon.png" alt="Excluir" title="Excluir" style="width:16px;height:16px;border:0;"> -->
<!-- 						</img></a> -->
				      		
 		
				      	</td>	
				     
			    	
			    	<td><%=indicador.getDataIndicador()%></td>
      		      	
			      	<td><%=indicador.getDepIndicador()%></td>
			    	
			    	
			    	
			    	  	  </tr> 
			    	<%
					novalista.add(indicador1);		
				} else{
					
					if(novalista.contains(indicador1)){
					
						break;
						
					}
					else{
						%>
						
						<tr>
				      	<td>
				      	
				      	<a href="confirmacaoIndicador.jsp?dataIndicador=<%=indicador.getDataIndicador()%>&depIndicador=<%=indicador.getDepIndicador()%>&operacao=verpainel"
 				      	   data-toggle="popover" data-trigger="hover" data-content="Painel">
 				      	   <img src="images/vetor.jpg" style="width:16px;height:16px;border:0;">
							      	</img></a>	
				      		
 		
				      	</td>	
				     
				      	
				      	   
						
				    	<td><%=indicador.getDataIndicador()%></td>
	      		      	
				      	<td><%=indicador.getDepIndicador()%></td>
				    	
				    	 	
				    	  	  </tr> 
				    	<%
						novalista.add(indicador1);
				
					}
		
				}
				      	
				      %>	
				      	
				    
				      	
				      	
				    
				    <% 
				    
				   
			} %>
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
	
	
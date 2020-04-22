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
	           //     for( Indicador indicador : indicadores) { 
	          
	        	 
	        	   
	      List<String> novalista = new ArrayList<String>();
	        	   
	      
			for( Indicador indicador : indicadores) {
			
				
				String indicador1 = indicador.getDataIndicador() + indicador.getDepIndicador();
			
				
			
				if(novalista.isEmpty()){
					
					novalista.add(indicador1);		
				} else{
					
					if(novalista.contains(indicador1)){
					
						break;
						
					}else{
						
						novalista.add(indicador1);
				
					}
						
					
					
// 					for(String a : novalista){
						
// 						if(a.equals(indicador1)){
							
// 							break;
// 						}else{
// 							novalista.add(indicador1);
// 						}
						
// 					}
				}
						
		
				
				
		
			
			}		System.out.println(novalista);
// 			System.out.println(novalista);
			
			
			
// 			if (novalista.isEmpty()){
				
// 				novalista.add(indicador1);
// 				System.out.println(novalista.size());
				
// 			}
			
// 			for (String item : novalista){
				
// 				if (item.equals(indicador1)){
					
// 					break;
					
// 				} else {
// 					novalista.add(indicador1);
// 					System.out.println("Add " + indicador1);
// 				}
			
// 			}
			
// 			System.out.println(novalista);
			
// 			for (String ind : novalista){
				
// 				if(ind.equals(indicador1)){
			
// 					break;
					
// 				} else {
					
// 					novalista.add(indicador1);
					
// 				}
				
				
// 			}
			
			
			
			
			
			%>
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
	
	
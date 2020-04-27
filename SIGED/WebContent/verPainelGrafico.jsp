<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>




	<%@include file="_header.jsp"%>
</head>
<body>

<script src="js/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>






	<%@include file="_cabecalho.jsp"%>
	<%
	// Indicador a editar
// 			String idIndicadorStr = request.getParameter("idIndicador"); // se tiver vindo da lista de indicador
// 			String	dataI = (String)request.getAttribute("dataIndicador");
// 			String	depI = request.getAttribute("depIndicador");
// 			String nomeI = (String)request.getAttribute("nomeIndicador");
			
// 			System.out.println(dataI);
// 			System.out.println(depI);
// 			System.out.println(nomeI);
			
// 			List<Indicador> indicadorEd = IndicadorManager.consultarTodosIndicador();
			
			String dataIndicador = (String)request.getAttribute("dataIndicador");
			String depIndicador = (String)request.getAttribute("depIndicador");
			
			
			
			List <Indicador> indicadorEd = IndicadorManager.consultarIndicadorPorDataDep(dataIndicador, depIndicador);
			
			
// 			System.out.println(indicadorEd.size() + " todos");
// 			indicadorEd = IndicadorManager.consultarIndicadorPorDataDep(dataI, depI);
					
			

//  			for (Indicador i : indicadorEd){
			
					
// 				System.out.println(i.getNomeIndicador());
// 				System.out.println(i.getDataIndicador());
// 				System.out.println(i.getDepIndicador());
// 				System.out.println(i.getMetaIndicador());
// 				System.out.println(i.getValorIndicador());
// 				System.out.println(i.getValorIndicador() / i.getMetaIndicador());
//  			}
			
// 			System.out.println(indicadorEd.size());
			
// 			String	dataIndicador = (String)request.getAttribute("dataIndicador");
// 			System.out.println(dataI);
// 			String	depIndicador= (String)request.getAttribute("depIndicador");
// 			String nomeIndicador = (String)request.getAttribute("nomeIndicador");
			
			
// 			indicadorEd =	IndicadorManager.consultarTodosIndicador();
			
			
			if( indicadorEd.isEmpty() ) {
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
							
					<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- EDIÇÃO DE PRODUTO -->
	<div class="container">		
		<form action="PainelIndicador.do" method="post">
			<fieldset>
				<legend>Painel Indicador </legend>
				

					<%
						
						
					List<String> novalista = new ArrayList<String>();
					List<String> listaNome = new ArrayList<String>();
					
// 					System.out.println(indicadorEd.size());
			
					for (Indicador i : indicadorEd){
						
						String data = i.getDataIndicador();
				
// 						System.out.println(i.getDataIndicador(););
// 						System.out.println(i.getNomeIndicador());
						
						if(novalista.isEmpty()){
							
							%>
					    	
					    	<tr>
						      	<td>
						      	
						      	<%
						      	
						      	if(i.getValorIndicador() == 0){
						      		
						      		
						      	}else{
						      		
						      		%>
							
								
							
					<%
						      	}
										
						novalista.add(data);				
					}else{
					
						if(novalista.contains(data)){
							
							break;
						}else{
							
													
							
						}
							
						
						
					}
					
					
							
					%>
					
				
					
		        	<div class="form-group">	
		        		
		        				<label for="dataIndicador">Data-Base</label>		
						<input class="form-control" id="dataIndicador" name="dataIndicador" required readonly="readonly"
 							value="<%=i.getDataIndicador()%>"/>
					
					</div>
					
					
		        	<div class="form-group">	
		        		
		        				<label for="depIndicador">Departamento</label>		
						<input class="form-control" id="depIndicador" name="depIndicador" required readonly="readonly"
 							value="<%=i.getDepIndicador()%>"/>
					
					</div>
					
					<div class="form-group">	
		        		
		        				
						<%
						
						for (Indicador j : indicadorEd){
//  						j.getNomeIndicador().equals(i.getNomeIndicador());		
							%>	
							
							<label for="nomeIndicador">Indicador <%=j.getNomeIndicador()%></label>		
<!-- 							<input class="form-control" id="nomeIndicador" name="nomeIndicador" required readonly="readonly" -->
						
							
						
<%-- 							value="<%=j.getNomeIndicador()%>">													 --%>
<!-- 							</input> -->
							
							<br>
							<label for="resIndicador">Resultado</label>	
							<input class="form-control" id="nomeIndicador" name="nomeIndicador" required readonly="readonly"
						
							
						
							value="<%=(100 * (j.getValorIndicador() / j.getMetaIndicador())) + "%"   %>">	
							<br></br>												
							</input>											
							<div style="width: 400px; height: 400px;"> <canvas id="grafico"></canvas>
					<script>
							var ctx  = document.getElementById("grafico")

							// type do grafic, data, option
							
							var chartGraph = new Chart(ctx, {
								
								type: 'bar',
								data: {
									labels: [<%=j.getNomeIndicador() %>],
									dataset: [{
										
										label: "<%=j.getNomeIndicador() %>",
										data: [<%=(100 * (j.getValorIndicador() / j.getMetaIndicador()))%>]
										
									}]
									
								}
								
								
								
							})
								
								
									
								
								
								
								
							
					</script>
							</div>
						
						<%
					
						}
						%>
						
						
						
					<%	
						
						
				}
					}
				
					%>	
	
			
	</div>
	


</body>
</html>
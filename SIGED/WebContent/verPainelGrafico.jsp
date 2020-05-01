<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>




	<%@include file="_header.jsp"%>
	<link rel="stylesheet" type="text/css" href="css/grafico.css">
</head>
<body>

<script src="js/jquery-3.4.1.js"></script>
<script src="js/jquery.easypiechart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


<script>
$(function(){

	$('.chart').easyPieChart({
		
		size: 180,
		barColor: '#17d3e6',
		scaleColor: false,
		lineWidth: 15,
		trackColor: '#373737',
		
	})
})

</script>



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
					
				
				
						<div class= "section-title">
							<h1>Data-Base <%=i.getDataIndicador()%> // Departamento <%=i.getDepIndicador()%></h1>
							
						</div>

		        		
		        				
						<%
						
						for (Indicador j : indicadorEd){
//  						j.getNomeIndicador().equals(i.getNomeIndicador());		
							double res = (100 * (j.getValorIndicador() / j.getMetaIndicador()));
							%>	
							
							
							
					
					<div class="box">
					<div class="chart" data-percent="<%=res%>"><%=res%>%</div> 
						<h2><%=j.getNomeIndicador()%></h2>		
					<br></br>
								
						</div>
						<%
						
						}
						
						%>
								
						
						
					<%	
						
						
				}%>
					
				
					
					
					
					<%}
					%>
				
						
	
	</fieldset>
	</form>
	</div>		

	


</body>
</html>
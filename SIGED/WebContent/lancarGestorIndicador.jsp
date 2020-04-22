<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%
		// Indicador a editar
		String idIndicadorStr = request.getParameter("idIndicador"); // se tiver vindo da lista de indicador
		if( idIndicadorStr == null ) { // se tiver vindo do servlet de edição
			idIndicadorStr = (String)request.getAttribute("idIndicador");
		}
		Indicador indicadorEd = IndicadorManager.consultarIndicadorPorId(Integer.parseInt(idIndicadorStr));
			

		
		// Caso tenha ocorrido erro na edição, recuperar os valores preenchidos
		String dataIndicador= (String)request.getAttribute("dataIndicador");
		String nomeIndicador = (String)request.getAttribute("nomeIndicador");	
		String depIndicador = (String)request.getAttribute("depIndicador");
		Double metaIndicador = (Double)request.getAttribute("metaIndicador");
		Double valorIndicador = (Double)request.getAttribute("valorIndicador");
				
	
		
	%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- EDIÇÃO DE PRODUTO -->
	<div class="container">		
		<form action="LancaIndicador.do" method="post">
			<fieldset>
				<legend>Resultado do Indicador</legend>
				<input type="hidden" name=idIndicador value="<%=indicadorEd.getIdIndicador()%>">

					<div class="form-group">	
		        		<label for="nomeIndicador">Nome</label>					
						<input type="text" class="form-control" id="nomeIndicador" name="nomeIndicador" readonly="readonly"
						maxlength="150" required value="<%if(nomeIndicador!=null){out.println(nomeIndicador);}
						else{out.println(indicadorEd.getNomeIndicador());}%>"/>						
					</div>
					
					<div class="form-group">
		        		<label for="depIndicador">Departamento</label>		
						<input class="form-control" id="depIndicador" name="depIndicador" required readonly="readonly"
							value="<%=indicadorEd.getDepIndicador()%>"/>
							

					</div>
					
		        	<div class="form-group">	
		        		
		        				<label for="dataIndicador">Data-Base</label>		
						<input class="form-control" id="dataIndicador" name="dataIndicador" required readonly="readonly"
							value="<%=indicadorEd.getDataIndicador()%>"/>
					
		        		
<!-- 		        		<label for="dataIndicador">Data-Base</label>					 -->
<%-- 						<input type="text" class="form-control" id="dataIndicador" name="dataIndicador" required value="<%=indicadorEd.getDataIndicador()%>"/>						 --%>
					</div>
					
					
					<%
// 						Integer metaIndic =  metaIndicador;
// 						if( metaIndic == null ) {
// 							metaIndic = indicadorEd.getMetaIndicador();
// 						}					
					%>
					
					<div class="form-group">
						<label for="metaIndicador">Meta</label>		
						<input type="number" class="form-control" id="metaIndicador" name="metaIndicador" readonly="readonly" required 
						value="<%=indicadorEd.getMetaIndicador()%>"/>
					</div>	
					
					<%
// 						Integer valorIndic =  valorIndicador;
// 						if( valorIndic  == null ) {
// 							valorIndic = indicadorEd.getValorIndicador();
// 						}					
					%>
					<div class="form-group">
						<label for="valorIndicador">Alcance</label>		
						<input type="number" class="form-control" min="0" id="valorIndicador" name="valorIndicador"  
						value="<%=indicadorEd.getValorIndicador()%>"
						
						/>
					</div>					
										
			</fieldset>
			<button type="submit" class="btn btn-primary">Enviar Resultado</button>
		</form>		
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
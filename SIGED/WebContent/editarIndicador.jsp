<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%
		// Vinho a editar
		String idIndicadorStr = request.getParameter("idIndicador"); // se tiver vindo da lista de indicador
		if( idIndicadorStr == null ) { // se tiver vindo do servlet de edição
			idIndicadorStr = (String)request.getAttribute("idIndicador");
		}
		Indicador indicadorEd = IndicadorManager.consultarIndicadorPorId(Integer.parseInt(idIndicadorStr));
			
		// Caso tenha ocorrido erro na edição, recuperar os valores preenchidos
		String dataIndicador= (String)request.getAttribute("dataIndicador");
		String nomeIndicador = (String)request.getAttribute("nomeIndicador");	
		String depIndicador = (String)request.getAttribute("depIndicador");
		Integer metaIndicador = (Integer)request.getAttribute("metaIndicador");
		Integer valorIndicador = (Integer)request.getAttribute("valorIndicador");
				
	%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- EDIÇÃO DE PRODUTO -->
	<div class="container">		
		<form action="EditaIndicador.do" method="post">
			<fieldset>
				<legend>Edição de Indicador</legend>
				<input type="hidden" name=idIndicador value="<%=indicadorEd.getIdIndicador()%>">

					<div class="form-group">	
		        		<label for="nomeIndicador">Nome</label>					
						<input type="text" class="form-control" id="nomeIndicador" name="nomeIndicador" 
						maxlength="150" required value="<%if(nomeIndicador!=null){out.println(nomeIndicador);}
						else{out.println(indicadorEd.getNomeIndicador());}%>"/>						
					</div>
					
					<div class="form-group">
		        		<label for="depIndicador">Departamento</label>		
						<select class="form-control" id="depIndicador" name="depIndicador" required>
							<option value="DEOPE" <%if( (depIndicador != null && depIndicador.equals("DEOPE")) || (indicadorEd.getDepIndicador().equals("DEOPE"))){%>selected="selected"<%}%>>DEOPE</option>
							<option value="DEPRH" <%if( (depIndicador != null && depIndicador.equals("DEPRH")) || (indicadorEd.getDepIndicador().equals("DEPRH"))){%>selected="selected"<%}%>>DEPRH</option>
							<option value="DEPTI" <%if( (depIndicador != null && depIndicador.equals("DEPTI")) || (indicadorEd.getDepIndicador().equals("DEPTI"))){%>selected="selected"<%}%>>DEPTI</option>
						</select>
					</div>
					
		        	<div class="form-group">	
		        		
		        				<label for="dataIndicador">Data-Base</label>		
						<select class="form-control" id="dataIndicador" name="dataIndicador" required>
							<option value="Abril/2020" <%if( dataIndicador!= null && dataIndicador.equals("Abril/2020"))
							{%>selected="selected"<%}%>>Abril/2020</option>
							<option value="Maio/2020" <%if( dataIndicador!= null && dataIndicador.equals("Maio/2020"))
							{%>selected="selected"<%}%>>Maio/2020</option>
							<option value="Junho/2020" <%if( dataIndicador!= null && dataIndicador.equals("Junho/2020"))
							{%>selected="selected"<%}%>>Junho/2020</option>
							
								
						</select>
		        		
<!-- 		        		<label for="dataIndicador">Data-Base</label>					 -->
<%-- 						<input type="text" class="form-control" id="dataIndicador" name="dataIndicador" required value="<%=indicadorEd.getDataIndicador()%>"/>						 --%>
					</div>
					
					
					<%
						Integer metaIndic =  metaIndicador;
						if( metaIndic == null ) {
							metaIndic = indicadorEd.getMetaIndicador();
						}					
					%>
					
					<div class="form-group">
						<label for="metaIndicador">Meta</label>		
						<input type="number" class="form-control" id="metaIndicador" name="metaIndicador" required 
						value="<%=indicadorEd.getMetaIndicador()%>"/>
					</div>	
					
					<%
						Integer valorIndic =  valorIndicador;
						if( valorIndic  == null ) {
							valorIndic = indicadorEd.getValorIndicador();
						}					
					%>
					<div class="form-group">
						<label for="valorIndicador">Alcance</label>		
						<input type="number" class="form-control" min="0" id="valorIndicador" name="valorIndicador"  
						value="<%=indicadorEd.getValorIndicador()%>"/>
					</div>					
										
			</fieldset>
			<button type="submit" class="btn btn-primary">Editar Indicador</button>
		</form>		
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
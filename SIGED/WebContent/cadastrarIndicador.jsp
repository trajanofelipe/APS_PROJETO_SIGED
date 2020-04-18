<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%
		// Caso tenha ocorrido erro no cadastro, recuperar os valores preenchidos
		String nomeIndicador = (String)request.getAttribute("nomeIndicador");	
		String dataIndicador = (String)request.getAttribute("dataIndicador");
		String depIndicador = (String)request.getAttribute("depIndicador");
		Integer metaIndicador = (Integer)request.getAttribute("metaIndicador");
		
	%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- CADASTRO DE NOVO RISCO -->
	<div class="container">
	
		<!-- Botões -->	
		<a href="gerenciarIndicadores.jsp" class="btn btn-success">Consultar Indicadores</a>
		<br><br/>
		
		<form action="CadastraNovoIndicador.do" method="post">
			<fieldset>
				<legend>Novo Indicador</legend>
				
				
					<div class="form-group">	
		        		<label for="nomeVinho">Nome</label>					
						<input type="text" class="form-control" id="nomeVinho" name="nomeIndicador"
						maxlength="150" required value="<%if(nomeIndicador!=null){out.println(nomeIndicador);}%>"/>						
					</div>
					
					<div class="form-group">
		        		<label for="depIndicador">Departamento</label>		
						<select class="form-control" id="depIndicador" name="depIndicador" required>
							<option value="DEOPE" <%if( depIndicador!= null && depIndicador.equals("DEOPE"))
							{%>selected="selected"<%}%>>DEOPE</option>
							<option value="DEPRH" <%if( depIndicador!= null && depIndicador.equals("DEPRH"))
							{%>selected="selected"<%}%>>Tinto</option>
							<option value="DEPTI" <%if( depIndicador!= null && depIndicador.equals("DEPTI"))
							{%>selected="selected"<%}%>>DEPTI</option>
						</select>
					</div>
					
		        	<div class="form-group">	
		        		<label for="dataIndicador">Data-Base</label>					
						<input type="text" class="form-control" id="dataIndicador" 
						name="dataIndicador" maxlength="20" required value="<%=dataIndicador%>"/>						
					</div> 
<!-- 						min="1900" max="2017" -->
							
					
					<div class="form-group">
						<label for="metaIndicador">Meta</label>		
						<input type="text" class="form-control" id="metaIndicador" name="metaIndicador" 
						required value="<%=metaIndicador%>"/>
					</div>	
					
				
							
			</fieldset>
			<button type="submit" class="btn btn-primary">Cadastrar Indicador</button>
		</form>		
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
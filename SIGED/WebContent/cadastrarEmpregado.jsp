at<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%
		// Caso tenha ocorrido erro no cadastro, recuperar os valores preenchidos
				Integer matEmpregado = (Integer)request.getAttribute("matEmpregado");
				String nomeEmpregado = (String)request.getAttribute("nomeEmpregado");	
				String cargoEmpregado = (String)request.getAttribute("cargoEmpregado");
				Integer senhaEmpregado = (Integer)request.getAttribute("senhaEmpregado");
				
	%>
	
	
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- CADASTRO DE NOVO RISCO -->
	<div class="container">
	
		<!-- Botões -->	
		<a href="gerenciarEmpregados.jsp" class="btn btn-success">Consultar Empregados</a>
		<br></br>
		
		<form action="CadastraNovoEmpregado.do" method="post">
			<fieldset>
				<legend>Novo Empregado</legend>
					<div class="form-group">	
		        		<label for="nomeEmpregado">Nome</label>					
						<input type="text" class="form-control" id="nomeEmpregado" name="nomeEmpregado"
						maxlength="150" required value="<%if(nomeEmpregado!=null){out.println(nomeEmpregado);}%>"/>						
					</div>

					<div class="form-group">
						<select class="form-control" id="cargoEmpregado" name="cargoEmpregado" required>
							<option value="Analista do Sistema" <%if( cargoEmpregado != null &&
							cargoEmpregado.equals("Analista do Sistema")){%>selected="selected"<%}%>>Analista do Sistema</option>
							<option value="Gestor" <%if( cargoEmpregado!= null && 
							cargoEmpregado.equals("Gestor")){%>selected="selected"<%}%>>Gestor</option>
							<option value="Analista de Desenvolvimento" <%if( cargoEmpregado != null && 
							cargoEmpregado.equals("Analista de Desenvolvimento")){%>selected="selected"<%}%>>Analista de Desenvolvimento</option>
						</select>
					</div>	
					
										
					
					<div class="form-group">	 
		        		<label for="matEmpregado">Matrícula</label>				
						<input type="number" min="100" max="999" class="form-control" 
						id="matEmpregado"
						name="matEmpregado"  length="3"/>
					</div>			
		        		
				
					</div>	 
					
						<div class="form-group">	 
		        		<label for="senhaEmpregado">Senha</label>					 
 						<input type="number" min="1000" max="9999" class="form-control" id="senhaEmpregado"
 						name="senhaEmpregado" maxlength="4"/>
 						
 					</div> 
				
							
			</fieldset>
			<button type="submit" class="btn btn-primary">Cadastrar Empregado</button>
		</form>		
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
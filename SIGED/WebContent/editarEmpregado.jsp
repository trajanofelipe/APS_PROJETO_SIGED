<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%
			// Empregado a editar
				String matEmpregadoStr = request.getParameter("matEmpregado"); // se tiver vindo da lista de empregados
				if( matEmpregadoStr == null ) { // se tiver vindo do servlet de edição
					matEmpregadoStr = (String)request.getAttribute("matEMpregado");
				}
				
				Empregado empregadoEd = EmpregadoManager.consultarEmpregadosPorMat(Integer.parseInt(matEmpregadoStr));
			
				// Caso tenha ocorrido erro na edição, recuperar os valores preenchidos
				Integer matEmpregado = (Integer)request.getAttribute("matEmpregado");
				String nomeEmpregado = (String)request.getAttribute("nomeEmpregado");	
				String cargoEmpregado = (String)request.getAttribute("cargoEmpregado");
				String depEmpregado = (String)request.getAttribute("depEmpregado");
				String senhaEmpregado = (String)request.getAttribute("senhaEmpregado");
				
		%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- EDIÇÃO DE PRODUTO -->
	<div class="container">		
		<form action="EditaEmpregado.do" method="post">
			<fieldset>
				<legend>Edição de Empregado</legend>
				<input type="hidden" name=matEmpregado value="<%=empregadoEd.getMatEmpregado()%>">
					<div class="form-group">	
		        		<label for="nomeEmpregado">Nome</label>					
						<input type="text" class="form-control" id="nomeEmpregado" 
						name="nomeEmpregado" maxlength="30" required value="<%if(nomeEmpregado!=null)
						{out.println(nomeEmpregado);}else{out.println(empregadoEd.getNomeEmpregado());}%>"/>						
					</div>
					
					<div class="form-group">
						<label>Cargo</label>
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
						<label>Departamento</label>
						<select class="form-control" id="depEmpregado" name="depEmpregado" required>
							<option value="DEOPE" <%if( depEmpregado != null &&
							depEmpregado.equals("DEOPE")){%>selected="selected"<%}%>>DEOPE</option>
							<option value="DEPRH" <%if( depEmpregado!= null && 
							depEmpregado.equals("DEPRH")){%>selected="selected"<%}%>>DEPRH</option>
							<option value="DEPTI" <%if( depEmpregado != null && 
							depEmpregado.equals("DEPTI")){%>selected="selected"<%}%>>
							DEPTI</option>
						</select>
					</div>
					
					<%
 						Integer valorMatricula =  matEmpregado;
 						if( valorMatricula == null ) {
 							valorMatricula = empregadoEd.getMatEmpregado();
 						}					
					%>	
				
					<div class="form-group">	 
		        		<label for="matEmpregado">Matrícula</label>				
						<input type="number" min="100" max="999" class="form-control" id="matEmpregado"
						name="matEmpregado"  length="15" required value="<%=valorMatricula%>"/>
					</div>
				
				
					<%
// 					String valorSenha =  senhaEmpregado;
//  						if( valorSenha == null ) {
//  							valorSenha = empregadoEd.getSenhaEmpregado();
//  						}					
					%>	
				
					
						<div class="form-group">	 
		        		<label for="senhaEmpregado">Senha</label>					 
 						<input type="text" min="1000" max="9999" class="form-control" id="senhaEmpregado"
 						name="senhaEmpregado" maxlength="4" length="15"
 						required value="<%=empregadoEd.getSenhaEmpregado()%>"/>
 					</div> 
															
			</fieldset>
			<button type="submit" class="btn btn-primary">Editar Empregado</button>
		</form>		
	</div>
	<!-- fim .container da pagina -->
</body>
</html>
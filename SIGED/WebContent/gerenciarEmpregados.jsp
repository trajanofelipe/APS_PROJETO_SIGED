<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%
			// Lista de vinhos
				List<Empregado> empregados = EmpregadoManager.consultarTodosEmpregado();
				
				if( empregados.isEmpty() ) {
		%>	
		<div class="container"> 
			<div class="alert alert-danger">		
				<strong>Não há empregados cadastrados.</strong>
				<br></br><a href="cadastrarEmpregado.jsp" class="btn btn-success">Cadastrar Novo Empregado</a>
				<a href="confirmacaoEmpregado.jsp?operacao=popularBDEmpregado" class="btn btn-success">Popular Banco de Dados</a>
			</div>
		</div>		
	<%
				} else {
			%>
	
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>
	
	<!--  CONTAINER PRINCIPAL -->
	<div class="container">		
		<!-- Botões -->	
		<a href="cadastrarEmpregado.jsp" class="btn btn-success">Cadastrar Novo</a>
		<a href="confirmacaoEmpregado.jsp?operacao=limparBDEmpregado" class="btn btn-success">Limpar Banco de Dados</a>
		
		
		<div class="row">
	        <div class="panel panel-primary filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">Empregados</h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtro</button>
	                </div>
	            </div>
	            <table class="table">
	                <thead>
	                    <tr class="filters">
	                        <th width="5%"></th>
	                        <th width="5%"><input type="text" class="form-control" placeholder="Matricula" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Nome" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Cargo" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Senha" disabled></th>
	                        
	                        
	                    </tr>
	                </thead>
	                <%
	                	for( Empregado empregado : empregados) {
	                %>
				      <tr>
				      	<td>
				      		<a href="editarEmpregado.jsp?matEmpregado=<%=empregado.getMatEmpregado()%>" data-toggle="popover"
				      		data-trigger="hover" data-content="Editar"><img src="images/lapis-icon.png" alt="Editar" title="Editar"
				      		style="width:16px;height:16px;border:0;"></img></a>
				      		
				      		<a href="confirmacaoEmpregado.jsp?matEmpregado=<%=empregado.getMatEmpregado()%>&nomeEmpregado=
				      		<%=empregado.getNomeEmpregado()%>&operacao=excluirEmpregado" data-toggle="popover" data-trigger="hover"
				      		data-content="Excluir"><img src="images/delete-icon.png" alt="Excluir" title="Excluir"
				      		style="width:16px;height:16px;border:0;"></img></a>
				      	</td>				      	
				      	<td><strong><%=empregado.getMatEmpregado()%></strong></td>
				      	<td><%=empregado.getNomeEmpregado()%></td>				      	
				      	<td><%=empregado.getCargoEmpregado()%></td>
				      	<td><%=empregado.getSenhaEmpregado()%></td>
				      	
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
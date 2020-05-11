<%@include file="_import.jsp"%>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
     <%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta>
<title>SIGED</title>
</head>
<body>
	SISTEMA DE GESTÃO DE DESEMPENHO<br><br>
	<form action="login.jsp" method="post">
	
		usuário: <br/><input type="text" id ="usuario" name="usuario" autofocus=true><br/>
		senha:  <br/><input type="password" id="senha" name="senha"/><br/>
		
	<%
	
	
	String usuario = request.getParameter("usuario");
	
	String senha = request.getParameter("senha");	
	
	
	if(usuario == null || senha == null){
		
		
	} else {
		
	


List<Empregado> emp3 = EmpregadoManager.consultarTodosEmpregado();

List<Empregado> naoenc = new ArrayList<Empregado>();

for (Empregado e : emp3){
	
	if(e.getNomeEmpregado().equals(usuario) && e.getSenhaEmpregado().equals(senha)){
		

			String cargo = 	e.getCargoEmpregado();

			session.setAttribute("usuario", usuario);
							session.setAttribute("senha", senha);
							session.setAttribute("cargo", cargo);
							session.setAttribute("dep", e.getDepEmpregado());
					 		response.sendRedirect("index.jsp");

		return;
		
	} else {
		
		naoenc.add(e);
		

	}
	
	if(naoenc.size() == emp3.size()){
		
		JOptionPane.showMessageDialog(null, "Usuário/Senha inválido(s)","Falha de login",JOptionPane.WARNING_MESSAGE);
			
			usuario ="";
		
			senha="";
			
		
	}
}
	}
		
	%>
		<input type="submit" value="Acessar"/>
	
	</form>
	
</body>
</html>

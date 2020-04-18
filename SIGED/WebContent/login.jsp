

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
	
		usuário: <br/><input type="text" name="usuario"/><br/>
		senha:  <br/><input type="text" name="senha"/><br/>
		<input type="submit" value="Acessar"/>
	
	</form>
	<%
	
	
	
		String usuario = request.getParameter("usuario"); 
		
		String senha = request.getParameter("senha");
	
		if(usuario!=null && !usuario.isEmpty() 
				
				&&	senha!=null && !senha.isEmpty() 
			)
			
			
				
			
	
		{
		session.setAttribute("usuario", usuario);
		session.setAttribute("senha", senha);
 		response.sendRedirect("index.jsp");
// 		response.sendRedirect("loginDAO.java");
		}
			
			
		
	%>
	
	
</body>
</html>

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
	
		usuário: <br/><input type="text" id ="usuario" name="usuario"/><br/>
		senha:  <br/><input type="password" id="senha" name="senha"/><br/>
		
		
	
	<%
	
	
	
	
	String usuario = request.getParameter("usuario");
	
	String senha = request.getParameter("senha");	
	
	
	if(usuario == null || senha == null){
		
		
	} else {
		
	
	
// 	String user = "felipe";
	
// 	String senh = "123";
	
// 	String usuario = null;
// 	int senha = 0;
	
// // 	usuario = request.getParameter("usuario"); 
// 	System.out.println(usuario);
// // 	senha = Integer.parseInt(request.getParameter("senha"));
// 	System.out.println(senha);
	
// 	Empregado emp = EmpregadoManager.consultarEmpregadosPorNome(usuario);
	
// 	System.out.println(usuario);
// 	System.out.println(emp);
	
// 	Empregado emp2 = EmpregadoManager.login(usuario, senha);
	
// 	System.out.println(usuario);
// 	System.out.println(senha);
// 	System.out.println(emp2);
	
// 		Empregaodo empregado = EmpregadoDAO.getUsuarioLoginSenha(login,senha);
		

// EmpregadoDAO dao = new EmpregadoDAO();
// System.out.println(dao);
List<Empregado> emp3 = EmpregadoManager.consultarTodosEmpregado();
// System.out.println(emp3);
List<Empregado> naoenc = new ArrayList<Empregado>();

for (Empregado e : emp3){
	
	if(e.getNomeEmpregado().equals(usuario) && e.getSenhaEmpregado().equals(senha)){
		
// 		System.out.println("achou");
// 		System.out.println(e.getNomeEmpregado());
// 		System.out.println(e.getSenhaEmpregado());
// 		System.out.println(e.getCargoEmpregado());
			String cargo = 	e.getCargoEmpregado();

			session.setAttribute("usuario", usuario);
							session.setAttribute("senha", senha);
							session.setAttribute("cargo", cargo);
							session.setAttribute("dep", e.getDepEmpregado());
					 		response.sendRedirect("index.jsp");

		return;
		
	} else {
		
		naoenc.add(e);
		
// 		System.out.println("não achou");

		

	}
	
	if(naoenc.size() == emp3.size()){
		
		JOptionPane.showMessageDialog(null, "Usuário/Senha inválido(s)","Falha de login",JOptionPane.WARNING_MESSAGE);
	}
}
	}
// System.out.println(naoenc.size());
// System.out.println(emp3.size());
// if(naoenc.size() == emp3.size()){
	
// 	alert.
// }



// 	if (emp3.size() == naoenc.size()){
		
// 	}else{
// 		System.out.println("Login/Senha Incorreto(s)");
// 	}
	




// 		Empregado d = dao.login(usuario, senha);
		
// // 		Empregado usu = new Empregado()	; 
// 		Empregado usu =		EmpregadoManager.login(usuario, senha);
		
//  		System.out.println(usuario);
//  		System.out.println(senha);
 		
//  		System.out.println(usu);
//  		System.out.println(dao);
//  		System.out.println(d);
		
//  		Empregado login = dao.selecionarPorNome(usuario); 
//  		System.out.print(dao);
 		
//  		Empregado e = dao.login(usuario, senha);
//  		System.out.print(e);
 		
 		
		
// 		List<Empregado> e = EmpregadoManager.consultarTodosEmpregado();
		
		
// 		for (Empregado ee : e){
			
// 			if(usu.getNomeEmpregado().equals(ee.getNomeEmpregado())){
				
// 				if(usu.getSenhaEmpregado() == ee.getSenhaEmpregado()){
					
// 					session.setAttribute("usuario", usuario);
// 							session.setAttribute("senha", senha);
// 					 		response.sendRedirect("index.jsp");
// 				} else{
// 					System.out.println("senha incorreta");
					
// 				}
				
// 			}else{
				
// 				System.out.println("nao existe esse usuario");
// 			}
// 		}
		
		
// 		String usuario = request.getParameter("usuario"); 
// 		System.out.println(usuario);
// 		if(usuario!=null && !usuario.isEmpty() 
				
// 				&&	senha!=null && !senha.isEmpty() 
// 			)
			
			
				
			
	
// 		{
// // 		session.setAttribute("usuario", usuario);
// // 		session.setAttribute("senha", senha);
// //  		response.sendRedirect("index.jsp");
// // 		response.sendRedirect("loginDAO.java");
// 		}
			
			
		
	%>
		<input type="submit" value="Acessar"/>
	
	</form>
	
</body>
</html>

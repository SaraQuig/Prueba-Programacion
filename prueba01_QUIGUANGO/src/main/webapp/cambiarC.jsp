<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%
    // Obtén los valores del formulario
    Usuario user= new Usuario();
    String login = request.getParameter("login");
    String claveActual = request.getParameter("claveActual");
    String nuevaContrasena = request.getParameter("nuevaContrasena");
    
    //
    String re_nuevaContrasena = request.getParameter("rep_nuevaC");

    // Llamada a la función cambiarContrasena
    boolean cambioExitoso = user.cambiarContrasena(login, claveActual, nuevaContrasena, re_nuevaContrasena);

    if (cambioExitoso) {
    	response.sendRedirect("menu.jsp");
    } else {
        out.println("No se pudo cambiar la contraseña");
    }
%>
</body>
</html>
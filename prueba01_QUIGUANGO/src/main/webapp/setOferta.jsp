<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="conf.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    // Obtener el ID del producto de la URL
    
    int id = Integer.parseInt(request.getParameter("id"));

    // Obtener el producto de la base de datos
    Productos producto = 	Acciones.getUserById_Producto(id);
	
    // Reducir el precio del producto en un 10%
    double precioOriginal = producto.getPrecio();
    double precioOferta = precioOriginal * 0.9; // Reducción del 10%
    producto.setPrecio(precioOferta);

    // Actualizar el producto en la base de datos
    Acciones.updatePro(producto);

    // Redireccionar de vuelta a la página principal
    response.sendRedirect("cambiarEstadoProd.jsp");
%>

</body>
</html>
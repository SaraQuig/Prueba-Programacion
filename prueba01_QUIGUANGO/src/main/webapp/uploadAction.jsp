<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="conf.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<%
  	String nombre = request.getParameter("nombre");
  	Double precio = Double.parseDouble(request.getParameter("precio"));
  	String cant = request.getParameter("cant");
  	Double precioOferta = Double.parseDouble(request.getParameter("precio_oferta"));
  	
  	Productos pro = new Productos();
  	pro.setPrecio(precio);
  	pro.setNombre(nombre);
  	pro.setCantidad(cant);
  	pro.setPrecioOferta(precioOferta);
  
  	
  	Acciones.createProducto(pro);
  	
  	response.sendRedirect("cambiarEstadoProd.jsp");
  	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="conf.*" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Productos en oferta</title>
</head>
<body>
	<h1>Productos en oferta</h1>
	 <table>
        <tr>
            <th>Nombre</th>
            <th>Precio original</th>
            <th>Cantidad</th>
            <th>Precio oferta</th>
        </tr>
        <%-- Mostrar los usuarios existentes --%>
        <% 
            List<Productos> ev = Acciones.getProductosOferta();
            for (Productos pro : ev) {
        %>
        <tr>
            <td><%= pro.getNombre() %></td>
            <td><%= pro.getPrecio() %></td>
             <td><%= pro.getCantidad() %></td>
              <td><%= pro.getPrecioOferta() %></td>       
        </tr>
        <% } %>
    </table>
</body>
</html>
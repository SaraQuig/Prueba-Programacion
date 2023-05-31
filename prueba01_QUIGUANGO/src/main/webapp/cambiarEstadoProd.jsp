<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="conf.*" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cambiar estado productos</title>
</head>
<body>
 <h1>Subir productos</h1>
    <form method="post" action="uploadAction.jsp" >
    	Nombre: <input type="text" name="nombre"><br>
    	Precio: <input type="text" name="precio"><br>
    	Cantidad: <input type="text" name="cant"><br>
    	Precio Oferta: <input type="text" name="precio_oferta"><br>
        <input type="submit" value="Subir producto">
    </form>
    	<%
    // Obtener las solicitudes almacenadas en la base de datos
    
    List<Productos> solicitudes = Acciones.getAllProductos();
   
%>

	<h1>Productos</h1>

	<table>
		<tr>
			<th>Nombre</th>
			<th>Precio</th>
			<th>Cantidad</th>
			<th>Precio oferta</th>
			<th>Estado</th>
			<th>Acción</th>
		</tr>
		<% for (Productos solicitud : solicitudes) { %>
		<tr>
			<td><%= solicitud.getNombre() %></td>
			<td><%= solicitud.getPrecio() %></td>
			<td><%= solicitud.getCantidad() %></td>
			<td><%= solicitud.getPrecioOferta() %></td>
			<td><%= solicitud.getEstado() %></td>
		
			<td>
				<% if (solicitud.getEstado().equals("No esta en oferta")) { %> 
				<a href="cambiar_estado.jsp?id=<%= solicitud.getId() %>">Asignar oferta</a> 
				<% }else{
            	
            %> 
            <a href="cambiar_estado.jsp?id=<%= solicitud.getId() %>">Actualizar estado</a> | <a href="quitar_oferta.jsp?id=<%= solicitud.getId() %>">Quitar oferta</a>
            <%
            } %>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>
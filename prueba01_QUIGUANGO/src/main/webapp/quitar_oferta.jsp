<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="conf.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oferta del producto</title>
</head>
<body>
<%
    // Obtener el ID de la solicitud a rechazar
    int idSolicitud = Integer.parseInt(request.getParameter("id"));
    
    // Actualizar el estado de la solicitud en la base de datos a "Rechazado"
 	Productos soli = Acciones.getUserById_Producto(idSolicitud);
 	 if (request.getMethod().equalsIgnoreCase("post")) {
 		 String nombre = request.getParameter("nombre");
 	    double precio = Double.parseDouble(request.getParameter("precio"));
 	    String cant = request.getParameter("cant");
 	    double precioOferta = Double.parseDouble(request.getParameter("precio_oferta"));
         String estado = request.getParameter("estado");
         
         soli.setNombre(nombre);
         soli.setCantidad(cant);
         soli.setPrecio(precio);
       
         soli.setEstado(estado);
         
      
        // double precioOfertaP = 0.0; // Reducción del 10%
         soli.setPrecioOferta(precioOferta);  
         Acciones.updatePro(soli);
         
         response.sendRedirect("cambiarEstadoProd.jsp");
 	 }else{
    
%>
<%
    }
%>
<h1>Editar Estado</h1>
    <form method="post" action="quitar_oferta.jsp">
        <input type="hidden" name="id" value="<%= soli.getId()%>">
       <label>Nombre:</label>  
       <input type="text" name="nombre"  value="<%= soli.getNombre() %>"><br>
        Precio:<input type="text"  name="precio" value="<%= soli.getPrecio() %>"><br>
          Cantidad:<input type="text"  name="cant" value="<%= soli.getCantidad()%>"><br>
          Precio oferta:<input type="text" placeholder="Escriba 0" name="precio_oferta" value="<%= soli.getPrecioOferta()%>"><br>
        
            Estado oferta:<input type="text" placeholder="Escriba No esta en oferta "  name="estado" value="<%= soli.getEstado() %>"><br>
        <input type="submit" value="Guardar">
    </form>

</body>
</html>

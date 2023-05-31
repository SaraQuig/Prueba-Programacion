<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Cambio clave</title>
</head>
<body>
    <h1>Cambio de contraseña</h1>
    <form method="post" action="cambiarC.jsp">
        Login: <input type="text" name="login" required><br>
        Contraseña actual: <input type="password" name="claveActual" required><br>
        Nueva contraseña: <input type="password" name="nuevaContrasena" required><br>
         Repetir contraseña: <input type="password" name="rep_nuevaC" required><br>
        <input type="submit" value="Cambiar contraseña">
    </form>
</body>
</html>
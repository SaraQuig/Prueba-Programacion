package com.productos.seguridad;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.*;

public class Pagina {
	
	
	private String nombre;
	private String path;
	
	public String mostrarMenu(int nperfil)
	{
	String menu="<ul>";
	String sql="SELECT * FROM pagina pag, perfil per, pagper pper "
	+
	"WHERE pag.id_p=pper.id_pag AND pper.id_per=per.id AND pper.id_per= "+nperfil;
	Conexion con = new Conexion();
	ResultSet rs=null;
	try
	{
	rs=con.Consulta(sql);
	while(rs.next())
	{
	menu+="<li><a href="+rs.getString(3)+" accesskey="+rs.getInt(1)+">"+rs.getString(2)+
	"</A></li>";
	}
	menu+="</ul>";
	}
	catch(SQLException e)
	{
		System.out.print(e.getMessage());
	}
	return menu;
	}

	public Pagina() {
		this.setNombre("");
		this.setPath("");
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}

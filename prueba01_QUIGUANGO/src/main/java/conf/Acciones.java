package conf;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class Acciones {
	private static final String URL = "jdbc:postgresql://localhost:5432/db_prueba";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
	 public static List<Productos> getAllProductos() {
	        List<Productos> ev = new ArrayList<>();
	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM productos");
	             ResultSet rs = stmt.executeQuery()) {
	            
	            while (rs.next()) {
	                Productos eve = new Productos();
	                eve.setId(rs.getInt("id"));
	                eve.setNombre(rs.getString("nombre"));
	                eve.setPrecio(rs.getDouble("precio"));
	                eve.setCantidad(rs.getString("cant"));
	                eve.setPrecioOferta(rs.getDouble("precio_oferta"));
	                eve.setEstado(rs.getString("estado"));
	                ev.add(eve);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return ev;
	    }
	 /*Para registrar un produccto en la base de dtaos*/
	    public static void createProducto(Productos ev) {
	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement("INSERT INTO productos (nombre,precio,cant,precio_oferta,estado) VALUES (?,?,?,?,?)")) {
	            
	        	stmt.setString(1, ev.getNombre());
	        	stmt.setDouble(2, ev.getPrecio());
	        	stmt.setString(3, ev.getCantidad());
	        	stmt.setDouble(4, ev.getPrecioOferta());
	        	stmt.setString(5, "No esta en oferta");
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    /*Para obtener el id del producto al cual se le asignara la oferta*/
	    public static Productos getUserById_Producto(int id) {
	        Productos ev = null;
	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM productos WHERE id = ?")) {
	            
	            stmt.setInt(1, id);
	            try (ResultSet rs = stmt.executeQuery()) {
	                if (rs.next()) {
	                    ev = new Productos();
	                    ev.setId(rs.getInt("id"));
	                    ev.setNombre(rs.getString("nombre"));
	                    ev.setPrecio(rs.getDouble("precio"));     
	                    ev.setCantidad(rs.getString("cant"));
	                    ev.setPrecioOferta(rs.getDouble("precio_oferta"));
	                    ev.setEstado(rs.getString("estado"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return ev;
	    }
	    public static void updatePro(Productos ev) {
	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement("UPDATE productos SET nombre = ?, precio = ?, cant = ?,  precio_oferta = ?, estado = ? WHERE id = ?")) {
	            
	           stmt.setString(1, ev.getNombre());
	           stmt.setDouble(2, ev.getPrecio());
	           stmt.setString(3, ev.getCantidad());
	            stmt.setDouble(4, ev.getPrecioOferta());
	          
	            stmt.setString(5, ev.getEstado());
	            stmt.setInt(6, ev.getId());
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    /*Metodo que usa para que el cliente pueda ver los productos que estan en oferta*/
	    public static List<Productos> getProductosOferta() {
	        List<Productos> solicitudes = new ArrayList<>();
	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM productos WHERE estado = 'En oferta'");
	        ) {
	            
	            try (ResultSet rs = stmt.executeQuery()) {
	                while (rs.next()) {
	                    Productos solicitud = new Productos();
	                    solicitud.setId(rs.getInt("id"));
	                    solicitud.setNombre(rs.getString("nombre"));
	                    solicitud.setPrecio(rs.getDouble("precio"));
	                    solicitud.setCantidad(rs.getString("cant"));
	                    solicitud.setPrecioOferta(rs.getDouble("precio_oferta"));
	                    solicitud.setEstado(rs.getString("estado"));
	                    solicitudes.add(solicitud);
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return solicitudes;
	    }

}

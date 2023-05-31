package conf;

public class Productos {
	private int id;
	private String nombre;
	private double precio;
	private String cantidad;
	private double precioOferta;
	private String estado;
	
	public Productos(int id, String nombre, double precio, String cantidad, double precioOferta) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.precio = precio;
		this.cantidad = cantidad;
		this.precioOferta = precioOferta;
	}
	public Productos() {
		setId(id);
		setNombre(nombre);
		setPrecio(precio);
		setCantidad(cantidad);
		setPrecioOferta(precioOferta);
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public String getCantidad() {
		return cantidad;
	}
	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	public double getPrecioOferta() {
		return precioOferta;
	}
	public void setPrecioOferta(double precioOferta) {
		this.precioOferta = precioOferta;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}

	
	
}

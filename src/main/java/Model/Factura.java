package Model;
import java.time.LocalDate;

public class Factura {
    int id;
    int idPedido;
    String correo;
    int precio;
    LocalDate fecha;

    public Factura() {
    }

    public Factura(int idPedido, String correo, int precio, LocalDate fecha) {
        this.idPedido = idPedido;
        this.correo = correo;
        this.precio = precio;
        this.fecha = fecha;
    }

     public Factura(int id, int idPedido, String correo, int precio, LocalDate fecha) {
        this.id = id;
        this.idPedido = idPedido;
        this.correo = correo;
        this.precio = precio;
        this.fecha = fecha;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPedido() {
        return this.idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getCorreo() {
        return this.correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getPrecio() {
        return this.precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public LocalDate getFecha() {
        return this.fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", idPedido='" + getIdPedido() + "'" +
            ", correo='" + getCorreo() + "'" +
            ", precio='" + getPrecio() + "'" +
            ", fecha='" + getFecha() + "'" +
            "}";
    }

}

package Model;

import java.sql.Blob;

public class Camisa {

    int id;
    int idLote;
    int idPedido;
    String talla;
    String color;
    String tipoEstampado;
    Blob imagen;

    public Camisa() {
    }

    public Camisa(int idPedido, String talla, String color, String tipoEstampado) {
        this.idPedido = idPedido;
        this.talla = talla;
        this.color = color;
        this.tipoEstampado = tipoEstampado;
    }

    public Camisa(int idLote, int idPedido, String talla, String color, String tipoEstampado, Blob imagen) {
        this.idLote = idLote;
        this.idPedido = idPedido;
        this.talla = talla;
        this.color = color;
        this.tipoEstampado = tipoEstampado;
        this.imagen = imagen;
    }

    public Camisa(int id, int idLote, int idPedido, String talla, String color, String tipoEstampado, Blob imagen) {
        this.id = id;
        this.idLote = idLote;
        this.idPedido = idPedido;
        this.talla = talla;
        this.color = color;
        this.tipoEstampado = tipoEstampado;
        this.imagen = imagen;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdLote() {
        return this.idLote;
    }

    public void setIdLote(int idLote) {
        this.idLote = idLote;
    }

    public int getIdPedido() {
        return this.idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getTalla() {
        return this.talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTipoEstampado() {
        return this.tipoEstampado;
    }

    public void setTipoEstampado(String tipoEstampado) {
        this.tipoEstampado = tipoEstampado;
    }

    public Blob getImagen() {
        return this.imagen;
    }

    public void setImagen(Blob imagen) {
        this.imagen = imagen;
    }

    @Override
    public String toString() {
        return "{"
                + " id='" + getId() + "'"
                + ", idLote='" + getIdLote() + "'"
                + ", idPedido='" + getIdPedido() + "'"
                + ", talla='" + getTalla() + "'"
                + ", color='" + getColor() + "'"
                + ", tipoEstampado='" + getTipoEstampado() + "'"
                + ", imagen='" + getImagen() + "'"
                + "}";
    }

}

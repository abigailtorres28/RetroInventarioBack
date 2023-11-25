package Model;

import java.time.LocalDate;


public class Lote {
    int id;
    LocalDate fechaEntrada;
    String color;
    String talla;
    int cantidad;
    int precio;

    public Lote() {
    }

    public Lote(LocalDate fechaEntrada, String color, String talla, int cantidad, int precio) {
        this.fechaEntrada = fechaEntrada;
        this.color = color;
        this.talla = talla;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Lote(int id, LocalDate fechaEntrada, String color, String talla, int cantidad, int precio) {
        this.id = id;
        this.fechaEntrada = fechaEntrada;
        this.color = color;
        this.talla = talla;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getFechaEntrada() {
        return this.fechaEntrada;
    }

    public void setFechaEntrada(LocalDate fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTalla() {
        return this.talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecio() {
        return this.precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", fechaEntrada='" + getFechaEntrada().toString() + "'" +
            ", color='" + getColor() + "'" +
            ", talla='" + getTalla() + "'" +
            ", cantidad='" + getCantidad() + "'" +
            ", precio='" + getPrecio() + "'" +
            "}";
    }

}

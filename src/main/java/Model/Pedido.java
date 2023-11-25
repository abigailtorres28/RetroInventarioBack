package Model;

import java.time.LocalDate;


public class Pedido {
    int id;
    int idEmpleado;
    String cliente;
    int cantidad;
    String direccion;
    LocalDate fechaPedido;
    LocalDate fechaEntrega;
    String estado;

    public Pedido() {
    }

    public Pedido(String cliente, int cantidad, String direccion, LocalDate fechaPedido) {
        this.cliente = cliente;
        this.cantidad = cantidad;
        this.direccion = direccion;
        this.fechaPedido = fechaPedido;
    }

    public Pedido(int id, int idEmpleado, String cliente, int cantidad, String direccion, LocalDate fechaPedido,
            LocalDate fechaEntrega, String estado) {
        this.id = id;
        this.idEmpleado = idEmpleado;
        this.cliente = cliente;
        this.cantidad = cantidad;
        this.direccion = direccion;
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
        this.estado = estado;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdEmpleado() {
        return this.idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getCliente() {
        return this.cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public LocalDate getFechaPedido() {
        return this.fechaPedido;
    }

    public void setFechaPedido(LocalDate fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public LocalDate getFechaEntrega() {
        return this.fechaEntrega;
    }

    public void setFechaEntrega(LocalDate fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public Pedido id(int id) {
        setId(id);
        return this;
    }

    public Pedido idEmpleado(int idEmpleado) {
        setIdEmpleado(idEmpleado);
        return this;
    }

    public Pedido cliente(String cliente) {
        setCliente(cliente);
        return this;
    }

    public Pedido cantidad(int cantidad) {
        setCantidad(cantidad);
        return this;
    }

    public Pedido direccion(String direccion) {
        setDireccion(direccion);
        return this;
    }

    public Pedido fechaPedido(LocalDate fechaPedido) {
        setFechaPedido(fechaPedido);
        return this;
    }

    public Pedido fechaEntrega(LocalDate fechaEntrega) {
        setFechaEntrega(fechaEntrega);
        return this;
    }

    public String getEstado() {
        return this.estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", idEmpleado='" + getIdEmpleado() + "'" +
            ", cliente='" + getCliente() + "'" +
            ", cantidad='" + getCantidad() + "'" +
            ", direccion='" + getDireccion() + "'" +
            ", fechaPedido='" + getFechaPedido() + "'" +
            ", fechaEntrega='" + getFechaEntrega() + "'" +
            ", estado='" + getEstado() + "'" +
            "}";
    }

}

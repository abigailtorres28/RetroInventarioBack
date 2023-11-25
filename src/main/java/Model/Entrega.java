package Model;

import java.time.LocalDate;

public class Entrega {
    int idEntrega;
    int idPedido;
    int idEmpleado;
    LocalDate fecha;
    int numDefectuosas;
    String comentario;


    public Entrega() {
    }

    public Entrega(int idPedido, int idEmpleado, LocalDate fecha, int numDefectuosas, String comentario) {
        this.idPedido = idPedido;
        this.idEmpleado = idEmpleado;
        this.fecha = fecha;
        this.numDefectuosas = numDefectuosas;
        this.comentario = comentario;
    }


    public Entrega(int idEntrega, int idPedido, int idEmpleado, LocalDate fecha, int numDefectuosas, String comentario) {
        this.idEntrega = idEntrega;
        this.idPedido = idPedido;
        this.idEmpleado = idEmpleado;
        this.fecha = fecha;
        this.numDefectuosas = numDefectuosas;
        this.comentario = comentario;
    }

    public int getIdEntrega() {
        return this.idEntrega;
    }

    public void setIdEntrega(int idEntrega) {
        this.idEntrega = idEntrega;
    }

    public int getIdPedido() {
        return this.idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdEmpleado() {
        return this.idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public LocalDate getFecha() {
        return this.fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public int getNumDefectuosas() {
        return this.numDefectuosas;
    }

    public void setNumDefectuosas(int numDefectuosas) {
        this.numDefectuosas = numDefectuosas;
    }

    public String getComentario() {
        return this.comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    @Override
    public String toString() {
        return "{" +
            " idEntrega='" + getIdEntrega() + "'" +
            ", idPedido='" + getIdPedido() + "'" +
            ", idEmpleado='" + getIdEmpleado() + "'" +
            ", fecha='" + getFecha() + "'" +
            ", numDefectuosas='" + getNumDefectuosas() + "'" +
            ", comentario='" + getComentario() + "'" +
            "}";
    }


}
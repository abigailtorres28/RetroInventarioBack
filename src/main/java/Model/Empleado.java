package Model;

import java.io.InputStream;

public class Empleado {
    int id_empleado;
    String cedula;
    String nombres;
    String apellidos;
    String correo;
    String telefono;
    String estado;
    String cotraseña;
    InputStream foto;

    public Empleado() {
    }

    public Empleado(String cedula, String nombres, String apellidos, String correo, String telefono,
            String estado, String cotraseña, InputStream foto) {

        this.cedula = cedula;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.telefono = telefono;
        this.estado = estado;
        this.cotraseña = cotraseña;
        this.foto = foto;
    }

    public Empleado(int id_empleado, String cedula, String nombres, String apellidos, String correo, String telefono,
            String estado, String cotraseña, InputStream foto) {
        this.id_empleado = id_empleado;
        this.cedula = cedula;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.telefono = telefono;
        this.estado = estado;
        this.cotraseña = cotraseña;
        this.foto = foto;
    }

    public int getId_empleado() {
        return this.id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getCedula() {
        return this.cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombres() {
        return this.nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return this.apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return this.correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEstado() {
        return this.estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCotraseña() {
        return this.cotraseña;
    }

    public void setCotraseña(String cotraseña) {
        this.cotraseña = cotraseña;
    }

    public InputStream getFoto() {
        return this.foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        return "{" +
                " id_empleado='" + getId_empleado() + "'" +
                ", cedula='" + getCedula() + "'" +
                ", nombres='" + getNombres() + "'" +
                ", apellidos='" + getApellidos() + "'" +
                ", correo='" + getCorreo() + "'" +
                ", telefono='" + getTelefono() + "'" +
                ", estado='" + getEstado() + "'" +
                ", cotraseña='" + getCotraseña() + "'" +
                ", foto='" + getFoto() + "'" +
                "}";
    }

}

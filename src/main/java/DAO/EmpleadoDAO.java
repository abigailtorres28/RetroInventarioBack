package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import config.conexion;
import Model.Empleado;
import Model.Pedido;
import interfaces.IntEmpleado;

public class EmpleadoDAO implements IntEmpleado {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // este metodo agrega empleados en la base de datos
    // No agrega una lista de los pedidos del empleado
    // El id del empleado es incremental en la base de datos
    /// no agrega fotos todavia
    ///El estado por defecto es activo
    @Override
    public boolean agregarEmpleado(Empleado e) {
        String sql = "insert into empleado(`cedula`, `nombres`, `apellidos`, `correo` , `telefono`, `estado`, `contraseña`) values('"
                + e.getCedula() + "','" + e.getNombres() + "','"
                + e.getApellidos() + "','" + e.getCorreo() + "','" + e.getTelefono() + "','" + "Activo"
                + "','" + e.getCotraseña() + "')";
        System.out.println(sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    // deuvuelve una lista con los empleados que estan registrados
    // aun no ddevuelve la foto
    @Override
    public List<Empleado> listarEmpleados() {
        List<Empleado> list = new ArrayList<>();
        String sql = "select * from empleado";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado();
                e.setId_empleado(rs.getInt("idEmpleado"));
                e.setCedula(rs.getString("cedula"));
                e.setNombres(rs.getString("nombres"));
                e.setApellidos(rs.getString("apellidos"));
                e.setCorreo(rs.getString("correo"));
                e.setTelefono(rs.getString("telefono"));
                e.setEstado(rs.getString("estado"));
                e.setCotraseña(rs.getString("contraseña"));
                // e.setFoto(rs.getBlob("foto"));
                list.add(e);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }

    // Devuelve un empleado a quien le corresponde el id ingresado
    // Hace falta implementar el obtener la imagen...
    @Override
    public Empleado verEmpleado(int id) {
        String sql = "SELECT * FROM `empleado` WHERE idEmpleado=" + id;
        Empleado e = new Empleado();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                e.setId_empleado(id);
                e.setCedula(rs.getString("cedula"));
                e.setNombres(rs.getString("nombres"));
                e.setApellidos(rs.getString("apellidos"));
                e.setCorreo(rs.getString("correo"));
                e.setTelefono(rs.getString("telefono"));
                e.setEstado(rs.getString("estado"));
                e.setCotraseña(rs.getString("contraseña"));
                // e.setFoto((rs.getBlob("foto")));
            }
            return e;

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    // Metodo que modifica los datos de un empleado en la base de datos
    // falta implementar que pueda modificar la foto
    // solo se permite modifical el telefono y el estado
    /// El estado por defecto debe ser activo osea en la vista solo puede poner
    // activo o incativo NUNCA NULL
    @Override
    public boolean editarEmpleado(Empleado empleado) {
        try {
            con = cn.getConnection();

            StringBuilder query = new StringBuilder("UPDATE empleado SET ");

            if (empleado.getTelefono() != null) {
                query.append("telefono = ?, ");
            }
            if (empleado.getEstado() != null) {
                query.append("estado = ?, ");
            }

            query.deleteCharAt(query.length() - 2);
            query.append(" WHERE idEmpleado = ?");

            PreparedStatement pstmt = con.prepareStatement(query.toString());

            int index = 1;
            if (empleado.getTelefono() != null) {
                pstmt.setString(index++, empleado.getTelefono());
            }
            if (empleado.getEstado() != null) {
                pstmt.setString(index++, empleado.getEstado());
            }
            pstmt.setInt(index, empleado.getId_empleado());
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

  
    @Override
    public int validarUsuario(String correo, String contraseña) {
        String query = "SELECT idEmpleado FROM empleado WHERE correo = ? AND contraseña = ?";
        try {
            con = cn.getConnection();
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, correo);
            statement.setString(2, contraseña);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("idEmpleado"); // Si las credenciales coinciden, devuelve el idEmpleado
            } else {
                return 0; // Si no hay coincidencia, devuelve 0
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // En caso de error, también devuelve 0
        }
    }

    //////Este metodo trae una lista del id y del nombre de los empleados que se encuentran activos
    @Override
    public List<Empleado> listar() {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM empleado WHERE estado='activo'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado();
                e.setId_empleado(rs.getInt("idEmpleado"));
                e.setCedula(rs.getString("cedula"));
                e.setNombres(rs.getString("nombres"));
                e.setApellidos(rs.getString("apellidos"));
                e.setCorreo(rs.getString("correo"));
                e.setTelefono(rs.getString("telefono"));
                e.setEstado(rs.getString("estado"));
                e.setCotraseña(rs.getString("contraseña"));
                empleados.add(e);
            }
        } catch (Exception e) {
        }
        return empleados;
    }

}

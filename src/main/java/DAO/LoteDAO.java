package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import Model.Lote;
import config.conexion;
import interfaces.IntLote;

public class LoteDAO implements IntLote {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    //// Este metodo ingresa un nuevo lote de camisas
    @Override
    public boolean ingresar(Lote lote) {
        LocalDate fecha = lote.getFechaEntrada();
        java.sql.Date fechasql = java.sql.Date.valueOf(fecha);
        String sql = "INSERT INTO `camisas`(`fechaEntrada`, `color`, `talla`, `cantidad`, `precio`) VALUES ('"
                + fechasql + "','" + lote.getColor() + "','" + lote.getTalla() + "','" + lote.getCantidad() + "','"
                + lote.getPrecio() + "')";
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

    //// lista todos los ingresos de lotes
    @Override
    public List<Lote> listarIngresos() {
        List<Lote> lotes = new ArrayList<>();
        String sql = "select * from camisas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Lote l = new Lote();
                l.setId(rs.getInt("idLote"));
                l.setFechaEntrada(rs.getDate("fechaEntrada").toLocalDate());
                l.setColor(rs.getString("color"));
                l.setTalla(rs.getString("talla"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setPrecio(rs.getInt("precio"));
                lotes.add(l);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return lotes;
    }

    /// Lista todos los lotes de camisas por color
    @Override
    public List<Lote> ListarColor(String color) {
        List<Lote> lotes = new ArrayList<>();
        String sql = "SELECT * FROM camisas WHERE LOWER(color) = LOWER('" + color + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Lote l = new Lote();
                l.setId(rs.getInt("idLote"));
                l.setFechaEntrada(rs.getDate("fechaEntrada").toLocalDate());
                l.setColor(rs.getString("color"));
                l.setTalla(rs.getString("talla"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setPrecio(rs.getInt("precio"));
                lotes.add(l);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return lotes;
    }

    @Override
    public List<String> colores() {
        List<String> colores = new ArrayList<>();
        String sql = "SELECT DISTINCT color FROM camisas ";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String color = rs.getString("color");
                colores.add(color);
            }
        } catch (Exception e) {
            System.out.println("ha ocurrido un error : " + e.getMessage());
        }
        return colores;
    }

    @Override
    public List<String> tallas() {
        List<String> tallas = new ArrayList<>();
        String sql = "SELECT DISTINCT talla FROM camisas ";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String talla = rs.getString("talla");
                tallas.add(talla);
            }
        } catch (Exception e) {
            System.out.println("ha ocurrido un error : " + e.getMessage());
        }
        return tallas;
    }

    @Override
    public int buscarInventario(String color, String talla
    ) {
        int cantidad = 0;
        String sql = "SELECT SUM(cantidad) as cantidad FROM camisas WHERE LOWER(color) = LOWER('" + color + "') AND LOWER(talla) = LOWER('" + talla + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cantidad= rs.getInt("cantidad"); 
            }
        } catch (Exception e) {
            System.out.println("hubo un error: " + e.getMessage());
        }
        return cantidad;
    }
}

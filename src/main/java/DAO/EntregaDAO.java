package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import Model.Entrega;
import config.conexion;
import interfaces.IntEntrega;

public class EntregaDAO implements IntEntrega {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;


    ///Registra una nueva entrega por parte del empleado
    /////Cuando se registra una entrega el pedido se modifica la fecha de entrega y el estado pasa a finalizado
    @Override
    public boolean registrarEntrega(Entrega e) {
        LocalDate fechaEntrega = e.getFecha();
        java.sql.Date fechasql2 = java.sql.Date.valueOf(fechaEntrega);
        String sql = "insert into entrega(`idPedido`, `idEmpleado`, `fecha`, `defectuosas` , `comentario`) values('"
                + e.getIdPedido() + "','" + e.getIdEmpleado() + "','"
                + fechasql2 + "','" + e.getNumDefectuosas() + "','" + e.getComentario() + "')";
        System.out.println(sql);

        String updatePedidoQuery = "UPDATE pedido SET estado = 'finalizado', fechaEntrega = '" + fechaEntrega
                + "' WHERE idPedido = " + e.getIdPedido();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            /// Modifica la tabla de pedido
            PreparedStatement updatePedidoStmt = con.prepareStatement(updatePedidoQuery);
            updatePedidoStmt.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }


    ////Muestra una lista con todas las entregas que se han hecho
    @Override
    public List<Entrega> listarEntregas() {
        List<Entrega> entregas = new ArrayList<>();
        String sql = "select * from entrega";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Entrega e = new Entrega();
                e.setIdEntrega(rs.getInt("idEntrega"));
                e.setIdPedido(rs.getInt("idPedido"));
                e.setIdEmpleado(rs.getInt("idEmpleado"));
                e.setFecha(rs.getDate("fecha").toLocalDate());
                e.setNumDefectuosas(rs.getInt("defectuosas"));
                e.setComentario(rs.getString("comentario"));
                entregas.add(e);
            }
        } catch (Exception e) {
            System.out.println(e.getCause());
        }
        return entregas;
    }
    ///Busca las entregas que ha hecho un empleado
    @Override
    public List<Entrega> buscarEntregasEmpleado(int id) {
        List<Entrega> entregas = new ArrayList<>();
        String sql = "SELECT * FROM `entrega` WHERE idEmpleado=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Entrega e = new Entrega();
                e.setIdEntrega(rs.getInt("idEntrega"));
                e.setIdPedido(rs.getInt("idPedido"));
                e.setIdEmpleado(rs.getInt("idEmpleado"));
                e.setFecha(rs.getDate("fecha").toLocalDate());
                e.setNumDefectuosas(rs.getInt("defectuosas"));
                e.setComentario(rs.getString("comentario"));
                entregas.add(e);
            }
            return entregas;

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

}

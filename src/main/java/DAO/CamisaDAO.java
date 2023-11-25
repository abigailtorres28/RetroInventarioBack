package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.Camisa;
import config.conexion;
import interfaces.IntCamisa;

public class CamisaDAO implements IntCamisa {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    //// este registra una nueva camisa
    /// Se supone que las camisas se registran en el momento en que en la vista se
    //// ingresa un nuevo pedido
    /// Las camisas inicialmente no tienen un idLote, este se les asignará cuando al
    //// pedido se le asigne un empleado
    /// El idLote se modifica en el metodo update de pedido
    ///// aun no funciona las imagenes
    @Override
    public boolean agregarCamisa(Camisa camisa) {
        String sql = "INSERT INTO camisa_pedido (`tipoEstampado`, `color`, `talla`, `idPedido`) VALUES ('"
                + camisa.getTipoEstampado() + "','" + camisa.getColor()
                + "','" + camisa.getTalla() + "','" + camisa.getIdPedido() + "')";
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

    //// Lista las camisas que pertenecen a un pedido
    //// busca por el idPedido

    @Override
    public void asignarLote(Camisa c) {
        int lote = buscarLoteDisponible(c);
        //System.out.println(lote);
        restarCantidad(lote);
        String sql3 = "UPDATE camisa_pedido SET idLote =" + lote + " WHERE idCamisa = " + c.getId();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql3);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("algo paso en asignar lote");
        }
    }

    /// Buscar Lote
    private int buscarLoteDisponible(Camisa c) {
        String sql = "SELECT idLote, color, talla, cantidad " +
        "FROM camisas " +
        "WHERE LOWER(color) = LOWER('" + c.getColor() + "') " +
        "  AND LOWER(talla) = LOWER('" + c.getTalla() + "') " +
        "  AND cantidad >= 1 " +
        "ORDER BY cantidad ASC " +
        "LIMIT 1;";
        int idLote = 0;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idLote = rs.getInt("idLote");
                //System.out.println(idLote);
            }
        } catch (Exception ex) {
            System.out.println("paso algo en buscarLote");
        }
        return idLote;
    }

    /// Restar la cantidad en el lote
    private void restarCantidad(int idLote) {
        String sql2 = "UPDATE camisas SET cantidad = cantidad - 1 WHERE idLote = " + idLote;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql2);
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("algo paso en restarcantidad");
        }
    }

}

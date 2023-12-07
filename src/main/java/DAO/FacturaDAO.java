package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import Model.Factura;
import Model.Pedido;
import config.conexion;
import interfaces.IntFacura;

public class FacturaDAO implements IntFacura {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    ///Este metodo genera una nueva factura para un pedido. Solo si este pedido ya se encuentra marcado como finalizado
    ///El pedido se marca como finalizado cuando el empledo registra una entrega del pedido
    @Override
    public boolean generarFactura(Factura f) {
        LocalDate fecha = f.getFecha();
        java.sql.Date fechasql2 = java.sql.Date.valueOf(fecha);
        String sql = "insert into factura (`idPedido`, `correoCliente`, `precio` , `nombre`, `cedula` ,`cantidad`, `fecha`) values('"
                + f.getIdPedido() + "','" + f.getCorreo() + "','"
                + f.getPrecio() + "','" + f.getNombre() + "','"  + f.getCedula() + "','" + f.getCantidad() + "','" + fechasql2 + "')";
        System.out.println(sql);
        try {
            int pedido= f.getIdPedido();
            PedidoDAO p = new PedidoDAO();
            Pedido ped =p.buscarPedido(pedido);
            String estado = "finalizado";
            if(Objects.equals(estado, ped.getEstado())){
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;}
            else{
                throw new Exception("el pedido no está finalizado");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    //Este metodo muestra todas las facturas que se han generado
    @Override
    public List<Factura> listarFacturas() {
        List<Factura> facturas = new ArrayList<>();
        String sql = "select * from factura";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Factura f = new Factura();
                f.setId(rs.getInt("idFactura"));
                f.setIdPedido(rs.getInt("idPedido"));
                f.setCorreo(rs.getString("correoCliente"));
                f.setPrecio(rs.getInt("precio"));
                f.setFecha(rs.getDate("fecha").toLocalDate());
                facturas.add(f);
            }
        } catch (Exception e) {
            System.out.println(e.getCause());
        }
        return facturas;
    }

}

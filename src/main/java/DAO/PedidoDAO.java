package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

import Model.Camisa;
import Model.Pedido;
import config.conexion;
import interfaces.IntPedido;

public class PedidoDAO implements IntPedido {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    /// Agrega o registra un nuevo pedido
    //// Al registrar no se da una fecha de entrega ni el id del empleado esta se
    /// agregan en el update
    //// El estado va tener por defecto el valor "pendiente" (no lo maneja el admin
    /// es automatico)
    /// Cuando se le asigna un empleado va tomar el valor de "asignado"
    ///// Cuando se registra la entrega del pedido el estado pasa a "entregado"
    /// --->class entrega
    @Override
    public boolean registrarPedido(Pedido pedido) {
        LocalDate fechaPedido = pedido.getFechaPedido();
        java.sql.Date fechasql2 = java.sql.Date.valueOf(fechaPedido);
        String sql = "INSERT INTO pedido (`cliente`, `cantidad`, `direccion`, `fechaPedido`, `estado`) VALUES ('"
                + pedido.getCliente() + "','" + pedido.getCantidad() + "','" + pedido.getDireccion() + "','" + fechasql2
                + "','" + "pendiente" + "')";
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

    // listar todos los pedidos que han realizado
    @Override
    public List<Pedido> listarPedidos() {
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "select * from pedido";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setId(rs.getInt("idPedido"));
                p.setCliente(rs.getString("cliente"));
                p.setCantidad(rs.getInt("cantidad"));
                p.setDireccion(rs.getString("direccion"));
                p.setFechaPedido(rs.getDate("fechaPedido").toLocalDate());
                if (rs.getString("fechaEntrega") != null) {
                    p.setFechaEntrega(rs.getDate("fechaEntrega").toLocalDate());
                }
                p.setIdEmpleado(rs.getInt("idEmpleado"));
                p.setEstado(rs.getString("estado"));
                pedidos.add(p);
            }
        } catch (Exception e) {
            System.out.println(e.getCause());
        }
        return pedidos;
    }

    @Override
    // ESTE METODO ASIGNA UN EMPLEADO AL PEDIDO (recibo el id del pedido y el id del
    // empleado)
    /// El admin no modifica la fecha de entrega, esta se modifica automaticamente
    // cuando el empleado registra la entrega del pedido
    // puede modificar el estado y el empleado asignado
    /// Cuando se le asigna un empleado al pedido el estado del pedido cambia a
    // "asignado"
    /// Cuando se le asigna un empleado al pedido las camisas que pertenecen al
    // pedido se les asigna un lote
    /// Al lote se le descuentan la cantidad de camisas usadas en el pedido
    /// Si no hay suficientes camisas en los lotes no se puede asignar un empleado
    // al pedido
    ///El estado del empleado debe ser activo para poder asignarsele un pedido, se sugiere en la vista
    ///solo mostrar los empleados que estan activos al momento de seleccionar el empleado
        public void asignarEmpleado(int idPedido, int idEmpleado) {
        try {
            if (consultarDisponibles(idPedido)) {
                /// mando a asignar los lotes a las camisas y a restar del numero en los lotes
                List<Camisa> camisas = listarCamisasPedido(idPedido);
                Iterator<Camisa> iterator = camisas.iterator();
                while (iterator.hasNext()) {
                    Camisa c = iterator.next();
                    CamisaDAO cam = new CamisaDAO();
                    cam.asignarLote(c);
                }
                /// le asigno el empleado al pedido y el estado pasa a "asignado"
                String sql = "UPDATE pedido SET idEmpleado = " + idEmpleado + ", estado ='asignado' WHERE idPedido ="
                        + idPedido;
                con = cn.getConnection();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }

        } catch (Exception ex) {
            System.out.println("hubo algun problema");
            ex.getMessage();
        }

    }

    ////// Este metodo valida que existan en el inventario suficientes camisas para
    ////// el pedido
    ////// Consulta los lotes y returna true si hay camisas disponibles
    ////// Me envía el id del pedido
    private boolean consultarDisponibles(int id) {
        try {
            con = cn.getConnection();
            List<Camisa> camisas = listarCamisasPedido(id);
            Iterator<Camisa> iterator = camisas.iterator();
            while (iterator.hasNext()) {
                Camisa c = iterator.next();
                String sql = "SELECT color, talla, SUM(cantidad) as cantidad FROM camisas WHERE LOWER(color) = LOWER('"
                        + c.getColor() + "') AND LOWER(talla) = LOWER('" + c.getTalla() + "')";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    //System.out.println(rs.getInt("cantidad"));
                    if (rs.getInt("cantidad") <= 0 || rs.getString("color") == null) {
                        System.out.println("no hay camisas");
                        return false;
                    }
                }
            }
        } catch (Exception ex) {
            ex.getMessage();
        }
        return true;

    }

    ////// Lista las camisas que pertencen al pedido
    ////// recibe el id del pedido
    public List<Camisa> listarCamisasPedido(int id) {
        List<Camisa> camisas = new ArrayList<>();
        String sql = "select * from camisa_pedido where idPedido=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Camisa c = new Camisa();
                c.setId(rs.getInt("idCamisa"));
                if (rs.getInt("idLote") != 0) {
                    c.setIdLote(rs.getInt("idLote"));
                }
                c.setTipoEstampado(rs.getString("tipoEstampado"));
                c.setColor(rs.getString("color"));
                c.setTalla(rs.getString("talla"));
                c.setIdPedido(rs.getInt("idPedido"));
                camisas.add(c);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return camisas;
    }

    //// Busca el pedido por el id del pedido
    @Override
    public Pedido buscarPedido(int id) {
        Pedido p = new Pedido();
        String sql = "SELECT * FROM `pedido` WHERE idPedido=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("idPedido"));
                p.setCliente(rs.getString("cliente"));
                p.setCantidad(rs.getInt("cantidad"));
                p.setDireccion(rs.getString("direccion"));
                p.setFechaPedido(rs.getDate("fechaPedido").toLocalDate());
                if (rs.getString("fechaEntrega") != null) {
                    p.setFechaEntrega(rs.getDate("fechaEntrega").toLocalDate());
                }
                p.setIdEmpleado(rs.getInt("idEmpleado"));
                p.setEstado(rs.getString("estado"));
            }
            return p;

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

}

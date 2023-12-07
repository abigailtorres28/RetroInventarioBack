package interfaces;

import java.util.List;

import Model.Pedido;

public interface IntPedido {
    public int registrarPedido(Pedido pedido);
    public List<Pedido> listarPedidos();
    public List<String> pedidos();
    public void asignarEmpleado(int idPedido, int idEmpleado);
    public Pedido buscarPedido(int id);
    
}
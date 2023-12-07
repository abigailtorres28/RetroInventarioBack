package interfaces;

import java.util.List;

import Model.Entrega;

public interface IntEntrega {
    public boolean registrarEntrega(Entrega e);
    public List<Entrega> listarEntregas();
    public List<Entrega> listarDefectuosas();
    public List<Entrega> buscarEntregasEmpleado(int id);
}
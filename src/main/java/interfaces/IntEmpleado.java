package interfaces;

import java.util.List;

import Model.Empleado;
import Model.Pedido;

public interface IntEmpleado{
    public boolean agregarEmpleado (Empleado e);
    public boolean validarUsuario(String correo, String contraseña);
    public List<Empleado> listarEmpleados();
    public Empleado verEmpleado(int id);
    public boolean editarEmpleado(Empleado e);
    public List<Pedido> listarPedidosAsigandos(int id);    
}
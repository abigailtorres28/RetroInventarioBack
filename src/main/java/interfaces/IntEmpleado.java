package interfaces;

import java.util.List;

import Model.Empleado;
import Model.Pedido;

public interface IntEmpleado{
    public boolean agregarEmpleado (Empleado e);
    public int validarUsuario(String correo, String contraseña);
    public List<Empleado> listarEmpleados();
    public List<Empleado> listar();
    public Empleado verEmpleado(int id);
    public boolean editarEmpleado(Empleado e);    
}
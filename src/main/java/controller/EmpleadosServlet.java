package controller;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.time.LocalDate;

import DAO.EmpleadoDAO;
import Model.Empleado;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/administrarEmpleados")
public class EmpleadosServlet extends HttpServlet {

    String empleados = "/JSP/Empleados.jsp";
    String editar = "/JSP/empleados_editar.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("action");
        if ("agregar".equals(action)) {
            String nombre = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String correo = request.getParameter("correo");
            String cedula = request.getParameter("cedula");
            String telefono = request.getParameter("telefono");
            String contraseña = request.getParameter("contraseña");
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));

            Empleado e = new Empleado(cedula, nombre, apellidos, correo, telefono, contraseña, fecha, null);
            EmpleadoDAO em = new EmpleadoDAO();
            em.agregarEmpleado(e);
            request.setAttribute("mensaje", "Se ha agregado un empleado");
            acceso = empleados;
        } else if ("editar".equals(action)) {
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            HttpSession session = request.getSession();
            session.setAttribute("idEmpleado", idEmpleado);
            acceso = editar;
        } else if ("actualizar".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String telefono= request.getParameter("telefono");
            String estado= request.getParameter("estado");
            Empleado e = new Empleado(id, estado, telefono);
            EmpleadoDAO em= new EmpleadoDAO();
            if (em.editarEmpleado(e)){
                acceso= empleados;
            }
            else{
                acceso= editar;
            }
        }

        response.sendRedirect(request.getContextPath() + acceso);
    }
}

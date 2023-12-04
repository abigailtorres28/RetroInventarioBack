package controller;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.time.LocalDate;

import DAO.EmpleadoDAO;
import Model.Empleado;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/administrarEmpleados")
public class EmpleadosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
     RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/Empleados.jsp");
     dispatcher.forward(request, response);

     
     
    }
}

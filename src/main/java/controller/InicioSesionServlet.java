package controller;

import java.io.IOException;
//import java.io.PrintWriter;

import DAO.EmpleadoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/iniciarSesion")
public class InicioSesionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");

        // Lógica para validar el inicio de sesión en la base de datos
        EmpleadoDAO usuarioDAO = new EmpleadoDAO();
        boolean datosValidos = usuarioDAO.validarUsuario(correo, contraseña);

        if (datosValidos) {
            // Si los datos son válidos, redireccionar a empleados.jsp
            response.sendRedirect(request.getContextPath() + "/JSP/Empleados.jsp");
        } else {
            // Si los datos son incorrectos, mostrar un mensaje en index.jsp
            request.setAttribute("mensaje", "Los datos son incorrectos");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}

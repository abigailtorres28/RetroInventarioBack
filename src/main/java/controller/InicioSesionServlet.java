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
import jakarta.servlet.http.HttpSession;

@WebServlet("/iniciarSesion")
public class InicioSesionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");

        // Lógica para validar el inicio de sesión en la base de datos
        EmpleadoDAO usuarioDAO = new EmpleadoDAO();
        int idUsuario = usuarioDAO.validarUsuario(correo, contraseña);

        if (idUsuario > 0) {
            // Si los datos son válidos, redireccionar a empleados.jsp
            if ("admin@gmail.com".equals(correo)) {
                response.sendRedirect(request.getContextPath() + "/JSP/Empleados.jsp");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("idEmpleado", idUsuario);
                response.sendRedirect(request.getContextPath() + "/JSP/empleado_entregas.jsp");
            }

        } else {
            // Si los datos son incorrectos, mostrar un mensaje en index.jsp
            request.setAttribute("mensaje", "Los datos son incorrectos");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}

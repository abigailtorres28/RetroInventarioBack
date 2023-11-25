package controller;

import java.io.IOException;
import java.io.InputStream;
//import java.io.PrintWriter;

import DAO.EmpleadoDAO;
import Model.Empleado;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/uno")
@MultipartConfig
public class controllerEmpleado extends HttpServlet {
     Empleado empleado = new Empleado("32556983", "Neis Abigail", "Torres Escudero", "abit@gmail.com", "3152984658",
            "activo", "admin3", null);
    EmpleadoDAO ED = new EmpleadoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        switch (accion) {
            case "guardar":
                try {
                    Part part = req.getPart("foto");
                    InputStream input = part.getInputStream();
                    empleado.setFoto(input);
                    ED.agregarEmpleado(empleado);
                    String nuevaPagina = "../webapp/index.jsp";
                    req.getRequestDispatcher(nuevaPagina).forward(req, resp);

                } catch (Exception ex) {
                    ex.getMessage();
                    System.out.println("mal wey algo falló como ya sabiamos");
                }
            default:
                break;
        }
    }
}

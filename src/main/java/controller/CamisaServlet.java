package controller;

import DAO.LoteDAO;
import Model.Lote;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/administrarCamisas")
public class CamisaServlet extends HttpServlet {

    String camisas = "/JSP/camisas.jsp";
    String registro = "/JSP/camisas_registro.jsp";
    String inventario = "/JSP/camisas_inventario.jsp";
    String informe = "/JSP/camisas_defectuosas.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("action");

        if ("ingresarLote".equals(action)) {
            acceso = registro;
        } else if ("registrarIngreso".equals(action)) {
            System.out.println(request.getParameter("fecha"));
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
            int precio = Integer.parseInt(request.getParameter("precio"));
            String talla = request.getParameter("talla");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String color = request.getParameter("color");

            Lote l = new Lote(fecha, color, talla, cantidad, precio);
            LoteDAO ld = new LoteDAO();
            if (ld.ingresar(l)) {
                acceso = camisas;
            } else {
                acceso = registro;
            }

        } else if ("informe".equals(action)) {
            acceso = informe;
        } else if ("inventario".equals(action)) {
            acceso = inventario;
        } else if ("inventarioDisponible".equals(action)) {
            String color = request.getParameter("color");
            System.out.println(color);
            String talla = request.getParameter("talla");
            System.out.println(talla);
            LoteDAO l = new LoteDAO();
            int cantidad = l.buscarInventario(color, talla);
            request.getSession().setAttribute("cantidad", cantidad);
            acceso = inventario;
        }
        response.sendRedirect(request.getContextPath() + acceso);
    }
}

package controller;

import DAO.EntregaDAO;
import Model.Entrega;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/entregas")
public class EntregasServlet extends HttpServlet {

    String entregas = "JSP/empleado_entregas.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("action");
        if ("agregarEntrega".equals(action)) {
            int idPedido = Integer.parseInt(request.getParameter("pedido"));
            int idEmpleado = Integer.parseInt(request.getParameter("empleado"));
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
            int defectuosas = Integer.parseInt(request.getParameter("defectuosas"));
            String comentario = request.getParameter("comentario");
            
            Entrega n = new Entrega(idPedido, idEmpleado, fecha, defectuosas, comentario);
            EntregaDAO ed = new EntregaDAO();
            ed.registrarEntrega(n);
            acceso= entregas;

        }
        response.sendRedirect(request.getContextPath() + acceso);
    }
}

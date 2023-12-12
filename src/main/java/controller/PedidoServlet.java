package controller;

import DAO.CamisaDAO;
import DAO.PedidoDAO;
import Model.Camisa;
import Model.Pedido;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/administrarPedidos")
public class PedidoServlet extends HttpServlet {

    String pedidos = "/JSP/pedidos.jsp";
    String agregar = "/JSP/pedidos_agregar.jsp";
    String asignar = "/JSP/pedido_asignar.jsp";
    String ver = "/JSP/pedido_info.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("action");
        if ("ingresarPedido".equals(action)) {
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
            String cliente = request.getParameter("cliente");
            String direccion = request.getParameter("direccion");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            Pedido p = new Pedido(cliente, cantidad, direccion, fecha);
            PedidoDAO pd = new PedidoDAO();
            int idPedido = pd.registrarPedido(p);

            for (int i = 1; i <= cantidad; i++) {
                String color = request.getParameter("color" + i);
                String talla = request.getParameter("talla" + i);
                String tipoEstampado = request.getParameter("estampado" + i);

                Camisa c = new Camisa(idPedido, talla, color, tipoEstampado);
                CamisaDAO cd = new CamisaDAO();
                cd.agregarCamisa(c);
            }
            acceso = pedidos;
        } else if ("asignar".equals(action)) {
            int idPedido= Integer.parseInt(request.getParameter("idPedido"));
            HttpSession session = request.getSession();
            session.setAttribute("idPedido", idPedido);
            acceso = asignar;
        }else if("asignarEmpleado".equals(action)){
            int idEmpleado = Integer.parseInt(request.getParameter("empleado"));
            int idPedido = Integer.parseInt(request.getParameter("idPedido"));
            PedidoDAO pd = new PedidoDAO();
            pd.asignarEmpleado(idPedido, idEmpleado);
            acceso = pedidos; 
        }else if("verPedido".equals(action)){
            int idPedido= Integer.parseInt(request.getParameter("idPedido"));
            HttpSession session = request.getSession();
            session.setAttribute("idPedido", idPedido);
            acceso = ver;
        }
        response.sendRedirect(request.getContextPath() + acceso);
    }

}

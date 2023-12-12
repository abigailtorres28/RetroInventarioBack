<%@page import="DAO.PedidoDAO"%>
<%@page import="Model.Pedido"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../JSP/CSS/output.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
        <title>Pedidos</title>
    </head>
    <body>
        <div class="flex h-screen w-screen font-sans">
            <div class="bg-black w-[20%]">
                <img class="w-[300px] p-5" src="assets/Logo-Retro-Shirt.jpg" alt="logo">
                <div class="w-full">
                    <ul class="text-white font-semibold">
                        <a href="Empleados.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 hover:bg-gray-900 transition-all ease-in-out">Empleados</li>
                            </ul>
                        </a>
                        <a href="camisas.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 hover:bg-gray-900 transition-all ease-in-out">Camisas</li>
                            </ul>
                        </a>
                        <a href="pedidos.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 hover:bg-gray-900 transition-all ease-in-out">Pedidos</li>
                            </ul>
                        </a>
                        <a href="informes.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 hover:bg-gray-900 transition-all ease-in-out">Informes</li>
                            </ul>
                        </a>
                        <a href="facturas.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 hover:bg-gray-900 transition-all ease-in-out">Facturas</li>
                            </ul>
                        </a>
                        <a href="../index.jsp">
                            <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                                <img src="assets/salir.png" alt="Logout" width="20" height="20"> 
                            </li>
                        </a>
                    </ul>
                </div>
            </div>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white relative">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold">Pedidos</p>
                    <form action="pedidos_agregar.jsp" method="get">
                        <button class="absolute bg-gray-500 font-semibold text-white p-2 px-8 right-2 mt-2 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Nuevo</button>
                    </form>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-10 ml-10" style="table-layout: fixed; width: 100%;">
                    <table class="mt-10 ml-10 shadow-xl">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-8 py-4">Fecha</th>
                                <th class="px-8 py-4">Cliente</th>
                                <th class="px-8 py-4">Cantidad</th>
                                <th class="px-8 py-4">Estado</th>
                                <th class="px-8 py-4">Empleado</th>
                                <th class="px-8 py-4">Opciones</th>
                            </tr>
                        </thead>
                        <% 
                                   PedidoDAO pd = new PedidoDAO();
                                    List<Pedido> list = pd.listarPedidos();
                                    Iterator<Pedido> iter = list.iterator();
                                    Pedido p = null;
                                    while (iter.hasNext()) {
                                        p = iter.next();
                        %>
                        <tbody>
                            <tr class="bg-white border-b text-center">
                                <td class="px-8 py-4" ><%= p.getFechaPedido() %></td>
                                <td class="px-8 py-4" ><%= p.getCliente()%></td>
                                <td class="px-8 py-4" ><%= p.getCantidad()%></td>
                                <td class="px-8 py-4" ><%= p.getEstado()%></td>
                                <td class="px-8 py-4" ><%= p.getIdEmpleado()%></td>
                                <td class="px-6 py-4">
                                    <div class="flex gap-4">
                                        <form action="../administrarPedidos" method="post">
                                            <input type="hidden" name="idPedido" value= "<%= p.getId()%>">
                                            <button type="submit" name="action" value="verPedido" >
                                                <img class="w-[20px]" src="assets/eye.svg" alt="eye">
                                            </button>
                                            <% if ("pendiente".equals(p.getEstado())) { %>
                                            <button type="submit" name="action" value="asignar" >
                                                <img class="w-[20px]" src="assets/userPlus.svg" alt="pencil">
                                            </button>
                                            <% }%>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
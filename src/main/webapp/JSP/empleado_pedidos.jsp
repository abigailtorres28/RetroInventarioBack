<%@page import="DAO.PedidoDAO"%>
<%@page import="Model.Pedido"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Pedidos</title>
    </head>
    <body>
        <div class="flex h-screen w-screen font-sans">
            <div class="bg-black w-[20%]">
                <img class="w-[300px] p-5" src="assets/Logo-Retro-Shirt.jpg" alt="logo">
                <div class="w-full">
                    <ul class="text-white font-semibold">
                        <a href="empleado_entregas.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">Entregas</li>
                            </ul>
                        </a>
                        <a href="empleado_camisas.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">Camisas</li>
                            </ul>
                        </a>
                        <a href="empleado_pedidos.jsp">
                            <ul class="text-white font-semibold">
                                <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">Pedidos</li>
                            </ul>
                        </a>
                        <a href="../index.jsp">
                            <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                                <img src="assets/salir.png" alt="Logout" width="20" height="20"> 
                            </li>
                        </a>
                    </ul>
                </div>
                <form action="../index.jsp" method="get">
                    <button type="submit">Salir</button>
                </form>
            </div>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col ">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold">Pedidos</p>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-10 ml-10">
                    <table class="mt-10 ml-10 shadow-xl" style="table-layout: fixed; width: 100%;">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-8 py-4">Fecha</th>
                                <th class="px-8 py-4">Cliente</th>
                                <th class="px-8 py-4">Cantidad</th>
                                <th class="px-8 py-4">Estado</th>

                            </tr>
                        </thead>
                        <% 
                                    int idEmpleado = (Integer)session.getAttribute("idEmpleado");
                                    PedidoDAO pd = new PedidoDAO();
                                    List<Pedido> list = pd.listarPedidosAsigandos(idEmpleado);
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
                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

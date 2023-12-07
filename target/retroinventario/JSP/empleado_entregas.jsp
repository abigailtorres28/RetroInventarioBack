<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.EntregaDAO"%>
<%@page import="Model.Entrega"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Entregas</title>
    </head>
    <body>
        <div class="flex h-screen w-screen font-sans">
            <div class="bg-black w-[20%]">
                <img class="w-[300px] p-5" src="assets/Logo-Retro-Shirt.jpg" alt="logo">
                <div class="w-full">
                    <ul class="text-white font-semibold">
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="empleado_entregas.jsp">Entregas</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out" href="camisas.jsp">
                            <a href="empleado_camisas.jsp">Camisas</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="empleado_pedidos.jsp">Pedidos</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col ">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold text-slate-800 mb-5">Entregas</p>
                    <div class="flex gap-5">
                        <form action="empleado_Entregar.jsp" method="get">
                            <button type="submit"  class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                                Añadir
                            </button>
                        </form>
                    </div>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-10 ml-10">
                    <table class="mt-10 shadow-xl">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-6 py-2">ID Pedido</th>
                                <th class="px-6 py-2">Fecha Entrega</th>
                                <th class="px-6 py-2">N° Defectuosas</th>
                                <th class="px-6 py-2">Comentario</th>
                            </tr>
                        </thead>
                        <% 
                                EntregaDAO em = new EntregaDAO();
                                List<Entrega> list = em.listarEntregas();
                                Iterator<Entrega> iter = list.iterator();
                                Entrega e = null;
                                while (iter.hasNext()) {
                                    e = iter.next();
                        %>
                        <tbody>
                            <tr class="bg-white text-blacks text-sm">
                                <td class="px-6 py-2" ><%= e.getIdPedido() %></td>
                                <td class="px-6 py-2" ><%= e. getFecha() %></td>
                                <td class="px-6 py-2" ><%= e.getNumDefectuosas() %></td>
                                <td class="px-6 py-2" ><%= e.getComentario() %></td>
                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

<%@page import="DAO.EntregaDAO"%>
<%@page import="Model.Entrega"%>
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
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Camisas Defectuosas</title>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold">Camisas Dañadas</p>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-5 ml-10 w-full">
                    <table  class="mt-10 ml-10 shadow-xl" style="table-layout: fixed; width: 100%;">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-8 py-4">Pedido</th>
                                <th class="px-8 py-4">Cantidad</th>
                                <th class="px-8 py-4">Comentario</th>
                            </tr>
                        </thead>
                        <% 
                               EntregaDAO en = new EntregaDAO();
                               List<Entrega> list = en.listarDefectuosas();
                               Iterator<Entrega> iter = list.iterator();
                               Entrega e = null;
                               while (iter.hasNext()) {
                                   e = iter.next();
                        %>
                        <tbody>
                            <tr  class="bg-white border-b text-center">
                                <td class="px-8 py-4" ><%= e.getIdPedido()%></td>
                                <td class="px-8 py-4" ><%= e.getNumDefectuosas()%></td>
                                <td class="px-8 py-4" ><%= e.getComentario()%></td>
                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                </div>
            </div>
    </body>

</html>
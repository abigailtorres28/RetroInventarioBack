<%@page import="DAO.LoteDAO"%>
<%@page import="Model.Lote"%>
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
        <title>Camisas</title>
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
                    <p class="text-4xl font-bold">Camisas</p>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-5 ml-10">
                    <table class="mt-10 ml-10 shadow-xl">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-8 py-4">Fecha</th>
                                <th class="px-8 py-4">Cantidad</th>
                                <th class="px-8 py-4">Precio</th>
                                <th class="px-8 py-4">Color</th>
                                <th class="px-8 py-4">Identificador</th>
                                <th class="px-8 py-4">Tallas</th>
                            </tr>
                        </thead>
                        <% 
                                    LoteDAO ld = new LoteDAO();
                                    List<Lote> list = ld.listarIngresos();
                                    Iterator<Lote> iter = list.iterator();
                                    Lote l = null;
                                    while (iter.hasNext()) {
                                        l = iter.next();
                        %>
                        <tbody>
                            <tr class="bg-white border-b">
                                <th scope="row" class="px-8 py-4 font-medium text-gray-900 whitespace-nowrap"> <%= l.getFechaEntrada()%> </th>
                                <td class="px-8 py-4"> <%= l.getCantidad()%></td>
                                <td class="px-8 py-4"> <%= l.getPrecio()%></td>
                                <td class="px-8 py-4"> <%= l.getColor()%></td>
                                <td class="px-8 py-4"> <%= l.getId()%></td>
                                <td class="px-8 py-4"> <%= l.getTalla()%></td>
                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

<%@page import="DAO.LoteDAO"%>
<%@page import="Model.Lote"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../JSP/CSS/output.css" />
        <title>Camisas</title>
    </head>
    <body>
        <div class="flex h-screen w-screen font-sans">
            <div class="bg-black w-[20%]">
                <img class="w-[300px] p-5" src="assets/Logo-Retro-Shirt.jpg" alt="logo">
                <div class="w-full">
                    <ul class="text-white font-semibold">
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="Empleados.jsp">Empleados</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="camisas.jsp">Camisas</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="pedidos.jsp">Pedidos</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="informes.jsp">Informes</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="facturas.jsp">Facturas</a>
                        </li>
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out">
                            <a href="#">Historial</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold">Camisas</p>
                    <div class="flex gap-5">
                        <img class="w-[50px]" src="assets/userConfig.svg" alt="usersLogo">
                        <form action="../administrarCamisas" method="post">
                            <button type="submit" name="action" value="informe" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Informe</button>
                            <button type="submit" name="action" value="inventario" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Inventario</button>
                            <button type="submit" name="action" value="ingresarLote" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Ingreso</button>
                        </form>
                    </div>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-5 ml-10 w-full">
                    <table class="mt-10 ml-10 shadow-xl">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-8 py-4">Fecha</th>
                                <th class="px-8 py-4">Cantidad</th>
                                <th class="px-8 py-4">Precio</th>
                                <th class="px-8 py-4">Color</th>
                                <th class="px-8 py-4">Identificador</th>
                                <th class="px-8 py-4">Tallas</th>
                                <th class="px-8 py-4">Opciones</th>
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
                                <td class="px-8 py-4">
                                    <div class="flex justify-center items-center">
                                        <button>
                                            <img class="w-[20px]" src="assets/eye.svg" alt="eye">
                                        </button>
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
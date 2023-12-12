<%@page import="DAO.EmpleadoDAO"%>
<%@page import="Model.Empleado"%>
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
        <title>Empleados</title>
    </head>
    <style>
        /* Estilo para hacer los enlaces de ancho y alto completos */
        ul.text-white.font-semibold li {
            width: 100%;
        }
    </style>
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
                    <p class="text-4xl font-bold">Empleados</p>
                    <div class="flex gap-5">
                        <img class="w-[50px]" src="assets/users.svg" alt="usersLogo">
                        <form action="empleados_agregar.jsp" method="get">
                            <button type="submit"  class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                                Añadir
                            </button>
                        </form>
                    </div>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-5 ml-10 w-full">
                    <table class="mt-10 shadow-xl" style="table-layout: fixed; width: 100%;">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-6 py-2">ID</th>
                                <th class="px-6 py-2">Nombre</th>
                                <th class="px-6 py-2">Cédula</th>
                                <th class="px-6 py-2">Teléfono</th>
                                <th class="px-6 py-2">Correo</th>
                                <th class="px-6 py-2">Estado</th>
                                <th class="px-6 py-2">Opciones</th>
                            </tr>
                        </thead>
                        <% 
                                EmpleadoDAO em = new EmpleadoDAO();
                                List<Empleado> list = em.listarEmpleados();
                                Iterator<Empleado> iter = list.iterator();
                                Empleado e = null;
                                while (iter.hasNext()) {
                                    e = iter.next();
                        %>
                        <tbody>
                            <tr class="bg-white text-blacks text-sm">
                                <td class="px-6 py-2" ><%= e.getId_empleado() %></td>
                                <td class="px-6 py-2" ><%= e.getNombres() %></td>
                                <td class="px-6 py-2" ><%= e.getCedula() %></td>
                                <td class="px-6 py-2" ><%= e.getTelefono() %></td>
                                <td class="px-0 py-2" ><%= e.getCorreo() %></td>
                                <td class="px-6 py-2" ><%= e.getEstado() %></td>
                                <td class="px-6 py-4">
                                    <div class="flex gap-4">
                                        <form action="../administrarEmpleados" method="post">
                                            <input type="hidden" name="idEmpleado" value= "<%= e.getId_empleado() %>">
                                            <button type="submit" name="action" value="editar">
                                                <img class="w-[20px]" src="assets/pencil.svg" alt="pencil">
                                            </button>
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
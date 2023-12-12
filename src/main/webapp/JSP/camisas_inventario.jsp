<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="DAO.LoteDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="../images/logoR.png" rel="icon"> 
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Invetario Camisas</title>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center relative">
                <p class="absolute text-4xl font-bold text-slate-800 mb-5 left-10 top-10 ">Inventario</p>
                <img class="absolute w-[50px] right-2 top-10" src="assets/userConfig.svg" alt="usersLogo">
                <div class="p-5 rounded-2xl flex flex-col gap-3">
                    <div>
                        <p class="font-bold text-3xl text-slate-800 mb-3">Disponibles</p>
                        <form action="../administrarCamisas" method="post">
                            <div class="ml-5 flex gap-20">
                                <div class="flex flex-col justify-center">
                                    <div class="flex items-center gap-3">
                                        <p class="text-2xl font-semibold">Color:</p>
                                        <div class="flex gap-2">
                                            <select class="form-select py-1 px-2 rounded-lg font-semibold" name="color">
                                                <%
                                                    LoteDAO dao = new LoteDAO();
                                                    List<String> list = dao.colores();
                                                    Iterator<String> iter = list.iterator();
                                                    String color = "";
                                                    while (iter.hasNext()) {
                                                        color = iter.next();
                                                %>
                                                <option value="<%=color%>"><%=color%></option>

                                                <%}%>     
                                            </select>
                                        </div>
                                    </div>
                                    <div class="flex items-center gap-3">
                                        <p class="text-2xl font-semibold">Talla:</p>
                                        <div class="flex gap-2">
                                            <select class="form-select py-1 px-2 rounded-lg font-semibold" name="talla">
                                                <%
                                                    LoteDAO daoT = new LoteDAO();
                                                    List<String> lista = daoT.tallas();
                                                    Iterator<String> iterador = lista.iterator();
                                                    String talla = "";
                                                    while (iterador.hasNext()) {
                                                       talla = iterador.next();
                                                %>
                                                <option value="<%=talla%>"><%=talla%></option>

                                                <%}%>     
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="w-28 h-20 bg-white flex justify-center items-center shadow-lg ml-12">
                                        <label name="cantidad"><%= session.getAttribute("cantidad") %></label>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" name="action" value="inventarioDisponible" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Buscar</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
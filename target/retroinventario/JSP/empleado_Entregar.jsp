<%@page import="DAO.PedidoDAO"%>
<%@page import="Model.Pedido"%>
<%@page import="DAO.EmpleadoDAO"%>
<%@page import="Model.Empleado"%>
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
        <title>Entregar</title>
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
            </div>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col ">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold text-slate-800 mb-5">Entregar Pedido</p>
                </div>
                <div class="max-h-[200px] overflow-scroll mt-5 ml-10 ">
                    <form action="../entregas"  method="post">
                        <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="nombre">Id Pedido</label>
                                    <select class="form-select py-1 px-2 rounded-lg font-semibold" name="pedido" id="pedido">
                                        <%
                                            int idEmpleado = (Integer)session.getAttribute("idEmpleado");
                                            PedidoDAO daop = new PedidoDAO();
                                            List<Pedido> lista = daop.listarPedidosAsigandos(idEmpleado);
                                            Iterator<Pedido> itera = lista.iterator();
                                            Pedido pedido = null;
                                            while (itera.hasNext()) {
                                                pedido = itera.next();
                                        %>
                                        <option value="<%=pedido.getId()%>"><%=pedido.getId()%></option>

                                        <%}%>     
                                    </select>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="correo">Id Empleado</label>
                                    <select class="form-select py-1 px-2 rounded-lg font-semibold" name="empleado" id="empleado">
                                        <%
                                            EmpleadoDAO dao = new EmpleadoDAO();
                                            Empleado e = dao.verEmpleado(idEmpleado);
                                        %>
                                        <option value="<%=e.getId_empleado()%>"><%=e.getNombres()%></option>
                                    </select>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="cedula">Fecha</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha">
                                </div>

                            </div>
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="Precio">N° Defectuosas</label>
                                    <input  class="py-1 px-2 rounded-lg font-semibold" type="number" name="defectuosas" id="defectuosas">
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="id">Comentario</label>
                                    <textarea class="py-1 px-2 rounded-lg font-semibold" name="comentario"id="comentario"></textarea>
                                </div>
                                <div class="flex flex-col mt-5">
                                    <button type="submit" name="action" value="agregarEntrega" class="bg-slate-700 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-slate-700 hover:bg-slate-900 transition ease-in-out">
                                        Entregar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

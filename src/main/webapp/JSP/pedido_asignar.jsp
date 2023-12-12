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
        <title>Asignar</title>
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
            <%  
            int idPedido = (Integer)session.getAttribute("idPedido");
            PedidoDAO daoP = new PedidoDAO();
            Pedido p = daoP.buscarPedido(idPedido);
            %>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold text-slate-800 mb-5">Asignar Empleado</p>
                </div>
                <div class="max-h-[200px] overflow-scroll mt-5 ml-10 ">
                    <form action="../administrarPedidos" method="post">
                        <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                            <button class="absolute text-slate-900 font-bold right-5 top-5 text-xl"><img src="assets/arrowLeft.svg" alt="left"></button>
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="fecha">Identificador</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="idPedido" id="idPedido" value="<%=p.getId()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="fecha">Fecha</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha" value="<%=p.getFechaPedido()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="precio">Dirección</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="direccion" id="direccion" value="<%=p.getDireccion()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="precio">Estado</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="direccion" id="direccion" value="<%=p.getEstado()%>" readonly>
                                </div>
                            </div>
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="cliente">Cliente</label>
                                    <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="cliente" id="cliente" value="<%=p.getCliente()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="cantidad">Cantidad</label>
                                    <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="cantidad" id="cantidad" value="<%=p.getCantidad()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="cantidad">Empleado</label>
                                    <select class="form-select py-1 px-2 rounded-lg font-semibold" name="empleado">
                                        <%
                                            EmpleadoDAO dao = new EmpleadoDAO();
                                            List<Empleado> list = dao.listar();
                                            Iterator<Empleado> iter = list.iterator();
                                            Empleado empleado = null;
                                            iter.next();
                                            while (iter.hasNext()) {
                                                empleado = iter.next();
                                        %>
                                        <option value="<%=empleado.getId_empleado()%>"><%=empleado.getNombres()%></option>

                                        <%}%>     
                                    </select>
                                </div>
                                <button type="submit"  name="action" value="asignarEmpleado" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                                    Asignar
                                </button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

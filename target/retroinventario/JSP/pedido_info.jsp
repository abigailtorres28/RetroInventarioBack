<%@page import="DAO.PedidoDAO"%>
<%@page import="Model.Pedido"%>
<%@page import="DAO.EmpleadoDAO"%>
<%@page import="Model.Empleado"%>
<%@page import="DAO.CamisaDAO"%>
<%@page import="Model.Camisa"%>
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
        <title>Información Pedido</title>
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
                        <li class="py-3 pl-10 cursor-pointer hover:bg-gray-900 transition-all ease-in-out" href="camisas.jsp">
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
            <%  
            int idPedido = (Integer)session.getAttribute("idPedido");
            PedidoDAO daoP = new PedidoDAO();
            Pedido p = daoP.buscarPedido(idPedido);
            %>
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold text-slate-800 mb-5">Información Pedido</p>
                </div>
                <div class="max-h-[200px] overflow-scroll mt-5 ml-10 ">
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
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="cantidad" id="cantidad" value="<%=p.getIdEmpleado()%>" readonly>
                            </div>
                        </div>
                    </div>
                     <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold text-slate-400 mb-5">Camisas</p>
                     </div>
                    <%
                        PedidoDAO em = new PedidoDAO();
                        List<Camisa> camisas = em.listarCamisasPedido(p.getId());
                        for (Camisa c : camisas) {
                    %>
                    <div id="camisas">
                        <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="color1">ID Camisa</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="idCamisa" name="idCamisa" value="<%=c.getId()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="color1">Color</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="color1" name="color1" value="<%=c.getColor()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="color1">Talla</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="talla1" name="talla1" value="<%=c.getTalla()%>" readonly>
                                </div>
                            </div>
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="color1">Tipo de Estampado</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="estampado1" name="estampado1" value="<%=c.getTipoEstampado()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="color1">ID Pedido</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="idPedido" name="idPedido" value="<%=c.getIdPedido()%>" readonly>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="color1">ID Lote</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" id=idLote" name="idLote" value="<%=c.getIdLote()%>" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>

<%@page import="DAO.EmpleadoDAO"%>
<%@page import="Model.Empleado"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link href="../images/logoR.png" rel="icon">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href= "CSS/output.css" />
        <title>Editar Empleados</title>
    </head>
    <body>
        <%  
           int idEmpleado = (Integer)session.getAttribute("idEmpleado");
           EmpleadoDAO dao = new EmpleadoDAO();
           Empleado e= dao.verEmpleado(idEmpleado);
        %>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center">
                <p class="text-4xl font-bold text-slate-800 mb-5">Editar Empleado</p>
                <button class="absolute text-slate-900 font-bold right-5 top-5 text-xl"><img src="assets/arrowLeft.svg" alt="left"></button>
                <form action="../administrarEmpleados"  method="post">
                    <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                        <div class="flex flex-col gap-5 w-[50%]">
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="nombre">ID</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="number" name="id" id="id" value="<%=e.getId_empleado()%>" readonly>
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="nombre">Nombre</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="nombre" id="nombre" value="<%=e.getNombres()%>" disabled>
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="correo">Correo</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="correo" id="correo" value="<%=e.getCorreo()%>" disabled="">
                            </div>
                            <div class="flex justify-center items-center">
                                <img src="assets/image.svg" alt="Image" class="p-[55px] rounded-[50%] bg-white">
                            </div>
                        </div>
                        <div class="flex flex-col gap-5 w-[50%]">
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="cedula">Cédula</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="cedula" id="cedula" value="<%=e.getCedula()%>" disabled>
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="telefono">Teléfono</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="telefono" id="telefono" value="<%=e.getTelefono()%>" >
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="estado">Estado</label>
                                <select class="form-select py-1 px-2 rounded-lg font-semibold" name="estado" id="estado" value="<%=e.getEstado()%>">
                                    <option value="activo">Activo</option>
                                    <option value="inactivo">Inactivo</option>
                                </select>
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="fecha">Fecha de Ingreso</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha" value="<%=e.getFechaIngreso()%>" disabled>

                            </div>
                            <div class="flex flex-col">  
                                <button type="submit"  name="action" value="actualizar" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                                    Actualizar
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
    </body>
</html>

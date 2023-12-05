<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../JSP/CSS/output.css" />
        <title>Agregar Empleados</title>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center">
                <p class="text-4xl font-bold text-slate-800 mb-5">Agregar Empleado</p>
                <button class="absolute text-slate-900 font-bold right-5 top-5 text-xl"><img src="assets/arrowLeft.svg" alt="left"></button> 
                <form action="../administrarEmpleados"  method="post">
                    <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                        <div class="flex flex-col gap-5 w-[50%]">
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="nombre">Nombres</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="nombres" id="nombre">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="nombre">Apellidos</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="apellidos" id="apellidos">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="correo">Correo</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="correo" id="correo">
                            </div>
                            <div class="flex justify-center items-center">
                                <img src="assets/image.svg" alt="Image" class="p-[55px] rounded-[50%] bg-white">
                            </div>
                        </div>
                        <div class="flex flex-col gap-5 w-[50%]">
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="cedula">Cédula</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="cedula" id="cedula">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="telefono">Teléfono</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="telefono" id="telefono">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="telefono">Contraseña</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="contraseña" id="contraseña">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="fecha">Fecha de Ingreso</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha">
                            </div>
                        </div>
                        <div class="mt-5">
                            <button type="submit"  name="action" value="agregar" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                                Guardar
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
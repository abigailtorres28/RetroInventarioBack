<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../JSP/CSS/output.css" />
        <title>Facturas</title>
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
                <p class="text-4xl font-bold text-slate-800 mb-5">Nueva Factura</p>
                <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                    <button class="absolute text-slate-900 font-bold right-5 top-5 text-xl"><img src="assets/arrowLeft.svg" alt="left"></button>
                    <div class="flex flex-col gap-5 w-[50%]">
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="nombre">Nombre</label>
                            <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="nombre" id="nombre">
                        </div>
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="correo">Correo</label>
                            <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="correo" id="correo">
                        </div>
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="cedula">Cedula</label>
                            <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="cedula" id="cedula">
                        </div>
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="Precio">Precio</label>
                            <input  class="py-1 px-2 rounded-lg font-semibold" type="number" name="Precio" id="Precio">
                        </div>
                    </div>
                    <div class="flex flex-col gap-5 w-[50%]">
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="id">ID</label>
                            <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="id" id="id">
                        </div>
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="cantidad">Cantidad</label>
                            <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="cantidad" id="cantidad">
                        </div>
                        <div class="flex flex-col">
                            <label class="text-white font-semibold" for="fecha">Fecha</label>
                            <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha">
                        </div>
                        <div class="flex flex-col mt-5">
                            <button class="bg-slate-700 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-slate-700 hover:bg-slate-900 transition ease-in-out">
                                Generar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
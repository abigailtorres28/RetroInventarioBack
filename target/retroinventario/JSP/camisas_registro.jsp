<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Registro Camisas</title>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center">
                <p class="text-4xl font-bold text-slate-800 mb-5">Registrar Ingreso de Camisas</p>
                <form action="../administrarCamisas" method="post">
                    <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                        <button class="absolute text-slate-900 font-bold right-5 top-5 text-xl"><img src="assets/arrowLeft.svg" alt="left"></button>
                        <div class="flex flex-col gap-5 w-[50%]">
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="fecha">Fecha Ingreso</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="precio">Precio</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="number" name="precio" id="precio">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="talla">Talla</label>
                                <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="talla" id="talla">
                            </div>
                        </div>
                        <div class="flex flex-col gap-5 w-[50%]">
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="cantidad">Cantidad</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="number" name="cantidad" id="cantidad">
                            </div>
                            <div class="flex flex-col">
                                <label class="text-white font-semibold" for="color">Color</label>
                                <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="color" id="color">
                            </div>
                            <div class="flex flex-col mt-5">

                                <button type="submit" name="action" value="registrarIngreso" class="bg-slate-700 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-slate-700 hover:bg-slate-900 transition ease-in-out">
                                    Registrar
                                </button>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
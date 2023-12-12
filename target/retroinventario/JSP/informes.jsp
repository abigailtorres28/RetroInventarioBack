<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../JSP/CSS/output.css" />
        <title>Informes</title>
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
                <p class="absolute text-4xl font-bold text-slate-800 mb-5 left-10 top-10 ">Informes</p>
                <img class="absolute w-[50px] right-2 top-10" src="assets/userConfig.svg" alt="usersLogo">
                <div class="p-5 rounded-2xl flex flex-col gap-3">
                    <div>
                        <p class="font-bold text-3xl text-slate-800 mb-3">Informe de Camisas</p>
                        <div class="ml-5 flex gap-20">
                            <div class="flex flex-col justify-center">
                                <div class="flex items-center gap-3">
                                    <button class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Generar</button>
                                </div>
                            </div>
                            <div>
                                <img class="w-28" src="assets/t-shirt.png" alt="t-shirt">
                            </div>
                        </div>
                    </div>
                    <div>
                        <p class="font-bold text-3xl text-slate-800 mb-3">Informe de Ventas</p>
                        <div class="ml-5 flex gap-20">
                            <div class="flex flex-col justify-center">
                                <div class="flex items-center gap-3">
                                    <button class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">Generar</button>
                                </div>
                            </div>
                            <div>
                                <img class="w-28" src="assets/finance.png" alt="finance">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
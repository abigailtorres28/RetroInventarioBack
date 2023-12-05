<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white flex flex-col justify-center items-center relative">
                <p class="absolute text-4xl font-bold text-slate-800 mb-5 left-10 top-10 ">Inventario</p>
                <img class="absolute w-[50px] right-2 top-10" src="assets/userConfig.svg" alt="usersLogo">
                <div class="p-5 rounded-2xl flex flex-col gap-3">
                    <div>
                        <p class="font-bold text-3xl text-slate-800 mb-3">Disponibles</p>
                        <div class="ml-5 flex gap-20">
                            <div class="flex flex-col justify-center">
                                <div class="flex items-center gap-3">
                                    <p class="text-2xl font-semibold">Color:</p>
                                    <div class="flex gap-2">
                                        <div class="w-5 h-5 bg-red-600 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-blue-500 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-green-500 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-pink-400 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-black rounded-[50%]"></div>
                                    </div>
                                </div>
                                <div class="flex items-center gap-3">
                                    <p class="text-2xl font-semibold">Talla:</p>
                                    <div class="flex gap-2">
                                        <div class="w-8 h-5 bg-indigo-700 text-white text-center font-semibold">S</div>
                                        <div class="w-8 h-5 bg-orange-300 text-white text-center font-semibold">M</div>
                                        <div class="w-8 h-5 bg-cyan-600 text-white text-center font-semibold">L</div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="w-28 h-20 bg-white flex justify-center items-center shadow-lg ml-12">?</div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <p class="font-bold text-3xl text-slate-800 mb-3">Estampadas</p>
                        <div class="ml-5 flex gap-20">
                            <div class="flex flex-col justify-center">
                                <div class="flex items-center gap-3">
                                    <p class="text-2xl font-semibold">Color:</p>
                                    <div class="flex gap-2">
                                        <div class="w-5 h-5 bg-red-600 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-blue-500 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-green-500 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-pink-400 rounded-[50%]"></div>
                                        <div class="w-5 h-5 bg-black rounded-[50%]"></div>
                                    </div>
                                </div>
                                <div class="flex items-center gap-3">
                                    <p class="text-2xl font-semibold">Talla:</p>
                                    <div class="flex gap-2">
                                        <div class="w-8 h-5 bg-indigo-700 text-white text-center font-semibold">S</div>
                                        <div class="w-8 h-5 bg-orange-300 text-white text-center font-semibold">M</div>
                                        <div class="w-8 h-5 bg-cyan-600 text-white text-center font-semibold">L</div>
                                    </div>
                                </div>
                                <div class="flex gap-3">
                                    <p class="text-2xl font-semibold">Tipo de Estampado</p>
                                    <button>
                                        <img src="assets/arrowRight.svg" alt="arrowRight" class="bg-white px-5 py-1 rounded-lg">
                                    </button>
                                </div>
                            </div>
                            <div>
                                <div class="w-28 h-20 bg-white flex justify-center items-center shadow-lg">?</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
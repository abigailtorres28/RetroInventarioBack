<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="../images/logoR.png" rel="icon"> 
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Camisas Defectuosas</title>
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
            <div class="w-[70%] bg-gradient-to-r from-slate-400 to-white">
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold">Informe de Camisas DaÃ±adas</p>
                    <div class="flex gap-5">
                        <img class="w-[50px]" src="assets/userConfig.svg" alt="usersLogo">
                    </div>
                </div>
                <div class="max-h-[450px] overflow-scroll mt-5 ml-10 w-full">
                    <table class="mt-10 ml-10 shadow-xl">
                        <thead>
                            <tr class="bg-black text-white text-sm">
                                <th class="px-8 py-4">Pedido</th>
                                <th class="px-8 py-4">Cantidad</th>
                                <th class="px-8 py-4">Comentario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="bg-white border-b text-center">
                                <th scope="row" class="px-8 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    01
                                </th>
                                <td class="px-8 py-4">
                                    5
                                </td>
                                <td class="px-8 py-4">
                                    TenÃ­a descosida una de las mangas
                                </td>
                            </tr>
                            <tr class="bg-white border-b text-center">
                                <th scope="row" class="px-8 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    02
                                </th>
                                <td class="px-8 py-4">
                                    4
                                </td>
                                <td class="px-8 py-4">
                                    Durante el proceso de sublimado, hubo un error y el estampado quedÃ³ mal
                                </td>
                            </tr>
                            <tr class="bg-white border-b text-center">
                                <th scope="row" class="px-8 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    03
                                </th>
                                <td class="px-8 py-4">
                                    3
                                </td>
                                <td class="px-8 py-4">
                                    TenÃ­a descosida una de las mangas
                                </td>
                            </tr>
                            <tr class="bg-white border-b text-center">
                                <th scope="row" class="px-8 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    04
                                </th>
                                <td class="px-8 py-4">
                                    3
                                </td>
                                <td class="px-8 py-4">
                                    Durante el proceso de sublimado, hubo un error y el estampado quedÃ³ mal
                                </td>
                            </tr>
                            <tr class="bg-white border-b text-center">
                                <th scope="row" class="px-8 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    05
                                </th>
                                <td class="px-8 py-4">
                                    4
                                </td>
                                <td class="px-8 py-4">
                                    La camisa presentaba un orificio en una de sus mangas
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
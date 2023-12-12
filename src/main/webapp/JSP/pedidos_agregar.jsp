<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link href="../images/logoR.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/output.css" />
        <title>Agregar Pedidos</title>
        <style>
            /* Estilo para los detalles de la camisa */
            .details {
                display: none;
            }

            .camisa {
                border: 1px solid #ccc;
                padding: 10px;
                margin-bottom: 10px;
            }

            .toggle {
                cursor: pointer;
            }
        </style>
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
                <div class="flex justify-between ml-12 mt-12">
                    <p class="text-4xl font-bold text-slate-800 mb-5">Agregar Pedido</p>
                </div>
                <div class="max-h-[200px] overflow-scroll mt-5 ml-10 ">
                    <form action="../administrarPedidos" method="post">
                        <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                            <button class="absolute text-slate-900 font-bold right-5 top-5 text-xl"><img src="assets/arrowLeft.svg" alt="left"></button>
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="fecha">Fecha</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="date" name="fecha" id="fecha" required>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="precio">Dirección</label>
                                    <input class="py-1 px-2 rounded-lg font-semibold" type="text" name="direccion" id="direccion" required>
                                </div>
                            </div>
                            <div class="flex flex-col gap-5 w-[50%]">
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="cliente">Cliente</label>
                                    <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="cliente" id="cliente" required>
                                </div>
                                <div class="flex flex-col">
                                    <label class="text-white font-semibold" for="cantidad">Cantidad</label>
                                    <input  class="py-1 px-2 rounded-lg font-semibold" type="text" name="cantidad" id="cantidad" required>
                                </div>

                            </div>
                        </div>
                        <br>
                        <div id="camisas">
                            <div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">
                                <div class="flex flex-col gap-5 w-[50%]">
                                    <div class="flex flex-col">
                                        <label class="text-white font-semibold" for="color1">Color:</label>
                                        <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="color1" name="color1" required>
                                    </div>
                                    <div class="flex flex-col">
                                        <label class="text-white font-semibold" for="color1">Talla:</label>
                                        <input class="py-1 px-2 rounded-lg font-semibold" type="text" id="talla1" name="talla1" required>
                                    </div>
                                </div>
                                <div class="flex flex-col gap-5 w-[50%]">
                                    <div class="flex flex-col">
                                        <label class="text-white font-semibold" for="color1">Tipo de Estampado</label>
                                        <select class="form-select py-1 px-2 rounded-lg font-semibold" name="estampado1" id="estampado1" required>
                                            <option value="Sublimado">Sublimado</option>
                                            <option value="Led">Led</option>
                                            <option value="Bordado">Bordado</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <button  class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out" type="button" onclick="agregarCamisa()">Agregar Camisa</button>
                        <script>
                            let contador = 1;

                            function agregarCamisa() {
                                contador++;

                                const divCamisa = document.createElement('div');
                                const innerHTML = '<br>' +
                                        '<div class="bg-slate-500 flex gap-10 p-16 shadow-2xl rounded-2xl relative">' +
                                        '<div class="flex flex-col gap-5 w-[50%]">' +
                                        '<div class="flex flex-col">' +
                                        '<label class="text-white font-semibold" for="color' + contador + '">Color:</label>' +
                                        '<input class="py-1 px-2 rounded-lg font-semibold" type="text" id="color' + contador + '" name="color' + contador + '" required>' +
                                        '</div>' +
                                        '<div class="flex flex-col">' +
                                        '<label class="text-white font-semibold" for="talla' + contador + '">Talla:</label>' +
                                        '<input class="py-1 px-2 rounded-lg font-semibold" type="text" id="talla' + contador + '" name="talla' + contador + '" required>' +
                                        '</div>' +
                                        '</div>' +
                                        '<div class="flex flex-col gap-5 w-[50%]">' +
                                        '<div class="flex flex-col">' +
                                        '<label class="text-white font-semibold" for="estampado' + contador + '">Tipo de Estampado</label>' +
                                        '<select class="form-select py-1 px-2 rounded-lg font-semibold"  id="estampado' + contador + '" name="estampado' + contador + '" required>' +
                                        '<option value="Sublimado">Sublimado</option>' +
                                        '<option value="Led">Led</option>' +
                                        '<option value="Bordado">Bordado</option>' +
                                        '</select>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';

                                divCamisa.innerHTML = innerHTML;
                                document.getElementById('camisas').appendChild(divCamisa);
                            }

                        </script>

                        <div class="mt-5">
                            <button type="submit" name="action" value="ingresarPedido" class="bg-gray-500 font-semibold text-white p-2 px-8 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                                Guardar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

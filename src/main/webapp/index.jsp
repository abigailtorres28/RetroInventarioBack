<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <title>Login</title>
        <link rel="stylesheet" href="JSP/CSS/output.css" />
        <link href="../images/logoR.png" rel="icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>

    <body class="my-body">
        <div class="flex h-screen w-screen font-sans">
            <div
                class="w-[65%] bg-gradient-to-r from-slate-400 to-white flex justify-center items-center flex-col gap-6">
                <form action="iniciarSesion" method="post" class="w-[30%] flex flex-col gap-5">
                    <div class="flex flex-col font-semibold text-xl">
                        <label class="mb-1" for="email">Correo</label>
                        <input class="py-2 px-3 rounded-xl shadow-lg shadow-gray-500 text-gray-800" name="correo"
                            type="text" required />
                    </div>
                    <div class="flex flex-col font-semibold text-xl">
                        <label class="mb-1" for="password">Contraseña</label>
                        <input class="py-2 px-3 rounded-xl shadow-lg shadow-gray-500 text-gray-800" name="contraseña"
                            type="password" required />
                    </div>
                    <button type="submit" class="bg-gray-500 font-semibold text-white w-[75%] p-2 rounded-xl shadow-lg shadow-gray-500 hover:bg-gray-700 transition ease-in-out">
                    Entrar
                </button>
                </form>
                <div class="flex flex-col gap-4 justify-center items-center">
                    <p class="font-semibold">Recuperar contraseña</p>
                </div>
            </div>
            <div class="h-screen bg-black flex justify-center items-center">
                <img class="w-[350px] mx-16" src="JSP/assets/Logo-Retro-Shirt.jpg" alt="Logo" />
            </div>
        </div>
        <!-- Section: Design Block -->
        <div>
            <% String mensajeError = (String) request.getAttribute("mensaje"); %>
            <% if (mensajeError != null && !mensajeError.isEmpty()) { %>
             <script>
             alert("<%= mensajeError %>");
             </script>
            <% } %>

        </div>

    </body>

</html>
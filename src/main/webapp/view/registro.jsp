<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <link rel="stylesheet" href="css/registro.css">    
</head>

<body >

    <!-- menu -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="./inicio.jsp">
                <img src="images/codoacodo.png" alt="c" class="w-25" href="./inicio.jsp">
                Conf BsAs
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#"></a>
                    </li>

                </ul>
                <span class="navbar-text">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="tickets/comprarTickets.html">Comprar Ticket</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-light" href="./login.jsp">Login</a>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
    </nav>

    <div class="bg-ligth border rounded m-3 p-2 d-flex flex-column align-items-center ">
        <div class="fs-4 my-3">Registro de Usuario</div>
        <!-- <div class="fs-4 my-3" onmouseover="alert('hola')">Registro de Usuario</div> -->

        <!-- formualrio con usuario pass -->
        <div>
            <form action="../controller/addUser.jsp" method="post">
                <input type="email" onkeyup="validarUser()" name="user" id="user" class="form-control mb-3" placeholder="usuario" required>
                <!-- <input type="password" onkeyup="mostrarFortCant()" name="pass" id="pass" class="form-control mb-3" placeholder="contraseÃ±a" required> -->
                <div class="input-group mb-3">
                    <input type="password" id="pass" name="pass"  onkeyup="validarPassDiscriminada()" class="form-control" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon1">
                    <span class="input-group-text" id="basic-addon1">
                        <a href="#">
                            <i class="bi bi-eye-slash-fill" id="icono" onclick="mostrarPass()"></i>
                        </a>
                    </span>
                </div>
                  
                <input type="text" name="repPass" id="repPass" class="form-control mb-3" placeholder="reingrese contraseña" required>
                <input type="submit" value="Registrar" class="btn btn-primary mb-3">
                <input type="reset" value="Limpiar" class="btn btn-primary mb-3">
                <div id="mensaje"></div>
            </form>

        </div>
		<% 
			String mensaje=request.getParameter("mensaje");
			if(mensaje!=null) {
				out.println("<div class='bg-danger text-center p-1 rounded'>");
				out.println(mensaje);
				out.println("</div>");
			}	
		%>	        
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

    <script src="js/registro.js"></script>    
</body>

</html>
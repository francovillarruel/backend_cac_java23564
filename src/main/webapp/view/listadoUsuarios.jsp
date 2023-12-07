<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container">
        <h1 class="text-center m-3 fs-3">Listado de Usuarios</h1>
        <% 
            String mensaje = request.getParameter("mensaje");
            if (mensaje != null) {
                out.println("<div class='bg-danger text-center p-1 rounded'>");
                out.println(mensaje);
                out.println("</div>");
            }
        %>

        <!-- Agregar Usuario -->
        <button class="btn btn-primary my-2" data-bs-toggle='modal' data-bs-target='#createModal'>Agregar Usuario</button>

        <!-- Listar Usuarios -->
        <table class="table text-center">
            <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Contraseña</th>
                    <th scope="col">Permisos</th>
                    <th scope="col">Foto de Perfil</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Operaciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    ConexionDB conn = new ConexionDB();
                    Statement st = conn.conectar();
                    ResultSet rs = st.executeQuery("SELECT * FROM usuarios");

                    while(rs.next()) {
                        out.println("<tr>");

                        out.println("<td>");
                        out.println(rs.getInt("id"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(rs.getString("user"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(rs.getString("pass"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(rs.getString("permisos"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(rs.getString("fotoPerfil"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(rs.getString("nombre"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(rs.getString("apellido"));
                        out.println("</td>");

                        out.println("<td>");
                        out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='" + rs.getInt("id") + "' user='" + rs.getString("user") + "' pass='" + rs.getString("pass") + "' permisos='" + rs.getString("permisos") + "' fotoPerfil='" + rs.getString("fotoPerfil") + "' nombre='" + rs.getString("nombre") + "' apellido='" + rs.getString("apellido") + "'><i class='bi bi-pencil-fill'></i></a>");
                        out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' idDel='" + rs.getInt("id") + "'><i class='bi bi-trash-fill'></i></a>");
                        out.println("</td>");

                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>

        <!-- Create modal -->
        <div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Usuario</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/addUser.jsp" method="post">
                            <div class="mb-3 text-center">
                            	<input type="hidden" class="form-control" id="recipient-name" name="id">
                            	
                                <input type="text" class="form-control mb-3" id="userAdd" name="userAdd" placeholder="Usuario">
                                <input type="password" class="form-control mb-3" id="passAdd" name="passAdd" placeholder="Contraseña">
                                <input type="text" class="form-control mb-3" id="permisosAdd" name="permisosAdd" placeholder="Permisos">
                                <input type="text" class="form-control mb-3" id="fotoPerfilAdd" name="fotoPerfilAdd" placeholder="URL Foto de Perfil">
                                <input type="text" class="form-control mb-3" id="nombreAdd" name="nombreAdd" placeholder="Nombre">
                                <input type="text" class="form-control mb-3" id="apellidoAdd" name="apellidoAdd" placeholder="Apellido">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Crear</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Update modal -->
        <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Usuario</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/updUser.jsp" method="post">
                            <div class="mb-3 text-center">
                                <input type="hidden" class="form-control" id="idUpd" name="idUpd" readonly="readonly">
                                <input type="text" class="form-control mb-3" id="userUpd" name="userUpd" placeholder="Nombre de Usuario">
                                <input type="password" class="form-control mb-3" id="passUpd" name="passUpd" placeholder="Contraseña">
                                <input type="text" class="form-control mb-3" id="permisosUpd" name="permisosUpd" placeholder="Permisos">
                                <input type="text" class="form-control mb-3" id="fotoPerfilUpd" name="fotoPerfilUpd" placeholder="URL Foto de Perfil">
                                <input type="text" class="form-control mb-3" id="nombreUpd" name="nombreUpd" placeholder="Nombre">
                                <input type="text" class="form-control mb-3" id="apellidoUpd" name="apellidoUpd" placeholder="Apellido">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Modificar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Eliminar Usuario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="../controller/delUser.jsp" method="post"> <!-- Agregamos el formulario -->
      	 <input type="hidden" class="form-control" id="idDel" name="idDel" readonly="readonly">
      	
        <p>¿Estás seguro de que deseas eliminar este usuario?</p>
      
      <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-danger" data-bs-target="#deleteModal">Eliminar</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>

	    <script src="js/listAlumnos.js"></script>
	
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

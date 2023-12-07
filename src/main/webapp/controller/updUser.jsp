<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="db.ConexionDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {
        int id = Integer.parseInt(request.getParameter("idUpd"));
        String user = request.getParameter("userUpd");
        String pass = request.getParameter("passUpd");
        String permisos = request.getParameter("permisosUpd");
        String fotoPerfil = request.getParameter("fotoPerfilUpd");
        String nombre = request.getParameter("nombreUpd");
        String apellido = request.getParameter("apellidoUpd");

        ConexionDB conn = new ConexionDB();
    	Statement st=conn.conectar();

        String query = "UPDATE usuarios SET user='" + user + "', pass='" + pass + "', permisos='" + permisos + "', fotoPerfil='" + fotoPerfil + "', nombre='" + nombre + "', apellido='" + apellido + "' WHERE id=" + id;

        int rowsUpdated = st.executeUpdate(query);

        if (rowsUpdated > 0) {
            response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=Usuario actualizado correctamente");
        } else {
            response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=Error al actualizar el usuario");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=Error al procesar la solicitud");
    }
%>

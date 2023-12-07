<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.ConexionDB"%>
<%
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    String repPass = request.getParameter("repPass");
    String permisos = request.getParameter("permisos");
    String fotoPerfil = request.getParameter("fotoPerfil");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");

    // TODO: Comprobar que pass == repPass
    if (!pass.equals(repPass)) {
        response.sendRedirect("../view/registro.jsp?mensaje=Error: Las contraseñas no coinciden");
    } else {
        try {
            ConexionDB con = new ConexionDB();
            Statement st = con.conectar();

            int insOk = st.executeUpdate("INSERT INTO usuarios (user, pass, permisos, fotoPerfil, nombre, apellido) VALUES ('" + user + "','" + pass + "','" + permisos + "','" + fotoPerfil + "','" + nombre + "','" + apellido + "')");

            if (insOk == 1) {
                response.sendRedirect("../view/login.jsp?mensaje=Usuario%20registrado%20correctamente");
            } else {
                response.sendRedirect("../view/registro.jsp?mensaje=Error: No%20se%20pudo%20crear%20el%20usuario");
            }

            st.close();
            con.cerrar(st);
        } catch (SQLException e) {
            // Imprimir detalles del error en el servidor
            e.printStackTrace();
            response.sendRedirect("../view/registro.jsp?mensaje=Error: " + e.getMessage());
        } catch (Exception e) {
            response.sendRedirect("../view/registro.jsp?mensaje=El%20usuario%20ya%20existe,%20debe%20logearse");
        }
    }
%>

<%@ page import="java.io.*" %>
<%
    // Declarando variables
    int clave = 0;
    String nombre = "";
    float estatura = 0;

    // Creando un objeto de tipo archivo
    DataOutputStream archivo = null;

    if (request.getParameter("INSERTAR") != null) {
        // Capturando datos
        clave = Integer.parseInt(request.getParameter("CLAVE"));
        nombre = request.getParameter("NOMBRE");
        estatura = Float.parseFloat(request.getParameter("ESTATURA"));

        try {
            // Creando archivo en append
            archivo = new DataOutputStream(new FileOutputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\archivo1.dat", true));

            // Grabando al archivo
            archivo.writeInt(clave);
            archivo.writeUTF(nombre);
            archivo.writeFloat(estatura);
            out.println(clave + ": Registro grabado");
        } catch (FileNotFoundException fnfe) {
            out.println("Archivo no encontrado.");
        } catch (IOException ioe) {
            out.println("Error de E/S.");
        } finally {
            if (archivo != null) archivo.close();
        }
    }

    // Construyendo forma dinámica
    out.println("<FORM ACTION=jsp1.jsp METHOD=post>");
    out.println("CLAVE:<INPUT TYPE=TEXT NAME=CLAVE><br>");
    out.println("NOMBRE:<INPUT TYPE=TEXT NAME=NOMBRE><br>");
    out.println("ESTATURA:<INPUT TYPE=TEXT NAME=ESTATURA><br>");
    out.println("<INPUT TYPE=SUBMIT NAME=INSERTAR VALUE=GRABAR><br>");
    out.println("</FORM>");
%>
<html>
    <body bgcolor="white">
    </body>
</html>

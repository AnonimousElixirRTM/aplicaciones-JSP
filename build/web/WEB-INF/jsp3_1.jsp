<%@ page import="java.io.*" %>
<%
    // Declarando variables
    int clave = 0;
    int claveb = 0;
    String nombre = "";
    float estatura = 0;

    // Creando un objeto de tipo archivo
    DataInputStream archivo = null;

    if (request.getParameter("BUSCAR") != null) {
        // Construyendo tabla HTML
        out.println("<HTML><TABLE Border=10 CellPadding=5><TR>");
        out.println("<th bgcolor=Green>CLAVE</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>ESTATURA</th></TR>");

        // Capturando clave a buscar
        claveb = Integer.parseInt(request.getParameter("CLAVEB"));

        try {
            // Abriendo archivo
            archivo = new DataInputStream(new FileInputStream("C:\\Users\\Yarimo\\Downloads\\apache-tomcat-10.1.13\\archivo1.dat"));

            while (true) {
                clave = archivo.readInt();
                nombre = archivo.readUTF();
                estatura = archivo.readFloat();

                if (claveb == clave) {
                    out.println("<TR>");
                    out.println("<TD>" + clave + "</TD>");
                    out.println("<TD>" + nombre + "</TD>");
                    out.println("<TD>" + estatura + "</TD>");
                    out.println("</TR>");
                }
            }
        } catch (EOFException eof) {
            // Fin de archivo
        } catch (FileNotFoundException fnfe) {
            out.println("Archivo no encontrado.");
        } catch (IOException ioe) {
            out.println("Error de E/S.");
        } finally {
            if (archivo != null) archivo.close();
        }
    }

    // Construyendo forma dinámica
    out.println("<FORM ACTION=jsp3.jsp METHOD=post>");
    out.println("CLAVE BUSCAR:<INPUT TYPE=TEXT NAME=CLAVEB><BR>");
    out.println("<INPUT TYPE=SUBMIT NAME=BUSCAR VALUE=buscar><BR>");
    out.println("</FORM>");
%>
<html>
    <body bgcolor="yellow">
    </body>
</html>

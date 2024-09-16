<%@ page import="java.io.*" %>
<%
    // Declarando variables
    int clave = 0;
    String nombre = "";
    float estatura = 0;

    // Creando un objeto de tipo archivo
    DataInputStream archivo = null;

    if (request.getParameter("LECTURA") != null) {
        // Construyendo una tabla HTML
        out.println("<HTML><TABLE Border=10 CellPadding=5><TR>");
        out.println("<th bgcolor=Green>CLAVE</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>ESTATURA</th></TR>");

        try {
            // Abriendo archivo
            archivo = new DataInputStream(new FileInputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\archivo1.dat"));

            // Ciclo de lectura del archivo
            while (true) {
                out.println("<TR>");
                clave = archivo.readInt();
                out.println("<TD>" + clave + "</TD>");
                nombre = archivo.readUTF();
                out.println("<TD>" + nombre + "</TD>");
                estatura = archivo.readFloat();
                out.println("<TD>" + estatura + "</TD>");
                out.println("</TR>");
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
    out.println("<FORM ACTION=jsp2.jsp METHOD=post>");
    out.println("<INPUT TYPE=SUBMIT NAME=LECTURA VALUE=leer><BR>");
    out.println("</FORM>");
%>
<html>
    <body bgcolor="lightgreen">
    </body>
</html>

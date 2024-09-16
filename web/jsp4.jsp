<%@ page import="java.io.*" %>
<%
    // Declarando variables
    int clave = 0;
    float est = 0;
    String nombre = "";
    float estatura = 0;

    // Creando un objeto de tipo archivo
    DataInputStream archivo = null;

    if (request.getParameter("FILTRAR") != null) {
        // Construyendo tabla HTML
        out.println("<HTML><TABLE Border=10 CellPadding=5><TR>");
        out.println("<th bgcolor=skyblue>CLAVE</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>ESTATURA</th></TR>");

        // Capturando filtro
        est = Float.parseFloat(request.getParameter("ESTATURA"));

        try {
            // Abriendo archivo
            archivo = new DataInputStream(new FileInputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\archivo1.dat"));

            while (true) {
                clave = archivo.readInt();
                nombre = archivo.readUTF();
                estatura = archivo.readFloat();

                if (estatura >= est) {
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
    out.println("<FORM ACTION=jsp4.jsp METHOD=post>");
    out.println("ESTATURA >=:<INPUT TYPE=TEXT NAME=ESTATURA><BR>");
    out.println("<INPUT TYPE=SUBMIT NAME=FILTRAR VALUE=Filtrar><BR>");
    out.println("</FORM>");
%>
<html>
    <body bgcolor="red">
    </body>
</html>

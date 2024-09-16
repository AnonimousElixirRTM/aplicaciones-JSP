<%@ page import="java.io.*" %>
<%
    // Declarando variables
    int clave = 0;
    int claveb = 0;
    String nombre = "";
    float estatura = 0;

    // Creando objetos de tipo archivo
    DataInputStream archivo = null;
    DataOutputStream archivot = null;

    if (request.getParameter("ELIMINAR") != null) {
        // Capturando la clave a eliminar
        claveb = Integer.parseInt(request.getParameter("CLAVEB"));

        try {
            // Abriendo archivos
            archivo = new DataInputStream(new FileInputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\archivo1.dat"));
            archivot = new DataOutputStream(new FileOutputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\temp1.dat", true));

            while (true) {
                clave = archivo.readInt();
                nombre = archivo.readUTF();
                estatura = archivo.readFloat();

                // Si la clave no coincide con la clave a eliminar, copiar al archivo temporal
                if (claveb != clave) {
                    archivot.writeInt(clave);
                    archivot.writeUTF(nombre);
                    archivot.writeFloat(estatura);
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
            if (archivot != null) archivot.close();
        }

        // Eliminando el archivo original y renombrando el archivo temporal
        File file1 = new File("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\archivo1.dat");
        File file2 = new File("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\temp.dat");

        if (file1.exists()) file1.delete();
        file2.renameTo(file1);

        // Avisando al usuario
        out.println("REGISTRO ELIMINADO");
    }

    // Construyendo forma dinámica
    out.println("<FORM ACTION=jsp5.jsp METHOD=post>");
    out.println("CLAVE ELIMINAR:<INPUT TYPE=TEXT NAME=CLAVEB><BR>");
    out.println("<INPUT TYPE=SUBMIT NAME=ELIMINAR VALUE=Eliminar><BR>");
    out.println("</FORM>");
%>
<html>
    <body bgcolor="aqua">
    </body>
</html>

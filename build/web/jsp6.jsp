<%@ page import="java.io.*" %>
<%
    // Declarando variables
    int clave = 0;
    String nombre = "";
    float estatura = 0;

    // Creando objetos de tipo archivo
    DataInputStream archivo = null;
    DataOutputStream archivot = null;

    if (request.getParameter("SUMAR") != null) {
        try {
            // Abriendo los archivos
            archivo = new DataInputStream(new FileInputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\archivo1.dat"));
            archivot = new DataOutputStream(new FileOutputStream("D:\\USUARIO\\Documents\\Maleta\\Instituto\\Apache\\Semana 3\\Semana3\\web\\Data\\temp.dat", true));

            // Leyendo registros y sumando 5 a la estatura
            while (true) {
                clave = archivo.readInt();
                nombre = archivo.readUTF();
                estatura = archivo.readFloat();

                // Sumando 5 a la estatura
                estatura += 5;

                // Grabando al archivo temporal
                archivot.writeInt(clave);
                archivot.writeUTF(nombre);
                archivot.writeFloat(estatura);
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
        out.println("ESTATURAS SUMADAS EN 5");
    }

    // Construyendo forma dinámica
    out.println("<FORM ACTION=jsp6.jsp METHOD=post>");
    out.println("<INPUT TYPE=SUBMIT NAME=SUMAR VALUE='Sumar 5 a Estatura'><BR>");
    out.println("</FORM>");
%>
<html>
    <body bgcolor="green">
    </body>
</html>

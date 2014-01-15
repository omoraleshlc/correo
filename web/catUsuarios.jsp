<%-- 
    Document   : catProveedores
    Created on : Jan 12, 2014, 9:40:46 PM
    Author     : eric
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo de Usuarios</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <section id="container">

        <h1>Catálogo de Usuarios</h1>
        
        <html>
<jsp:useBean id="actualsession" class="beans.session" scope="session"/>
       
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

if(request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "" && request.getParameter("EMAIL") != "" && request.getParameter("USUARIO") != "" && request.getParameter("PASSWORD") != "")

{

// objetos de enlace

Connection canal = null;

ResultSet tabla= null;

Statement instruccion=null;

String strcon = "jdbc:mysql://localhost/correo?user=root";

// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

//cargando los campos a grabar

// excepto clave porque en mysql es de tipo auto-increment

String nombre = request.getParameter("NOMBRE");
String usuario = request.getParameter("USUARIO");
String email = request.getParameter("EMAIL");
String password = request.getParameter("PASSWORD");

// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String q="insert into usuarios(nombre,usuario,email,password,tipoUsuario) values(\"" +nombre+"\",\"" +usuario+"\",\"" +email+"\",\"" +password+"\",'1')";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("<script>window.alert('SE AGREGO EL USUARIO!');</script>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

// construyendo forma dinamica

out.println("<FORM ACTION=catUsuarios.jsp METHOD=post>");

out.println("NOMBRE :<INPUT TYPE=TEXT NAME=NOMBRE ><BR>");

out.println("EMAIL :<INPUT TYPE=TEXT NAME=EMAIL ><BR>");

out.println("PASSWORD :<INPUT TYPE=TEXT NAME=PASSWORD ><BR>");

out.println("USUARIO :<INPUT TYPE=TEXT NAME=USUARIO ><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");

out.println("</FORM>");

%>

        
        </section>


<%

// declarando y creando objetos globales
int a=0;
Connection canal = null;

ResultSet tabla= null;

Statement instrucciones=null;

String strcon = "jdbc:mysql://localhost/correo?user=root";





// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instrucciones = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda


// construyendo select con condicion

String q="select * from usuarios ";

// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(q);

// mandando resultset a tabla html

out.println("<TABLE Border=10 CellPadding=5><TR>");

out.println("<th >#</th><th bgcolor=White>USUARIO</th><th bgcolor=White>NOMBRE</th><th >EMAIL</th><th bgcolor=White>PASSWORD</th></TR>");

while(tabla.next()) {
a+=1;    

out.println("<TR>");
out.println("<TD>"+a+"</TD>");



out.println("<TD>"+tabla.getString(1)+"</TD>");
out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");

out.println("<TD><a href='catUsuarios.jsp?keyP="+tabla.getString(1)+"'>Eliminar</a></TD>");

out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");

} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};



// construyendo forma dinamica



%>

    </body>
</html>

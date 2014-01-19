<%-- 
    Document   : catProveedores
    Created on : Jan 12, 2014, 9:40:46 PM
    Author     : eric
--%>
<jsp:useBean id="actualsession" class="beans.session" scope="session"/>
 <%@include file="menu.jsp" %>

<%@ include file="conectar.jsp" %>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo de Usuarios</title>
    </head>
    <body>
       
        <br><br>

            
            <div class="container">
        <h1>Catálogo de Usuarios</h1>
     
<%        
//FUNCION ELIMINAR
String keyUser=null;
keyUser=request.getParameter("keyUser");
if(keyUser!=null )

{



// excepto clave porque en mysql es de tipo auto-increment



// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String p="DELETE FROM usuarios WHERE keyUser=\"" +keyUser+"\" ";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(p);

//avisando que se hizo la instruccion

out.println("<div class='alert alert-danger'>SE ELIMINO EL USUARIO!</div>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

//CIERRA ELIMINAR
        
        
      


if(request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "" && request.getParameter("EMAIL") != "" && request.getParameter("USUARIO") != "" && request.getParameter("PASSWORD") != "")

{

// objetos de enlace
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

out.println("<div class='alert alert-success'>USUARIO AGREGADO!</div>");

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

out.println("USUARIO :<INPUT TYPE=TEXT NAME=EMAIL ><BR>");

out.println("PASSWORD :<INPUT TYPE=TEXT NAME=PASSWORD ><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");

out.println("</FORM>");

%>

        
      

<%

// declarando y creando objetos globales
int a=0;


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
%>

<div class="panel panel-primary">
<div class="panel-heading"></div> 
<table class="table table-hover table-striped">
<TABLE class='table table-striped table-hover'>

<%
out.println("<th >#</th><th bgcolor=White>USUARIO</th><th bgcolor=White>NOMBRE</th><th >EMAIL</th><th bgcolor=White>PASSWORD</th></TR>");

while(tabla.next()) {
a+=1;    

out.println("<TR>");
out.println("<TD><small>"+a+"</TD>");


out.println("<TD><small>"+tabla.getString(1)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(2)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(3)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(4)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(5)+"</small></TD>");
out.println("<TD><small><a href='catUsuarios.jsp?keyUser="+tabla.getString(1)+"'>Eliminar</a></small></TD>");

out.println("</TR>"); }; // fin while

out.println("");

} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};



// construyendo forma dinamica



%></table>
</div>
</div>
    </body>
</html>

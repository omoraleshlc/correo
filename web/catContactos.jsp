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
        <title>Catálogo de Contactos</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <section id="container">

        <h1>Catálogo de Contactos</h1>
        
        <html>
<jsp:useBean id="actualsession" class="beans.session" scope="session"/>
       
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

if(request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "" && request.getParameter("TIPO") != "")

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

String tipo = request.getParameter("TIPO");
String ubicacion = request.getParameter("UBICACION");
String nombre = request.getParameter("NOMBRE");
String telefono = request.getParameter("TELEFONO");
String direccion = request.getParameter("DIRECCION");
// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String q="insert into contactos(tipo,ubicacion,nombre,telefono,direccion) values(\"" +tipo+"\",\"" +ubicacion+"\",\"" +nombre+"\",\"" +telefono+"\",\"" +direccion+"\")";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("<script>window.alert('SE AGREGO EL CONTACTO!');</script>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

// construyendo forma dinamica

out.println("<FORM ACTION=catContactos.jsp METHOD=post>");
%>

  <%
            if(request.getParameter("TIPO")=="empleado"){
                out.println("selected");
            }
            %>
        <select name="TIPO" onChange="this.form.submit();">
            <option >TIPO CONTACTO</option>
        <option
            <%
            if(request.getParameter("TIPO")=="empleado"){
                out.println("selected=''");
            }
            %>
            value="empleado">EMPLEADO</option>"
        <option value="alumno">ALUMNO</option>"
        </select><BR>

<select name="UBICACION"><option >UBICACION</option>
        <option value="dentroum">DENTRO UM</option>
        <option value="fueraum">FUERAUM</option>
         <option value="alumnoInterno">ALUMNO INTERNO</option>
         <option value="alumnoExterno">ALUMNO EXTERNO</option>
        </select><BR>


<%
out.println("NOMBRE :<INPUT TYPE=TEXT NAME=NOMBRE ><BR>");
out.println("TELEFONO :<INPUT TYPE=TEXT NAME=TELEFONO ><BR>");
out.println("DIRECCION :<INPUT TYPE=TEXT NAME=DIRECCION ><BR>");
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

String q="select * from contactos ";

// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(q);

// mandando resultset a tabla html

out.println("<TABLE Border=10 CellPadding=5><TR>");

out.println("<th >#</th><th bgcolor=White>TIPO</th><th bgcolor=White>UBICACION</th><th >NOMBRE</th><th bgcolor=White>TELEFONO</th><th>DIRECCION</th></TR>");

while(tabla.next()) {
a+=1;    

out.println("<TR>");
out.println("<TD>"+a+"</TD>");




out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");
out.println("<TD>"+tabla.getString(4)+"</TD>");
out.println("<TD>"+tabla.getString(5)+"</TD>");
out.println("<TD>"+tabla.getString(6)+"</TD>");
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

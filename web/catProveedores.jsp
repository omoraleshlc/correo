<%-- 
    Document   : catProveedores
    Created on : Jan 12, 2014, 9:40:46 PM
    Author     : eric
--%>
<%@include file="menu.jsp" %>
<%@ include file="conectar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo de Proveedores</title>
    </head>
    <body>
        
   

        <h1>Catálogo de Proveedores</h1>
        
        <html>
            
            <div class="container" >   
            
<jsp:useBean id="actualsession" class="beans.session" scope="session"/>
       
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

if(request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "")

{

// objetos de enlace




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


// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String q="insert into proveedores(nombre) values(\"" +nombre+"\")";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("<script>window.alert('SE AGREGO EL PROVEEDOR!');</script>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};















//FUNCION ELIMINAR
String keyP=null;
keyP=request.getParameter("keyP");
if(keyP!=null )

{



// excepto clave porque en mysql es de tipo auto-increment



// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String p="DELETE FROM proveedores WHERE keyP=\"" +keyP+"\" ";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(p);

//avisando que se hizo la instruccion

out.println("<script>window.alert('SE ELIMINO EL PROVEEDOR!');</script>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

//CIERRA ELIMINAR






























// construyendo forma dinamica

out.println("<FORM ACTION=catProveedores.jsp METHOD=post>");

out.println("NOMBRE :<INPUT class=form-control TYPE=TEXT NAME=NOMBRE ><BR>");%>

<button TYPE="SUBMIT" NAME="GRABAR" VALUE="INSERTAR" class="btn btn-primary">
    INSERTAR <span class="glyphicon glyphicon-arrow-right"></span>
</button>


<BR>
<%
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

%>



<div class="panel panel-primary">
<div class="panel-heading"></div> 
<table class="table table-hover table-stripe"><TR>

<th ><small>#</small></th>
<th><small>Nombre</small></th><th >
    
</th></TR>





<%
// construyendo select con condicion

String q="select * from proveedores ";

// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(q);

// mandando resultset a tabla html


while(tabla.next()) {
a+=1;    

out.println("<TR>");
out.println("<TD><small>"+a+"</small></TD>");
%>


<TD><small><% out.println(tabla.getString(2));%></small></TD>



<TD><a href="catProveedores.jsp?keyP=<% out.println(tabla.getString(1));%>"><small>Eliminar <span class="glyphicon glyphicon-floppy-remove"></span>
</small></a></TD>



<%
out.println("</TR>"); }; // fin while

//out.println("</TABLE></CENTER></div>");

} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};



// construyendo forma dinamica



%>

</table>
</div>
</div>

    </body>
</html>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Paquetes</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <br><br>
        <div class="container">

        <h1>Lista de Paquetes</h1>
   
        <br>
        
        <!--
        <button name="imprimir" class="btn btn-success btn-sm" value="IMPRIMIR" type="button" onclick="window.print();">
            Imprimir <span class="glyphicon glyphicon-print"></span>
        </button>
        <br>
        -->
<%



// objetos de enlace

Connection canal = null;

ResultSet tabla= null;
ResultSet selectProveedores = null;
Statement instruccion=null;
Statement instrucciones=null;
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

String keyRP = request.getParameter("keyRP");



if(request.getParameter("GRABAR") != null && request.getParameter("keyRP")!=null)
{
String q="UPDATE registrarpaquetes set status='entregado',fechaEntrega=now() where keyRP=\"" +keyRP+"\"";
try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("<script>window.alert('PAQUETE ENTREGADO!');</script>");

} catch(SQLException e) {out.println(e);};
}

// construyendo forma dinamica



%>



<%

// declarando y creando objetos globales
int a=0;

ResultSet mostrarProveedores=null;





// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instrucciones = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda


// construyendo select con condicion

String p="select keyC,nombre from contactos order by nombre ";

// mandando el sql a la base de datos



// declarando y creando objetos globales




// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instrucciones = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda


// construyendo select con condicion
String q=null;
q="select registrarpaquetes.numFolio,proveedores.nombre,registrarpaquetes.status,registrarpaquetes.fecha,registrarpaquetes.fechaEntrega from registrarpaquetes,proveedores where registrarpaquetes.keyP=proveedores.keyP order by proveedores.nombre ASC";
String r=null;
String idProveedor=null;
// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(q);

// mandando resultset a tabla html
%>
<table class="table table-hover table-striped"><TR>

<%        
out.println("<th >#FOLIO</th><th bgcolor=White>PROVEEDOR</th><th bgcolor=White>STATUS</th><th >FECHA</th><th>FECHA ENTREGA</th></TR>");

while(tabla.next()) {
a+=1;    

out.println("<TR>");

idProveedor=tabla.getString(3);


out.println("<TD>"+tabla.getString(1)+"</TD>");
out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");
out.println("<TD>"+tabla.getString(4)+"</TD>");
out.println("<TD>"+tabla.getString(5)+"</TD>");
//out.println("<TD><a href='catUsuarios.jsp?keyRP="+tabla.getString(1)+"'>Entregar</a></TD>");

out.println("</TR>"); }; // fin while



} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};



// construyendo forma dinamica



%>

</TABLE>
</DIV>
    </body>
</HTML>


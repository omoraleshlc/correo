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
        <title>Registrar Paquetes</title>
    </head>
    <body>
  
        <%@include file="menu.jsp" %>
        <div class="container">
            <br><br>
        <h1>Registrar Paquetes</h1>
        
      
<jsp:useBean id="actualsession" class="beans.session" scope="session"/>
       
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

if(request.getParameter("numFolio") != null && request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "" && request.getParameter("EMAIL") != "" && request.getParameter("USUARIO") != "" && request.getParameter("PASSWORD") != "")

{

// objetos de enlace

Connection canal = null;

ResultSet tabla= null;
ResultSet selectProveedores = null;
Statement instruccion=null;
Statement instrucciones=null;
String strcon = "jdbc:mysql://localhost/correo?user=omorales&password=wolf3333";

// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

//cargando los campos a grabar

// excepto clave porque en mysql es de tipo auto-increment

String keyP = request.getParameter("keyP");
String Observaciones=request.getParameter("observaciones");
String numFolio=request.getParameter("numFolio");
/*
// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);
    $q4 = "

    INSERT INTO contadorExternos(contador, usuario,entidad,keyClientesInternos)
    SELECT(IFNULL((SELECT MAX(contador)+1 from contadorExternos where entidad='".$entidad."'), 1)), '".$usuario."','".$entidad."','".$keyClientesInternos."'

    ";
    mysql_db_query($basedatos,$q4);
    echo mysql_error();

    $sSQL= "SELECT contador as topeMaximo from contadorExternos where keyClientesInternos='".$keyClientesInternos."'    ";
    $result=mysql_db_query($basedatos,$sSQL);
    $myrow = mysql_fetch_array($result);
    $FV= 'E'.$myrow['topeMaximo'];
    */
//String q="insert into usuarios(nombre,usuario,email,password,tipoUsuario) values(\"" +nombre+"\",\"" +usuario+"\",\"" +email+"\",\"" +password+"\",'1')";
//String q=" INSERT INTO contadorExternos(contador)
 //   SELECT(IFNULL((SELECT MAX(contador)+1 from contadorExternos )))";

String q="insert into registrarpaquetes(keyP,status,fecha,observaciones,numFolio) values(\"" +keyP+"\",'recibido',now(),\"" +Observaciones+"\",\"" +numFolio+"\")";
try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("<script>window.alert('PAQUETE REGISTRADO!');</script>");

} catch(SQLException e) {out.println(e);};








try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

// construyendo forma dinamica



%>
<form name="registrar" ACTION="registrarPaquetes.jsp" METHOD="post">
<script>
function openWin()
{
var myWindow = window.open("catProveedores.jsp","","width=800,height=500");
}
</script>






<%

// declarando y creando objetos globales
int a=0;
Connection canal = null;

ResultSet tabla= null;
ResultSet mostrarProveedores=null;
Statement instrucciones=null;

String strcon = "jdbc:mysql://localhost/correo?user=omorales&password=wolf3333";





// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instrucciones = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda


// construyendo select con condicion

String p="select * from proveedores ";

// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(p);

// mandando resultset a tabla html
%>

<br>
<div class="col-xs-6 col-sm-4">
<button class="btn btn-primary btn-sm" onclick="openWin()">
    Nueva paqueteria 
<span class="glyphicon glyphicon-plus"></span>
</button>
</div>
<br><br>
<div class="col-xs-6 col-sm-4">
<select name='keyP' class="form-control">


<%
while(tabla.next()) {

%>


<option value="<% out.println(tabla.getString(1));%>"><% out.println(tabla.getString(2));%></option>
<% 
}; // fin while
%>
</select>
</div><br><br>
<%
} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};



// construyendo forma dinamica



%>



<br>

<div class="col-xs-6 col-sm-4">
<textarea name="observaciones" placeholder="Observaciones" class="form-control text-primary" ></textarea>
</div>

<br><br><br><br>
<div class="col-xs-6 col-sm-2">
    <input name="numFolio" placeholder="FOLIO" class="form-control text-primary" >
</div>
<br><br><br><br>
<div class="col-xs-6 col-sm-4">
<button TYPE="SUBMIT" class="btn btn-success btn-sm" NAME="GRABAR" VALUE="REGISTRAR" >
Registrar Paquete <span class="glyphicon glyphicon-plane"></span>
</button>
<a href="listaPaquetes.jsp">
    
Paquetes Registrados <span class="glyphicon glyphicon-list"></span>
   
</a>
</div>
<BR><br>
</form>


        
        


<%

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

String q="select registrarpaquetes.numFolio,proveedores.nombre,registrarpaquetes.usuario,registrarpaquetes.status,registrarpaquetes.fecha,registrarpaquetes.observaciones,registrarpaquetes.keyRP from registrarpaquetes,proveedores "
        + "where registrarpaquetes.status!='entregado' "
        + "and registrarpaquetes.keyP=proveedores.keyP order by proveedores.nombre ASC";
String r=null;
String idProveedor=null;
// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(q);

// mandando resultset a tabla html
%>
<table class="table table-striped table-hover"><TR>

        <th >#Folio</th><th >PAQUETERIA</th><th>RECIBIO</th><th >STATUS</th><th >FECHA</th><th>Observaciones</th><th></th></TR>

<%    
while(tabla.next()) {
a+=1;    

out.println("<TR>");

idProveedor=tabla.getString(3);


out.println("<TD>"+tabla.getString(1)+"</TD>");
out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");
out.println("<TD>"+tabla.getString(4)+"</TD>");
out.println("<TD>"+tabla.getString(5)+"</TD>");
out.println("<TD>"+tabla.getString(6)+"</TD>");
out.println("<TD>"+tabla.getString(7)+"</TD>");


out.println("<TD><a href='entregarPaquetes.jsp?keyRP="+tabla.getString(7)+"'>Entregar</a></TD>");

out.println("</TR>"); }; // fin while


} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};



// construyendo forma dinamica



%>

</table>
    </div>
</body>
</html>
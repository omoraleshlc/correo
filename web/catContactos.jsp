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
        <title>Catálogo de Contactos</title>
    </head>
    <body>
        <div class="container">

            
            <br><br><br>
        <h1>Catálogo de Contactos</h1>
        
       
<jsp:useBean id="actualsession" class="beans.session" scope="session"/>
       
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>


<%
//FUNCION ELIMINAR
String keyC=null;
keyC=request.getParameter("keyC");
if(keyC!=null )

{



// excepto clave porque en mysql es de tipo auto-increment



// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String p="DELETE FROM contactos WHERE keyC=\"" +keyC+"\" ";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(p);

//avisando que se hizo la instruccion

out.println("<div class='alert alert-danger'>SE ELIMINO EL CONTACTO!</div>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

//CIERRA ELIMINAR


if(request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "" && request.getParameter("TIPO") != "")

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


out.println("<div class='alert alert-success'>SE AGREGO EL CONTACTO!</div>");


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
        <select name="TIPO" class="form-control dropdown-menu" onChange="this.form.submit();">
            <option >TIPO CONTACTO</option>
        <option
            <%
            if(request.getParameter("TIPO")=="empleado"){
                out.println("selected=''");
            }
            %>
            value="empleado">EMPLEADO</option>
        <option value="alumno">ALUMNO</option>
        </select><BR>

<select name="UBICACION"><option >UBICACION</option>
        <option value="dentroum">DENTRO UM</option>
        <option value="fueraum">FUERAUM</option>
         <option value="alumnoInterno">ALUMNO INTERNO</option>
         <option value="alumnoExterno">ALUMNO EXTERNO</option>
        </select><BR>


<INPUT TYPE="TEXT" placeholder="NOMBRE" NAME="NOMBRE" ><BR>
<INPUT TYPE="TEXT NAME=TELEFONO" placeholder="TELEFONO" ><BR>
<INPUT TYPE="TEXT" NAME="DIRECCION" placeholder="DIRECCION"><BR>
<button class="btn btn-sm" TYPE="SUBMIT" NAME="GRABAR" VALUE="INSERTAR" >
AGREGAR <span class="glyphicon glyphicon-floppy-save"></span>

</button>
<BR>

</form>


















       


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

String q="select * from contactos ";

// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(q);

// mandando resultset a tabla html
%>

<div class="panel panel-primary">
<div class="panel-heading"></div> 
<table class="table table-hover table-striped"><TR>

<th >#</th><th>TIPO</th><th >UBICACION</th><th >NOMBRE</th><th >TELEFONO</th><th>DIRECCION</th></TR>

    
    
<%
while(tabla.next()) {
a+=1;    

out.println("<TR>");
out.println("<TD><small>"+a+"</small></TD>");




out.println("<TD><small>"+tabla.getString(2)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(3)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(4)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(5)+"</small></TD>");
out.println("<TD><small>"+tabla.getString(6)+"</small></TD>");
out.println("<TD><small><a href='catContactos.jsp?keyC="+tabla.getString(1)+"'>Eliminar</a></small></TD>");

out.println("</TR>"); }; // fin while



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

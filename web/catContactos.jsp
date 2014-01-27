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
String accion=null;
keyC=request.getParameter("keyC");
accion=request.getParameter("accion");
String Name=null;
String phone=null;
String address=null;
String location=null;
String type=null;
String plus=null;


String keyCPlus = request.getParameter("keyCPlus");
String tipo = request.getParameter("TIPO");
String ubicacion = request.getParameter("UBICACION");
String nombre = request.getParameter("NOMBRE");
String telefono = request.getParameter("TELEFONO");
String direccion = request.getParameter("DIRECCION");
accion = request.getParameter("accion");



if(keyCPlus!=null && request.getParameter("actualizar") != null)

{



// excepto clave porque en mysql es de tipo auto-increment
if(tipo==""){
    tipo=null;
}



if(ubicacion==""){
    ubicacion=null;
}

if(nombre==""){
    nombre=null;
}

if(telefono==""){
    telefono=null;
}

if(direccion==""){
    direccion=null;
}

// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

        plus="UPDATE contactos set tipo='"+tipo+"', ";
        plus+= "ubicacion='"+ubicacion+"', ";
        plus+= "nombre='"+nombre+"', ";
        plus+= "telefono='"+telefono+"', ";
        plus+= "direccion='"+direccion+"' ";
        plus+= "WHERE keyC=\"" +keyCPlus+"\" ";
        
        //out.println(plus);
try {

// agregando renglon (insert)

int no=instruccion.executeUpdate(plus);

//avisando que se hizo la instruccion

out.println("<div class='alert alert-success'>SE ACTUALIZO EL CONTACTO!</div>");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

//CIERRA ACTUALIZAR








if(keyC!=null && accion.equals("eliminar"))

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


if(request.getParameter("accion")==null && request.getParameter("GRABAR") != null && request.getParameter("NOMBRE") != "" && request.getParameter("TIPO") != "" && request.getParameter("nuevo")==null)

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


%>






<%


if(request.getParameter("keyC")!=null && request.getParameter("accion").equals("editar")){

// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

canal=DriverManager.getConnection(strcon);

instrucciones = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda


// construyendo select con condicion

String qt="select nombre,telefono,direccion,ubicacion,tipo from contactos WHERE keyC=\"" +keyC+"\" ";

// mandando el sql a la base de datos

try { tabla = instrucciones.executeQuery(qt);

// mandando resultset a tabla html


while(tabla.next()) {
    
Name=tabla.getString(1);
phone=tabla.getString(2);
address=tabla.getString(3);  
location=tabla.getString(4);
type=tabla.getString(5);
 } // fin while



} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tabla.close();instrucciones.close();canal.close();} catch(SQLException e) {};


%>


<FORM ACTION="catContactos.jsp" METHOD="post">

    <div class="row">
  <div class="col-xs-2">
        <select name="TIPO" class="form-control" >
            <option >TIPO CONTACTO</option>
        <option
           <% if(type.equals("empleado")){ out.println("selected=''");}%>
            value="empleado">EMPLEADO</option>
        <option
            <% if(type.equals("alumno")){ out.println("selected=''");}%>
            value="alumno">ALUMNO</option>
        </select><br>
      </div></div>

            
    <div class="row">
  <div class="col-xs-2">            
<select name="UBICACION" class="form-control"><option >UBICACION</option>
        <option
            <% if(location.equals("dentroum")){ out.println("selected=''");}%>
            value="dentroum">DENTRO UM</option>
        <option
             <% if(location.equals("fueraum")){ out.println("selected=''");}%>
            value="fueraum">FUERAUM</option>
         <option
             <% if(location.equals("alumnoInterno")){ out.println("selected=''");}%>
             value="alumnoInterno">ALUMNO INTERNO</option>
         <option
             <% if(location.equals("alumnoExterno")){ out.println("selected=''");}%>
             value="alumnoExterno">ALUMNO EXTERNO</option>
</select><br>
  </div>
    </div>

    <div class="row">
  <div class="col-xs-2">  
<INPUT TYPE="TEXT" placeholder="NOMBRE" class="form-control" NAME="NOMBRE" value="<% out.println(Name);%>" ><BR>
<INPUT TYPE="TEXT" NAME="TELEFONO" class="form-control"  placeholder="TELEFONO" value="<% out.println(phone);%>"><BR>
<INPUT TYPE="TEXT" NAME="DIRECCION" class="form-control"  placeholder="DIRECCION" value="<% out.println(address);%>"><BR>
  </div>
    </div>
<button class="btn btn-primary btn-sm" TYPE="SUBMIT" NAME="GRABAR" VALUE="INSERTAR" >
AGREGAR <span class="glyphicon glyphicon-floppy-save"></span>
</button>
  
 <button class="btn btn-success btn-sm" TYPE="SUBMIT" NAME="nuevo" VALUE="nuevo" >
NUEVO <span class="glyphicon glyphicon-plus"></span>
</button> 
  
   <button class="btn btn-default btn-sm" type="submit" name="actualizar" value="actualizar" >
ACTUALIZAR <span class="glyphicon glyphicon-floppy-open"></span>
</button> 
<BR>
<INPUT TYPE="hidden" NAME="keyCPlus" class="form-control"  placeholder="DIRECCION" value="<% out.println(request.getParameter("keyC"));%>"><BR>
</form>
<% } else {%>
<FORM ACTION="catContactos.jsp" METHOD="post">

    <div class="row">
  <div class="col-xs-2">
        <select name="TIPO" class="form-control" >
            <option >TIPO CONTACTO</option>
        <option
          
            value="empleado">EMPLEADO</option>
        <option
           
            value="alumno">ALUMNO</option>
        </select>
      </div></div>
    <br>
            
    <div class="row">
  <div class="col-xs-2">            
<select name="UBICACION" class="form-control"><option >UBICACION</option>
        <option
           
            value="dentroum">DENTRO UM</option>
        <option
             
            value="fueraum">FUERAUM</option>
         <option
             
             value="alumnoInterno">ALUMNO INTERNO</option>
         <option
            
             value="alumnoExterno">ALUMNO EXTERNO</option>
        </select>
  </div>
    </div>
    <br>

    <div class="row">
  <div class="col-xs-2">  
<INPUT TYPE="TEXT" placeholder="NOMBRE" class="form-control" NAME="NOMBRE" value="" ><BR>
<INPUT TYPE="TEXT" NAME="TELEFONO" class="form-control"  placeholder="TELEFONO" value=""><BR>
<INPUT TYPE="TEXT" NAME="DIRECCION" class="form-control"  placeholder="DIRECCION" value=""><BR>

  </div>
    </div>
<button class="btn btn-primary btn-sm" TYPE="SUBMIT" NAME="GRABAR" VALUE="INSERTAR" >
AGREGAR <span class="glyphicon glyphicon-floppy-save"></span>

</button>
    
    <button class="btn btn-primary btn-sm" TYPE="button" NAME="IMPRIMIR" VALUE="INSERTAR" onClick="window.print();">
PRINT <span class="glyphicon glyphicon-print"></span>

</button>
<BR>

</form>
<% } %>















       


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

<th >#</th><th>TIPO</th><th >UBICACION</th><th >NOMBRE</th><th >TELEFONO</th><th>DIRECCION</th><th></th><th></th></TR>

    
    
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
%>



<TD><small>
        <a href='catContactos.jsp?accion=editar&keyC=<% out.println(tabla.getString(1));%>'>
            Editar 
            
</a></small></TD>



<TD><small>
        <a href='catContactos.jsp?accion=eliminar&keyC=<% out.println(tabla.getString(1));%>'>
            Eliminar 
            </a></small>
</TD>


<%
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

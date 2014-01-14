<%--
    Document   : login
    Created on : 2013/06/16, 8:04:40
    Author     : doumbiaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
import="java.sql.*"
%>

<%
String email="",password="";
if(request.getParameter("email")!=null){
    email=request.getParameter("email");
}
if(request.getParameter("password")!=null){
    password=request.getParameter("password");
}
%>

<%
Connection con=null;
PreparedStatement pst=null;
ResultSet re=null;
String url="jdbc:mysql://localhost:3306/correo";
String Driver="com.mysql.jdbc.Driver";
String user="root";
String pass="";

Class.forName(Driver);
con=DriverManager.getConnection(url,user,pass);
String sql="select * from usuarios where email = ? and password = ?";
try{
pst=con.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,password);
re=pst.executeQuery();
if(re.next()){
    out.println("CONNECTED!!!"); 
}else{
    out.println("<script>"+ "window.alert('Usuario no valido!');"+ "window.location.href = 'index.jsp';</script>");
   
}
} catch(Exception e){
  
    out.println("ERROR CONNECTING");
}
%>

<link href="css/style.css" rel="stylesheet" media="screen, projection">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de Inicio</title>
    </head>
    <body>
        

        
  <%--   <jsp:useBean id="actualsession" class="beans.session" scope="session"/>
        <jsp:getProperty name="actualsession" property="email"/><br/>
        <jsp:getProperty name="actualsession" property="password"/><br/>
  --%>   
      
      <%@include file="menu.jsp" %>
    </body>

</html>
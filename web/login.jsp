<%--
    Document   : login
    Created on : 2013/06/16, 8:04:40
    Author     : doumbiaz
--%>
<%@ include file="conectar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<link href="images/css/bootstrap.css" rel="stylesheet" media="screen, projection">
<link href="images/css/bootstrap.min.css" rel="stylesheet">
<link href="images/js/bootstrap.js" rel="stylesheet">
<% if(request.getParameter("ingresar")!="" && request.getParameter("email")!=null && request.getParameter("password")!=null) { %>


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
PreparedStatement up=null;
ResultSet re=null;
ResultSet ru=null;
String url="jdbc:mysql://localhost:3306/correo";
String Driver="com.mysql.jdbc.Driver";
String user="root";
String pass="";
String plus=null;
String flag=null;
Class.forName(Driver);
con=DriverManager.getConnection(url,user,pass);
String sql="select * from usuarios where email = ? and password = ?";
int a=0;
        
try{
pst = con.prepareStatement(sql);
    
    pst.setString(1, email);
    pst.setString(2, password);
    re = pst.executeQuery();
    

    
    
if(re.next()){
    a+=1;
    out.println("<br><br>");
    out.println("CONNECTED!!!"); 
    out.println("<script>"+ "window.alert('Usuario "+email+" autentificado!');"+ "window.location.href = 'entrada.jsp';</script>");
        plus="UPDATE usuarios set status= ? ";        
        plus+= "WHERE email= ? ";
    up = con.prepareStatement(plus);
    up.setString(1,"activado");
    up.setString(2,email);
    ru=up.executeQuery();
    out.println("AQUIIIII"+plus);
     flag="yes";
    

       
    
    
}else{
    out.println("<script>"+ "window.alert('Usuario no valido!');"+ "window.location.href = 'index.jsp';</script>");
   
}
} catch(Exception e){
  
    out.println("ERROR CONNECTING");
}

if(a>0){
   plus="UPDATE usuarios set status='activado' ";       
        plus+= "WHERE email=\"" +email+"\" ";
        
        //out.println(plus);
try {

// agregando renglon (insert)

int no=instruccion.executeUpdate(plus);

//avisando que se hizo la instruccion

//out.println("<div class='alert alert-success'>SE ACTUALIZO EL CONTACTO!</div>");

} catch(SQLException e) {out.println(e);};       
}
%>
      
      <%@include file="menu.jsp" %>
      <% } else { 
 out.println("<script>"+ "window.alert('Favor de ingresar correctamente!');"+ "window.location.href = 'index.jsp';</script>");
} %>


    </body>
    

</html>
<%@page import="java.util.*"%>
<%@page language="java" import ="java.sql.*" %>  
 <%  
 String name=request.getParameter("count");  
 String buffer="<div>";  
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from users where uname LIKE '"+name+"%'");  

   while(rs.next()){
   buffer=buffer+rs.getString(2)+"<br>";  
   }  
 buffer=buffer+"</div>";  
 response.getWriter().println(buffer); 
%>
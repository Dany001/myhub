<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
try {
String connectionURL = "jdbc:mysql://localhost:3306/test";
Connection con;
Class.forName("com.mysql.jdbc.Driver");
// Get a Connection to the database
con = DriverManager.getConnection(connectionURL, "root", ""); 
//Add the data into the database
String sql ="select * from users where uname like '"+str+"%'";
Statement stm = con.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
while (rs.next ()){
    String s=rs.getString("uname");
    
    out.print(s+"\n");
out.println("<li onclick='fill("+rs.getString("uname")+");'>"+rs.getString("uname")+"</li>");
}}catch(Exception e){
out.println("Exception is ;"+e);
}
%>

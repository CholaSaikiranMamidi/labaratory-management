<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("Login.jsp");
}
else
{ %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 <%@ include file="adminheader.jsp" %>
<%


String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lms1";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<h1><center>Remove Lab Incharge</center></h1>
<div class="container">
<form action="toremove.jsp" method="POST">
<table border="1" class="table table-bordered table-striped">
<thead>
<tr>
<th style="color:green">Empid</th>
<th style="color:green">Name</th>
<th style="color:green">Department</th>
<th style="color:green">Role</th>
<th style="color:green">Email</th>
<th style="color:green">ContactNo</th>
<th style="color:green">Username</th>
<th style="color:green">Password</th>
<th style="color:green">RegDate</th>
<th style="color:green">Action</th>
</tr>
</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT * FROM employee WHERE Role='Principal'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
<td><%=resultSet.getString("empid") %></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("Department") %></td>
<td><%=resultSet.getString("Role") %></td>
<td><%=resultSet.getString("Email") %></td>
<td><%=resultSet.getString("ContactNo") %></td>
<td><%=resultSet.getString("Username") %></td>
<td><%=resultSet.getString("Password") %></td>
<td><%=resultSet.getString("RegDate") %></td>
<td><a href="delete.jsp?empid=<%=resultSet.getString("empid") %>"><button type="button" style="background-color:green;font-weight:bold;color:white;">Delete</button></a></td>
</tr>
</tbody>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
}
%>
</table>
</div>
</body>
</html>
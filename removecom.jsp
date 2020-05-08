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
<h1><center>REMOVE COMPONENTS</center></h1>
<div class="container">
<form action="toremove.jsp" method="POST">
<table border="1" class="table table-bordered table-striped">
<thead>
<tr>
<th style="color:green">COM_ID</th>
<th style="color:green">COM_NAME</th>
<th style="color:green">COM_COMPANY</th>
<th style="color:green">PRICE</th>
<th style="color:green">BILL_DATE</th>
<th style="color:green">STATUS</th>
<th style="color:green">ACTION</th>
</tr>
</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT * FROM components";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getString(5) %></td>
<td><%=resultSet.getString(6) %></td>
<td><a href="deletecom.jsp?empid=<%=resultSet.getString(1) %>"><button type="button" style="background-color:green;font-weight:bold;color:white;">Delete</button></a></td>
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
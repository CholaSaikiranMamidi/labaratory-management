<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ include file="adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1><center>UPDATE COMPONENTES</center></h1>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="updatecom.jsp">

<%
String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("Login.jsp");
}
else
{ 
%>
<%
String id=request.getParameter("id");

int sumcount=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");

String query = "select * from components where com_id='"+id+"'";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<div class="container">

<div class="row">
<div class="column">

<form action="updatecom.jsp" method="POST">
<div class="form-group">
<label for="empcode">COM_ID</label>
<input  name="id" id="empcode" class="form-control" value="<% out.println(rs.getString(1));%>" type="text" autocomplete="off" readonly required>
</div>
<div class="form-group">
<label for="Name">COM_NAME</label>
<input id="Name" name="com_location" class="form-control" value="<% out.println(rs.getString(2));%>"  type="text" required>
</div>
<div class="form-group">
<label for="Name">COM_COMPANY</label>
<input id="Name" name="location" class="form-control" value="<% out.println(rs.getString(3));%>"  type="text" required>
</div>
</div>
<div class="column">
<div class="form-group">
<label for="Department">PRICE</label>
<input id="Department" name="ram" class="form-control" value="<% out.println(rs.getString(4));%>"  type="text" required>
</div>
<div class="form-group">
<label for="Role">BILL_DATE</label>
<input id="Role" name="os" class="form-control" value="<% out.println(rs.getString(5));%>"  type="text"  required>
</div>
<div class="form-group">
<label for="Role">STATUS</label>
<input id="com_Role" name="hard_disc" class="form-control" value="<% out.println(rs.getString(6));%>"  type="text" required>
</div>
</div>
</div>

<div class="form-group" align="center">
<button type="submit" class="btn btn-primary" >UPDATE</button>
</div>
</form>
</div>
<%
}
}
catch(Exception e){
	e.printStackTrace();
	out.print(e);
}
%>
</table>
</form>
</body>
</html>
<%}%>
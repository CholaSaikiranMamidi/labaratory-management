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
<h1><center>UPDATE CPU</center></h1>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="update.jsp">

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
String id=request.getParameter("empid");

int sumcount=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");

String query = "select * from cpu where cid='"+id+"'";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<div class="container">

<div class="row">
<div class="column">

<form action="profileupdate.jsp" method="POST">
<div class="form-group">
<label for="empcode">cpu_Id</label>
<input  name="id" id="empcode" class="form-control" value="<%=rs.getString(1)%>" type="text" autocomplete="off" readonly required>
</div>
<div class="form-group">
<label for="Name">LOCATION</label>
<input id="Name" name="location" class="form-control" value="<%=rs.getString(2)%>"  type="text" required>
</div>
<div class="form-group">
<label for="Department">RAM</label>
<input id="Department" name="ram" class="form-control" value="<%=rs.getString(3)%>"  type="text" required>
</div>
<div class="form-group">
<label for="Role">OS</label>
<input id="Role" name="os" class="form-control" value="<%=rs.getString(4)%>"  type="text"  required>
</div>
<div class="form-group">
<label for="Role">HARDDISK</label>
<input id="Role" name="hard_disc" class="form-control" value="<%=rs.getString(5)%>"  type="text" required>
</div>
</div>

<div class="column">


<div class="form-group">
<label for="Email">MAC</label>
<input id="Email" name="mac" class="form-control" value="<%=rs.getString(6)%>"  type="text" required>
</div>
<div class="form-group">
<label for="ContactNo">COMPANY</label>
<input id="ContactNo" name="company" class="form-control" value="<%=rs.getString(7)%>"  type="text" required>
</div>
<div class="form-group">
<label for="Username">PRICE</label>
<input id="Username" name="price" class="form-control" value="<%=rs.getString(8)%>"  type="text" required>
</div>
<div>
<label for="RegDate">BillDate</label>
<input type="text" id="RegDate" class="form-control" name="bill_date" value="<%=rs.getString(9)%>"  required>
</div><br>
<div class="form-group">
<label for="Role">STATUS</label>
<input id="Role" name="status" class="form-control" value="<%=rs.getString(10)%>"  type="text"  required>
</div>

</div>
</div><br/><br/><br>
<br>
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
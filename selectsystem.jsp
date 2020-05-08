<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="adminheader.jsp" %>
<!DOCTYPE html>
<%
String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("Login.jsp");
}
else
{ 
%>
<html>
<head>

<script language="javascript">

</script>
</head>

<body>
<h1><center>UPDATE SYSTEM</center></h1>
<br>
<div class="container">
<form  method="post" name="form">
<div class="container">


<table  class="table table-bordered table-striped">
      <thead>
          <tr>
             <th style="color:green">SID</th>
			 <th style="color:green">CPUID</th>
             <th style="color:green">COMID</th>
              <th style="color:green">ACTION</th>
          </tr>
      </thead>
      <tbody>

<%

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
PreparedStatement ps=con.prepareStatement("select * from system ");
ResultSet rs=ps.executeQuery();
%>

<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<td><a href="editsystem.jsp?id=<%=rs.getString(3) %>"><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" " ></td>

</TR>
<% 
}
%>
<%
}
catch(Exception e)
{
	e.printStackTrace();
	out.print(e);
}
}
%>
</tbody>

</TABLE>
</form>
</body>
</html>
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
<h1><center>UPDATE CPU</center></h1>
<br>
<div class="container">
<form action="" method="post" >

<div class="form-group">
<div class="col-sm-5">
<div class="input-group">
<input type="text"  name="search" class="form-control" placeholder="Type the company name " autocomplete="off" >
<div class="input-group-btn">

<button type="submit" value="Serach" class="btn btn-primary" ><i class="fa fa-search"></i></button>
</div>
</div>
</div>
</div>
</form>
<br>
<br>
<br>
<form  method="post" name="form">
<div class="container">


<table  class="table table-bordered table-striped">
      <thead>
          <tr>
             <th style="color:green">CPU_ID</th>
			 <th style="color:green">LOCATION</th>
             <th style="color:green">RAM</th>
             <th style="color:green">OS</th>
			 <th style="color:green">HARD_DISK</th>
			 <th style="color:green">MAC</th>
             <th style="color:green">COMPANY</th>
             <th style="color:green">PRICE</th>
			 <th style="color:green">BILL_DATE</th>
              <th style="color:green">STATUS</th>
             <th style="color:green">ACTION</th>
          </tr>
      </thead>
      <tbody>

<%
String s=request.getParameter("search");
if(s==null)
{
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
PreparedStatement ps=con.prepareStatement("select * from cpu ");
ResultSet rs=ps.executeQuery();
%>

<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>

<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(7)%></TD>
<TD><%=rs.getFloat(8)%></TD>
<TD><%=rs.getDate(9)%></TD>
<TD><%=rs.getInt(10)%></TD>
<td><a href="edit.jsp?empid=<%=rs.getString(1) %>"><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;"  ></td>


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
%>
</tbody>

</TABLE>
</form>
<%
}
else 
{
%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
String qr="select * from cpu where Company like '%"+request.getParameter("search")+"%'||cid like '%"+request.getParameter("search")+"%'||RAM like '%"+request.getParameter("search")+"%'||Location like '%"+request.getParameter("search")+"%'||OS like '%"+request.getParameter("search")+"%'||HardDisk like '%"+request.getParameter("search")+"%'||MAC like '%"+request.getParameter("search")+"%'||Price like '%"+request.getParameter("search")+"%'||Status like '%"+request.getParameter("search")+"%'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
while(rs.next())
{
	%>
	<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>

<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(7)%></TD>
<TD><%=rs.getFloat(8)%></TD>
<TD><%=rs.getDate(9)%></TD>
<TD><%=rs.getInt(10)%></TD>
<td><a href="edit.jsp?empid=<%=rs.getString(1) %>"><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;"  ></td>
	</TR>
	
	<%
	
}
}
catch(Exception e)
{
e.printStackTrace();
out.print(e);
}
}
%>
</div>

</body>
</html>
<%}%>
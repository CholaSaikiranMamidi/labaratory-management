<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("login.jsp");
}
else
{ %>
<%@ page import="java.sql.*" %>
<%@ include file="adminheader.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<h1><center>Edit Profile</center></h1>
<%! String userdbName;
String userdbPsw;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;
String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/lms1";
String user = "root";
String dbpsw = "";
String sql = "select * from Employee where empid=?";

try{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1,empid);
rs = ps.executeQuery();
while(rs.next())
{%>

<div class="container">

<div class="row">
<div class="column">

<form action="profileupdate.jsp" method="POST">
<div class="form-group">
<label for="empcode">EmpId</label>
<input  name="empcode" id="empcode" class="form-control" value="<% out.println(rs.getString(1));%>" type="text" autocomplete="off" readonly required>
</div>
<div class="form-group">
<label for="Name">Name</label>
<input id="Name" name="Name" class="form-control" value="<% out.println(rs.getString(2));%>"  type="text" required>
</div>
<div class="form-group">
<label for="Department">Department</label>
<input id="Department" name="Department" class="form-control" value="<% out.println(rs.getString(3));%>"  type="text" required>
</div>
<div class="form-group">
<label for="Role">Role</label>
<input id="Role" name="Role" class="form-control" value="<% out.println(rs.getString(4));%>"  type="text" readonly required>
</div>

</div>

<div class="column">


<div class="form-group">
<label for="Email">Email</label>
<input id="Email" name="Email" class="form-control" value="<% out.println(rs.getString(5));%>"  type="text" required>
</div>
<div class="form-group">
<label for="ContactNo">ContactNo</label>
<input id="ContactNo" name="ContactNo" class="form-control" value="<% out.println(rs.getString(6));%>"  type="text" required>
</div>
<div class="form-group">
<label for="Username">Username</label>
<input id="Username" name="Username" class="form-control" value="<% out.println(rs.getString(7));%>"  type="text" required>
</div>
<div>
<label for="RegDate">RegDate</label>
<input type="text" id="RegDate" class="form-control" name="RegDate" value="<% out.println(rs.getString(9));%>" readonly required>
</div>


</div>
</div><br/><br/>
<div class="form-group" align="center">
<button type="submit" class="btn btn-primary" >UPDATE</button>
</div>
</form>
</div>
<%
}
rs.close();
ps.close(); 
}
catch(SQLException sqe)
{
out.println(sqe);
}
} %>
<!--p>Welcome, session.getAttribute("Username")</p-->
</body>
</html>
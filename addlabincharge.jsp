<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("Login.jsp");
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
<h1><center>ADD PRINCIPAL</center></h1>
<div class="container">
<div class="row">
<div class="column">
<form action="addlabincharge(action).jsp" method="POST">
<div class="form-group">
<label for="empcode">EmpId</label>
<input  name="empcode" id="empcode" class="form-control" type="text" autocomplete="off" required><br>
<label for="Name">Name</label>
<input id="Name" name="Name" class="form-control" type="text" required><br>
<label for="Department">Department</label>
<select id="Department" class="form-control" name="Department" type="text" required>
<option value="">Department..</option>
<option value="CSE">CSE</option>
<option value="ECE">ECE</option>
<option value="EEE">EEE</option>
<option value="MECH">MECH</option>
</select><br>
<label for="Role">Role</label>
<select id="Role" class="form-control" name="Role" type="text" required>

<option value="Principal">Principal</option>

</select><br>
<label for="Email">Email</label>
<input id="Email" class="form-control" name="Email" type="text" required><br>
</div>
</div>
<div class="column">


<div class="form-group">

<label for="ContactNo">ContactNo</label>
<input id="ContactNo" class="form-control" name="ContactNo" type="text" required><br>
<label for="Username">Username</label>
<input id="Username" class="form-control" name="Username" type="text" required><br>
<label for="Password">Password</label>
<input id="Password" class="form-control" name="Password" type="password" required><br>
<label for="Confirm Password">Confirm Password</label>
<input id="ConfirmPassword" class="form-control" name="ConfirmPassword" type="password" required><br>
<label for="RegDate">RegDate</label>
<input type="date" id="RegDate"  class="form-control" name="RegDate" required><br>
</div>
</div>
</div><br/><br/></br><br><br>
<div class="form-group" align="center">
<input type="submit" class="btn btn-primary" value="ADD">
</div>
</form>

</div>
<% } %>
</body>
</html>
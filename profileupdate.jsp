<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("login1.jsp");
}
else
{ %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
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
String empcode=request.getParameter("empcode");
String Name=request.getParameter("Name");
String Department=request.getParameter("Department");
String Role=request.getParameter("Role");
String Email=request.getParameter("Email");
String ContactNo=request.getParameter("ContactNo");
String Username=request.getParameter("Username");
String sql = "update Employee set empid=?,Name=?,Department=?,Role=?,Email=?,ContactNo=?,Username=? where empid="+empcode;
try{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1,empid);
ps.setString(2,Name);
ps.setString(3,Department);
ps.setString(4,Role);
ps.setString(5,Email);
ps.setString(6,ContactNo);
ps.setString(7,Username);
int i=ps.executeUpdate();
if(i>0)
{
	%>
	
<jsp:include page="editprofile.jsp" /> 
<p align="center" style="color:green">Record updated Successfully</p> 
	<%
	
}
else
{
	%>
	<jsp:include page="editprofile.jsp" /> 
<p align="center" style="color:red">error in updation</p>
	<%
}
ps.close(); 
}
catch(SQLException sqe)
{
out.println(sqe);
}
} %>
</body>
</html>
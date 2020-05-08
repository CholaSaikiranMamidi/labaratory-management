<%@ page import="java.sql.*" %>
<html>
<head>
<title>Login Action Page</title>
</head>
<body>
<br>
<%! String userdbName;
String userdbPsw;
%>
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String driverName="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/lms1";
String user="root";
String dbpsw="";
String sql="select * from Employee where Username=? and Password=?";
String Username=request.getParameter("Username");
String Password=request.getParameter("Password");
String Role=request.getParameter("Role");
if((!(Username.equals(null) || Username.equals("")) && !(Password.equals(null) || Password.equals(""))))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1,Username);
ps.setString(2,Password);
rs = ps.executeQuery();
if(rs.next())
{
userdbName = rs.getString("Username");
userdbPsw = rs.getString("Password");
Role=rs.getString("Role");
String empid=rs.getString("empid");
if(Role.equals("Principal"))
{
if(Username.equals(userdbName) && Password.equals(userdbPsw))
{
session.setAttribute("empid",empid);
response.sendRedirect("homeprincipal.jsp"); 
}
}
if(Role.equals("HOD"))
{
if(Username.equals(userdbName) && Password.equals(userdbPsw))
{
session.setAttribute("empid",empid);
response.sendRedirect("homehod.jsp"); 
}
}
if(Role.equals("LabIncharge"))
{
if(Username.equals(userdbName) && Password.equals(userdbPsw))
{
session.setAttribute("empid",empid);
response.sendRedirect("homelabincharge.jsp"); 
}
}
}
else
response.sendRedirect("error.jsp");
rs.close();
ps.close(); 
}
catch(SQLException sqe)
{
out.println(sqe);
}
}
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<%
getServletContext().getRequestDispatcher("/loginform.jsp").include(request,response);
}%>
</center>
</body>
</html>
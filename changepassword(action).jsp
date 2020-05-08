<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("login.jsp");
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
String currentpwd=request.getParameter("currentpwd");
String newpwd=request.getParameter("newpwd");
String confirm=request.getParameter("confirm");
int id=0;
String pass="";
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,dbpsw);
Statement st=con.createStatement(); 
rs=st.executeQuery("select * from Employee where empid='"+empid+"'");
while(rs.next())
{
id=rs.getInt(1);
pass=rs.getString("Password");
} 
System.out.println(id+ " "+pass);
if(pass.equals(currentpwd))
{
Statement st1=con.createStatement();
int i=st1.executeUpdate("update Employee set Password='"+newpwd+"' where empid='"+id+"'");
%>
<jsp:include page="changepassword.jsp" />

<p align="center" style="color:green">updated sucsussful..</p>
<%

st1.close();
rs.close();
con.close();
}
else
{%>
	<jsp:include page="changepassword.jsp" />

<p align="center" style="color:red">invalid current password</p>
<%}
}
catch(Exception e)
{
out.println(e);
}
}
%>
</body>
</html>
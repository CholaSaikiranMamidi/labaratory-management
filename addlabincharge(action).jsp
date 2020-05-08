<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("Login.jsp");
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
String Password=request.getParameter("Password");
String RegDate=request.getParameter("RegDate");
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,dbpsw);
Statement st=con.createStatement();
int i=st.executeUpdate("insert into Employee(empid,Name,Department,Role,Email,ContactNo,Username,Password,RegDate)values('"+empcode+"','"+Name+"','"+Department+"','"+Role+"','"+Email+"','"+ContactNo+"','"+Username+"','"+Password+"','"+RegDate+"')");
out.println("Data is successfully inserted!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
%>
</body>
</html>
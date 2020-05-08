<%@ page language="java" import="java.sql.* " contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try 
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");

String Un=request.getParameter("Username");
String pwd=request.getParameter("Password");
PreparedStatement ps=con.prepareStatement("select * from employee where Username=? and Password=? and Role='admin'");
ps.setString(1,Un);
ps.setString(2,pwd);
ResultSet rs=ps.executeQuery();

// if(Un=="Username" && pwd=="Password")   
	if(rs.next())
{
	String empid = rs.getString("empid");
	response.sendRedirect("adminheader.jsp");
	session.setAttribute("empid",empid);
    //out.println("Valid login credentials"); 
}
else
	{
	
	//response.sendRedirect("Login.jsp");
	
	%>
	<jsp:include page="Login.jsp" /><br>
	<br>
	<div class="alert alert-warning" width="50">
  <strong><center>Login failed!</center>
  </strong> 
  </div>
	<%	
	}


}
catch(Exception e)
{
	e.printStackTrace();
	out.print(e);
}

%>
</body>
</html>

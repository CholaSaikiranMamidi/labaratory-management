<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolr="yellow">
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
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");

String cpuid=request.getParameter("cpuid");
String comid=request.getParameter("comid");
String sid=request.getParameter("sid");

PreparedStatement ps=con.prepareStatement("insert into system values(?,?,?) ");
ps.setString(1,sid);
ps.setString(2,cpuid);
ps.setString(3,comid);

int k=ps.executeUpdate();
if(k>0)
{%>
<jsp:include page="systemadd.jsp" /> 
<p align="center" style="color:green">Record Inserted Successfully</p> 
<%
}
else
{
%>
<jsp:include page="systemadd.jsp" /> 
<p align="center" style="color:green">Error in Inserting</p> 
<%	
}
con.close();
}

catch(Exception se)
{
	se.printStackTrace();
	out.println("Something went wrong !! Please try again");
	
}


%>
<%}%>
</body>
</html>
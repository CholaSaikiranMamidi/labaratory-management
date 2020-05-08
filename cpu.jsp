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

String cpu_id=request.getParameter("cpuid");
String loc=request.getParameter("location");
String bd=request.getParameter("billdate");
String ram=request.getParameter("ram");
String hd=request.getParameter("harddisk");
String os=request.getParameter("os");
String mac=request.getParameter("mac");
String company=request.getParameter("company");
Integer pr=Integer.parseInt(request.getParameter("price"));
Integer st=Integer.parseInt(request.getParameter("status"));
PreparedStatement ps=con.prepareStatement("insert into cpu values(?,?,?,?,?,?,?,?,?,?) ");
ps.setString(1,cpu_id);
ps.setString(2,loc);
ps.setString(3,ram);
ps.setString(4,os);
ps.setString(5,hd);
ps.setString(6,mac);
ps.setString(7,company);
ps.setFloat(8,pr);
ps.setString(9,bd);
ps.setInt(10,st);
int k=ps.executeUpdate();
if(k>0)
{%>
<jsp:include page="Ccpu.jsp" /> 
<p align="center" style="color:green">Record updated Successfully</p> 
<%





}
con.close();
}
catch(SQLException se)
{
	se.printStackTrace();
	//out.println("Something went wrong  in SQL!! Please try again");
			out.print(se);
	 
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
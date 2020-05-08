
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

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
String id1=request.getParameter("id");
String ram=request.getParameter("com_location");

String mac=request.getParameter("location");
String os=request.getParameter("ram");
String company=request.getParameter("os");
String hard_disc=request.getParameter("hard_disc");


try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
PreparedStatement ps=con.prepareStatement("update components set com_id=?,com_name=?,com_company=?,Price=?,BillDate=?,Status=? where com_id='"+id1+"'");


ps.setString(1,id1);
ps.setString(2,ram);
ps.setString(3,mac);
ps.setString(4,os);
ps.setString(5,company);
ps.setString(6,hard_disc);
int i = ps.executeUpdate();
if(i > 0)
{%>
<jsp:include page="editcom.jsp" /> 
<p align="center" style="color:green">Record updated Successfully</p> 

<%
}
else
{%><jsp:include page="editcom.jsp" /> 
<p align="center" style="color:green">error in updation</p> 
<%}
}
catch(Exception e){
System.out.println(e);
out.print(e);
}
%>
<%}%>
<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("login.jsp");
}
else
{ %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
String id=request.getParameter("empid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root", "");
Statement st=conn.createStatement();
st.executeUpdate("DELETE FROM cpu WHERE cid='"+id+"'");
%>
<jsp:include page="removecpu.jsp" />
<p align="center" style="color:green">delate sucssusful......</p>
<%


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
%>

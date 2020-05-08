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
String ram=request.getParameter("ram");

String mac=request.getParameter("mac");
String os=request.getParameter("os");
String company=request.getParameter("company");
String hard_disc=request.getParameter("hard_disc");
String price=request.getParameter("price");
String location=request.getParameter("location");
String bill_date=request.getParameter("bill_date");
Integer status=Integer.parseInt(request.getParameter("status"));

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
PreparedStatement ps=con.prepareStatement("update cpu set Location=?,RAM=?,OS=?,HardDisk=?,MAC=?,Company=?,Price=?,BillDate=?,Status=? where cid='"+id1+"'");


ps.setString(1,location);
ps.setString(2, ram);
ps.setString(3,os);
ps.setString(4,hard_disc);
ps.setString(5,mac);
ps.setString(6,company);
ps.setString(7,price);
ps.setString(8,bill_date);
ps.setInt(9,status);
int i = ps.executeUpdate();
if(i > 0)
{%><jsp:include page="select.jsp" />

<p align="center" style="color:green">updated sucsussful..</p>

<%
}
else
{%>
	<jsp:include page="select.jsp" />
<p align="center" style="color:red">error in updation</p>
<%}
}
catch(Exception e){
System.out.println(e);
out.print(e);
}
%>
<%}%>
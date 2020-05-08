<%@page import="java.sql.*"%>
<html>
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
String sid=request.getParameter("sid");
String cpuid=request.getParameter("cpuid");
String comid=request.getParameter("comid");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
PreparedStatement ps=con.prepareStatement("update system set sid=?,cid=?,com_id=? where com_id='"+comid+"'");
ps.setString(1,sid);
ps.setString(2,cpuid);
ps.setString(3,comid);
int i = ps.executeUpdate();
if(i > 0)
{%>
<jsp:include page="selectsystem.jsp" />
<p align="center" style="color:green">Updated Sucsussfull</p>

<%
}
else
{%>
	<jsp:include page="selectsystem.jsp" />
<p align="center" style="color:red">Error in Updation</p>
<%}
}
catch(Exception e){
System.out.println(e);
out.print(e);
}
%>
<%}%>
</html>
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <% 
    String Un=(String)session.getAttribute("empid");
    if(Un==null)
    {
    	response.sendRedirect("Login.jsp");
    }
    else
    {
  
    %>
<!DOCTYPE html>
<html>
<head>

<body bgcolr="yellow">

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");
String com_id=request.getParameter("com_id");
String com_name=request.getParameter("com_name");
String com_company=request.getParameter("com_company");
String Price=request.getParameter("Price");

String bd=request.getParameter("Bill_Date");
String st=request.getParameter("status");
PreparedStatement ps=con.prepareStatement("insert into components values(?,?,?,?,?,?) ");
ps.setString(1,com_id);
ps.setString(2,com_name);
ps.setString(3,com_company);
ps.setString(4,Price);
ps.setString(5,bd);
ps.setString(6,st);

int k=ps.executeUpdate();
if(k>0)
{
	%>
<jsp:include page="com.jsp" /> 
<p align="center" style="color:green">Record updated Successfully</p> 
<%

}
con.close();
}
catch(SQLException se)
{
	se.printStackTrace();
		//	out.print(se);
	 
}
catch(Exception se)
{
	se.printStackTrace();
	//out.println("Something went wrong !! Please try again");
	
			%>
			  				<br>
	<center><p class="bg-dark text-white">Sorry,something went Wrong</p></center>
 <jsp:include page="com.jsp" /> 
			 

<%
}


%>
</body>
</html>
<%
}
%>
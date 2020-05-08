<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("login.jsp");
}
else
{ %>
<%@ page import="java.sql.*" %>
<%@ include file="header(hod).jsp" %>
<html>
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
} %>
</body>
</html>
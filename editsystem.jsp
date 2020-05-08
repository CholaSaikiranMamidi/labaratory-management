<%@include file="adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page language="java"%>
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
String id=request.getParameter("id");

int sumcount=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root","");

String query = "select * from system where com_id='"+id+"'";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">Update System</h4>
				<!--button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button-->
			</div>
			<div class="modal-body">
				<form action="updatesystem.jsp" method="post">
					<div class="form-group">
						
						<input type="text" name="sid" class="form-control" value="<% out.println(rs.getString(1));%>" required="required" readonly>
					</div>
					<div class="form-group">
						
						<input type="text" name="cpuid" class="form-control" value="<% out.println(rs.getString(2));%>" required="required">					
					</div>
					<div class="form-group">
						
						<input type="text" name="comid" class="form-control" value="<% out.println(rs.getString(3));%>" required="required">					
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Update">
					</div>
				</form>				
				
			</div>
			
		</div>
<%}
}
catch(Exception e){
	e.printStackTrace();
	out.print(e);
}
}%>
</body>
</html>

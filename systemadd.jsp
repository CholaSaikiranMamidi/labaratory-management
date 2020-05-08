<%@include file="adminheader.jsp" %>
<%
String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("Login.jsp");
}
else
{ 
%>
<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">Add System</h4>
				<!--button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button-->
			</div>
			<div class="modal-body">
				<form action="systemad.jsp" method="post">
					<div class="form-group">
						
						<input type="text" name="sid" class="form-control" placeholder="System-id" required="required">
					</div>
					<div class="form-group">
						
						<input type="text" name="cpuid" class="form-control" placeholder="Cpu-id" required="required">					
					</div>
					<div class="form-group">
						
						<input type="text" name="comid" class="form-control" placeholder="Com-id" required="required">					
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">
					</div>
				</form>				
				
			</div>
			
		</div>
<%}%>
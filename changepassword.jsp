<% String empid=(String)session.getAttribute("empid");
if(empid==null)
{
	response.sendRedirect("login.jsp");
}
else
{ %>
<%@ page import="java.sql.*" %>
<%@ include file="adminheader.jsp" %>
<html>
<head>
<script language="javascript">
function fncSubmit()
            {
                if(document.ChangePasswordForm.currentpwd.value=="")
                {
                    alert('Please input old password');
                    document.ChangePasswordForm.newpwd.focus();  //To focus the cursor in the old password text box
                    return false;
                     
                }
                if(document.ChangePasswordForm.confirm.value=="")
                {
                    alert('Please input confirm password');
                    document.ChangePasswordForm.confirm.focus(); //to focus the cursor in the new password text box
                    return false;
                     
                }
                 
                if(document.ChangePasswordForm.newpwd.value != document.ChangePasswordForm.confirm.value)
                {//checking whether the newpassword and confirm password entered by the user is a match or not
                    alert('Confirm password does not match with the new password');
                    document.ChangePasswordForm.confirm.focus(); //if doest not match focusing the cursor in the confirm pssword text box
                    return false;
                     
                }
                 
                document.ChangePasswordForm.submit();
                 
            }
            </script>
            
    </head>
<body>
<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">Change Password</h4>
				<!--button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button-->
			</div>
			<div class="modal-body">
				<form name="ChangePasswordForm" action="changepassword(action).jsp" method="post" onsubmit="return fncSubmit();">
				<div class="form-group">
					<i class="fa fa-lock"></i>
					<input type="password" class="form-control" placeholder="Current Password" name="currentpwd">
				</div>
				<div class="form-group">
					<i class="fa fa-key"></i>
					<input type="password" class="form-control"  placeholder="New Password" name="newpwd">
				</div>
				<div class="form-group">
					<i class="fa fa-key"></i>
				<input type="password" class="form-control" placeholder="Confirm Password" name="confirm">
				</div>
				<div class="form-group" align="center">
					<button type="submit" class="btn btn-default">Change</button>
				</div>
				</form>
			</div>
		</div>
	</div>
<% } %>
</body>
</html>
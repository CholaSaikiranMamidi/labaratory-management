<%@include file="header.jsp" %>
<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">Member Login</h4>
				<!--button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button-->
			</div>
			<div class="modal-body">
				<form action="loginsuccess.jsp" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i>
						<input type="text" name="Username" class="form-control" placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i>
						<input type="password" name="Password" class="form-control" placeholder="Password" required="required">					
					</div>
					<div class="form-group">
						<i class="fa fa-user"></i>
						<select type="text" name="Role" class="form-control" placeholder="Role" required="required">
						<option value="">Role...</option>
						<option value="Principal">Principal</option>
						<option value="HOD">HOD</option>
						<option value="LabIncharge">Lab Incharge</option>
						</select>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">
					</div>
				</form>				
				
			</div>
			<div class="modal-footer">
				<a href="forgotpassword.jsp">Forgot Password?</a>
			</div>
		</div>
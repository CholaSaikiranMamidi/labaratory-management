<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Stanley - Bootstrap Freelancer Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


  <!-- =======================================================
    Template Name: Stanley
    Template URL: https://templatemag.com/stanley-bootstrap-freelancer-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
<style type="text/css">

    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		color: #636363;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-login .modal-header {
		border-bottom: none;
		position: relative;
		justify-content: center;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
	}
	.modal-login  .form-group {
		position: relative;
	}
	.modal-login i {
		position: absolute;
		left: 13px;
		top: 11px;
		font-size: 18px;
	}
	.modal-login .form-control {
		padding-left: 40px;
	}
	.modal-login .form-control:focus {
		border-color: #00ce81;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-login .hint-text {
		text-align: center;
		padding-top: 10px;
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}
	.modal-login .btn {
		background: #00ce81;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #00bf78;
	}
	.modal-login .modal-footer {
		background: #ecf0f1;
		border-color: #dee4e7;
		text-align: center;
		margin: 0 -20px -20px;
		border-radius: 5px;
		font-size: 13px;
		justify-content: center;
	}
	.modal-login .modal-footer a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
	
	
	
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}

	
	
	
</style>
</head>


<body>
  <!-- Static navbar -->
  <nav class="navbar navbar-expand-md">
  <div class="navbar navbar-inverse navbar-static-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">WELCOME ADMIN</a>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="adminheader.jsp">Home</a></li>
          <li><a href="editprofile.jsp">Edit Profile</a></li>
          <li><a href="changepassword.jsp">Change Password</a></li>
          
        
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">PRINCIPAL<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="addlabincharge.jsp">Add PRINCIPAL</a></li>
					
					<li><a href="removelabincharge.jsp">Remove PRINCIPAL</a></li>    
				</ul>
		</li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">CPU<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="Ccpu.jsp">Add CPU</a></li>
					<li><a href="select.jsp">Update CPU</a></li>
					<li><a href="removecpu.jsp">Remove CPU</a></li>    
				</ul>
		</li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">COMPONENTES<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="com.jsp">Add COMPONENTES</a></li>
					<li><a href="selectcom.jsp">Update COMPONENTES</a></li>
					<li><a href="removecom.jsp">Remove COMPONENTES</a></li>    
				</ul>
		</li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="allreports.jsp">All</a></li>
					<li><a href="#">Department wise</a></li>
					<li><a href="#">MAC wise</a></li>    
				</ul>
		</li>
		
		<li><a href="logout.jsp">Logout</a></li>	
		</ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>
</nav>
    
</body>
</html>

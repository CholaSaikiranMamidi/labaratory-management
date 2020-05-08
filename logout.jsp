<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Logout</title>

</head>

<body>

<% session.invalidate();
response.sendRedirect("Login.jsp");  %>
<form action="Login.html"><p>you have logged out successfully</p></form>



</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.sendgrid.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms1", "root", "");
		Statement st = con.createStatement();
		String email = request.getParameter("Email");
		String strQuery = "SELECT password FROM employee where Email='" + email + "'";
		ResultSet rs = st.executeQuery(strQuery);
		rs.next();
		try {
			String password = rs.getString(1);
			//SendEmail.Send(email, currentpassword);	
			Email from = new Email("saispurthi17@gmail.com");
			String subject = "Forgot Password";
		    Email to = new Email(email);
		    Content content = new Content("text/plain", "Your Password is:" + password + " Use this password to login.");
		    Mail mail = new Mail(from, subject, to, content);
		    SendGrid sg = new SendGrid("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");
		    Request request1 = new Request();
		    request1.setMethod(Method.POST);
		      request1.setEndpoint("mail/send");
		      request1.setBody(mail.build());
		      Response response1 = sg.api(request1);
		      System.out.println(response1.getStatusCode());
		      System.out.println(response1.getBody());
		      System.out.println(response1.getHeaders());%>
		      <jsp:include page="Login.jsp" /> <br>
			<%
			out.println("Password send to your email id successfully !");
		} catch (SQLException exception) {
			out.println("Invalid Email Id ! or Your email not found in database");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
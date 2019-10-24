<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exam Portal-Forgot Password</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="resources/index.css" />
<script src="resources/main.js"></script>
</head>

<body>
	<nav id="nav_bar">
		<ul class="nav_ul">
			<li class="nav_list float_left"><a href="index.jsp"
				class="nav_link">Welcome ${user}</a></li>
			<li class="nav_list float_left"><a href="about.htm"
				class="nav_link">About Us</a></li>
			<li class="nav_list nav_link float_right dropdown">Login
				<div class="dropdown-content nav_list r">
					<a class="nav_link" href="admin_login.htm">Login as Admin</a> <a
						class="nav_link" href="login.htm">Login as User</a>
				</div>
			</li>
			<li class="nav_list float_right"><a href="register.htm" class="nav_link active">Register</a></li>
		</ul>
	</nav>
	<center>
		<h2>Forgot Password</h2>
		<form id="sendEmailForm" method="POST" action="sendEmail.htm">
			<table id="emailFormBeanTable" border="0" width="80%">
				<tr>
					<td>Enter Your Email ID:</td>
					<td><input id="receiverMail" type="text" name="mailTo"
						size="65" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input id="sendEmailBtn"
						type="submit" value="Send Email" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
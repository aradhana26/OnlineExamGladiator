<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Exam Portal-Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen"
	href="resources/index.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/jqueryValidation.js"></script>
<script src="${pageContext.request.contextPath}/resources/main.js"></script>
</head>
<body onload="Captcha()">
	<nav id="nav_bar">
		<ul class="nav_ul">
			<li class="nav_list float_left"><a href="index.jsp"
				class="nav_link">Home</a></li>
			<li class="nav_list float_left"><a href="about.htm"
				class="nav_link">About Us</a></li>
			<li class="nav_list nav_link float_right dropdown">Login
				<div class="dropdown-content nav_list r">
					<a class="nav_link" href="admin_login.htm">Login as Admin</a> <a
						class="nav_link" href="login.htm">Login as User</a>
				</div>
			</li>
			<li class="nav_list float_right"><a href="#"
				class="nav_link active">Register</a></li>
		</ul>
	</nav>

	<div>
		<h2 class="page_header">REGISTER</h2>
		<form action="insertReg.htm" onsubmit="return validate();" id="registration_form"
			name="registration_form" method="POST">
			<table class="form_table">
				<tr>
					<td class="form_field_label">Full Name:</td>
					<td><input type="text" class="form_input" name="reg_name"
						id="reg_name" placeholder="Enter your full name"></td>
					<td class="form_field_label">Email Id:</td>
					<td><input type="email" class="form_input" name="email_id"
						id="reg_email" placeholder="Enter your registered Email id"></td>
				</tr>

				<tr>
					<td class="form_field_label">Mobile Number:</td>
					<td><input type="text" class="form_input" name="mob_no"
						id="reg_number" placeholder="Enter your Mobile Number"><br></td>
					<td class="form_field_label">DOB:</td>
					<td><input type="date" id="reg_dob" class="reg_select"
						name="dob" max="1998-01-01"></td>
				</tr>

				<tr>
					<td class="form_field_label">Password:</td>
					<td><input type="password" class="form_input" id="reg_pwd"
						name="password" placeholder="Enter your password"></td>
					<td class="form_field_label">Confirm Password:</td>
					<td><input type="password" class="form_input" id="reg_cpwd"
						name="confirm_password" placeholder="Enter your password again"></td>
				</tr>

				<tr>
					<td class="form_field_label">Qualification:</td>
					<td><select class="reg_select" name="qualification"
						id="reg_qualification">
							<option value="" disabled selected>--Select--</option>
							<option value="BE">BE</option>
							<option value="BTech">BTech</option>
							<option value="MCA">MCA</option>
							<option value="BCA">BCA</option>
							<option value="MSc">MSc</option>
							<option value="BSc">BSc</option>
					</select></td>
					<td class="form_field_label">Year of Completion:</td>
					<td><select class="reg_select" name="year_of_completion"
						id="reg_yoc">
							<option value="" disabled selected>--Select--</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
					</select></td>
				</tr>

				<tr>
					<td class="form_field_label">State:</td>
					<td><select class="reg_select" id="state" name="state"
						onchange="makeSubmenu(this.value)">
							<option value="" disabled selected>--Select--</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="TamilNadu">Tamil Nadu</option>
					</select></td>
					<td class="form_field_label">City:</td>
					<td><select class="reg_select" id="city" name="city">
							<option value="" disabled selected>--Select--</option>
							<option value="Mumbai">Mumbai</option>
							<option value="Chennai">Chennai</option>
							<option value="Bengaluru">Bengaluru</option>
							<option value="Pune">Pune</option>
					</select></td>
				</tr>

				<tr>
					<td class="form_field_label">Captcha:</td>
					<td><input type="text" id="mainCaptcha" class="captcha_input"
						name="mainCaptcha" readonly="readonly" disabled="disabled" /><input
						type="image" src="resources/refresh.png" onclick="Captcha();"
						id="refresh" class="captcha_btn" /></td>
					<td colspan=2></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="text" id="txtInput" class="form_input"
						name="userCaptcha" placeholder="Enter captcha" autocomplete="off"
						onclick="disablePaste();" /><br> <label id="captcha_err"
						class="error_fields"></label></td>
					<td colspan=2><input id="register_button" class="big_button"
						type="submit" value="Register"></td>
				</tr>
			</table>

		</form>
		<script>
		var error_flag = true;
		var reqd_error = "This field cannot be empty";

		var citiesByState = {
			Maharashtra : [ "Mumbai", "Pune", "Nagpur", "Nashik" ],
			Karnataka : [ "Bengaluru", "Mysore", "Cuttack", "Ooty" ],
			Kerala : [ "Kochi", "Kannur", "Palakkad", "Thrissur" ],
			TamilNadu : [ "Chennai", "Coimbatore", "Tiruchirappalli" ]
		}

		function makeSubmenu(value) {
			if (value.length == 0)
				document.getElementById("city").innerHTML = "<option></option>";
			else {
				var citiesOptions = "";
				for (cityId in citiesByState[value]) {
					citiesOptions += "<option>" + citiesByState[value][cityId]
							+ "</option>";
				}
				document.getElementById("city").innerHTML = citiesOptions;
			}
		}

		function disablePaste() {
			const inp = document.getElementById('txtInput');
			inp.onpaste = function(e) {
				e.preventDefault();
			}
		}

		function Captcha() {
			var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
					'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
					'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
			var i;
			for (i = 0; i < 6; i++) {
				var a = alpha[Math.floor(Math.random() * alpha.length)];
				var b = alpha[Math.floor(Math.random() * alpha.length)];
				var c = alpha[Math.floor(Math.random() * alpha.length)];
				var d = alpha[Math.floor(Math.random() * alpha.length)];
				var e = alpha[Math.floor(Math.random() * alpha.length)];
				var f = alpha[Math.floor(Math.random() * alpha.length)];
				var g = alpha[Math.floor(Math.random() * alpha.length)];
			}
			var code = a + b + c + d + e + f + g;
			document.getElementById("mainCaptcha").value = code
		}

		function validate() {
			var error_flag = true;
			var reqd_error = "This field cannot be empty";

			var username = document.forms["registration_form"]["name"].value;
			var email_id = document.forms["registration_form"]["email"].value;
			var mobno = document.forms["registration_form"]["mob_number"].value;
			var qual = document.forms["registration_form"]["qualification"].value;
			var yoc = document.forms["registration_form"]["year_of_completion"].value;
			var state = document.forms["registration_form"]["state"].value;
			var city = document.forms["registration_form"]["city"].value;
			var dob = document.forms["registration_form"]["dob"].value;
			var mainCap = document.forms["registration_form"]["mainCaptcha"].value;
			var enteredCap = document.forms["registration_form"]["userCaptcha"].value;
			var pwd = document.forms["registration_form"]["password"].value;
			var cpwd = document.forms["registration_form"]["confirm_password"].value;

			var name_error = document.getElementById('name_err');
			var email_error = document.getElementById('email_err');
			var mobno_error = document.getElementById('mobno_err');
			var qual_error = document.getElementById('qual_err');
			var yoc_error = document.getElementById('yoc_err');
			var state_error = document.getElementById('state_err');
			var city_error = document.getElementById('city_err');
			var dob_error = document.getElementById('dob_err');
			var pwd_error = document.getElementById('pwd_err');
			var cpwd_error = document.getElementById('pwd_mismatch');
			var captcha_error = document.getElementById('captcha_err');

			if (username == "null" || username == "") {
				name_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				name_error.innerHTML = "";
			}

			if (email_id == "null" || email_id == "") {
				email_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				email_error.innerHTML = "";
			}

			if (mobno == "null" || mobno == "") {
				mobno_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				mobno_error.innerHTML = "";
			}

			if (qual == "--Select--" || qual == "" || qual == "null") {
				qual_error.innerHTML = "Please select your qualification";
				error_flag = false;
			} else {
				qual_error.innerHTML = "";
			}

			if (state == "--Select--" || state == "" || state == "null") {
				state_error.innerHTML = "Please select your State";
				error_flag = false;
			} else {
				state_error.innerHTML = "";
			}
			if (city == "--Select--" || city == "" || city == "null") {
				city_error.innerHTML = "Please select your City";
				error_flag = false;
			} else {
				city_error.innerHTML = "";
			}

			if (yoc == "null" || yoc == "") {
				yoc_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				yoc_error.innerHTML = "";
			}

			if (dob == "null" || dob == "") {
				dob_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				dob_error.innerHTML = "";
			}

			if (pwd == "null" || pwd == "") {
				pwd_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				pwd_error.innerHTML = "";
			}

			if (enteredCap == "null" || enteredCap == "") {
				captcha_error.innerHTML = reqd_error;
				error_flag = false;
			} else {
				captcha_error.innerHTML = "";
			}

			if (cpwd != pwd) {
				cpwd_error.innerHTML = "Confirm Password should match Password";
				error_flag = false;
			} else {
				cpwd_error.innerHTML = "";
			}

			if (mainCap != enteredCap) {
				captcha_error.innerHTML = "Captcha is not correct";
				error_flag = false;
			} else {
				captcha_error.innerHTML = "";
			}

			return error_flag;
		}
		</script>
	</div>
</body>
</html>
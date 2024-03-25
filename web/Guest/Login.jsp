<%-- 
    Document   : Login
    Created on : 22 Feb, 2024, 2:00:57 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%

    if (request.getParameter("btn_save") != null) {
        String email = request.getParameter("txt_email");
        String password = request.getParameter("txt_pass");

        String seluser = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        ResultSet rsuser = con.selectCommand(seluser);
        String seladvocate = "select * from tbl_advocate where advocate_email='" + email + "' and advocate_password='" + password + "'";
        ResultSet rsadvocate = con.selectCommand(seladvocate);
        String selpolice = "select * from tbl_police p inner join tbl_place pl on pl.place_id=p.place_id where police_email='" + email + "' and police_password='" + password + "'";
        ResultSet rspolice = con.selectCommand(selpolice);
        String seladmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
        ResultSet rsadmin = con.selectCommand(seladmin);
        

        if (rsuser.next()) {
            session.setAttribute("Uid", rsuser.getString("user_id"));
            session.setAttribute("Uname", rsuser.getString("user_name"));
            session.setAttribute("gemail", rsuser.getString("user_guardian"));
            
            response.sendRedirect("../User/HomePage.jsp");
        } else if (rsadvocate.next()) {
            session.setAttribute("Aid", rsadvocate.getString("advocate_id"));
            session.setAttribute("Aname", rsadvocate.getString("advocate_name"));
            response.sendRedirect("../Advocate/HomePage.jsp");
        } else if (rspolice.next()) {
            session.setAttribute("Pid", rspolice.getString("police_id"));
            session.setAttribute("Paddress", rspolice.getString("police_address"));
            session.setAttribute("pl_name", rspolice.getString("place_name"));
            response.sendRedirect("../PoliceStation/HomePage.jsp");
        } else if(rsadmin.next()){
            session.setAttribute("adminid", rsadmin.getString("admin_id"));
            session.setAttribute("adminname", rsadmin.getString("admin_name"));
            response.sendRedirect("../Admin/HomePage.jsp"); 
        } else {


%>
           <script>
            alert('Invalid');
        </script>
<%            }
    }

%>
       









<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../Assets/Template/Login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('../Assets/Template/Login/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter Email">
						<input class="input100" type="text" name="txt_email" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="txt_pass" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					
					<div class="container-login100-form-btn">
                                            <button class="login100-form-btn" type="submit" name="btn_save">
							Login
						</button>
					</div>
                                    <div class="text-center p-t-90">
                                        <a class="txt1" href="../index.html">
							Back to Home
						</a>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="../Assets/Template/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/daterangepicker/moment.min.js"></script>
	<script src="../Assets/Template/Login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/js/main.js"></script>

</body>
</html>
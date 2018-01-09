<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("USER_ID") != null && session.getAttribute("HEALTH_FACILITY_CODE") != null && session.getAttribute("ROLE_CODE") != null) {

        response.sendRedirect("dashboard.jsp");

        return;
    }

    Config.getBase_url(request);
    Config.getFile_url(session);

    try {

        MySession.setPathToSuper(application.getRealPath("/superConfig"));

    } catch (Exception e) {
        e.printStackTrace();
        out.print("Oopps! Try again later");
    }

    //out.print(MySession.getSuperString());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Login</title>

        <!-- header -->
        <script src="../assets/js/jquery.min.js"></script>
        <%@include file = "../assets/header.html" %>
        <link href="libraries/loading_sham.css" rel="stylesheet">
        <style>
            body {
                background: #fff;
            }
            .navigasi {
                height: 40px;
                border-bottom: 1px solid #f0f0f0;
            }

            .kandungan {
                padding: 65px 15px;
                margin-top: 40px;
            }

            /*            NEW*/
            * {
                margin: 0px auto;
                padding: 0px;
                font-family: 'Open Sans', sans-serif;
            }

            .cont_centrar {
                width: 320px;
                float: left;
                background-image: linear-gradient(-226deg, #FFFFFF 8%, #EEF3F5 100%);

                border-radius: 8px;
                transition: all 0.5s;
            }

            .cent_active {
                box-shadow: 5px 5px 10px 0px rgba(0,0,0,0.21);
            }


            .cont_tabs_login {
                position: relative;
                float: left;
                width: 100%;
            }

            .ul_tabs > li { 
                position: relative;
                float: left;
                width: 50%;
                list-style: none;
                text-align: center;

            }

            .ul_tabs > li > a  {  
                text-decoration: none;
                font-family: Helvetica;
                font-size: 16px;
                color: #999;
                line-height: 14px;
                padding: 20px ;
                display: block;
                transition: all 0.5s;
            }

            .ul_tabs > .active > a  {  
                color: #FF8383;

            }

            .linea_bajo_nom {
                position: relative;
                width: 100%;
                float: left;
                background-color: #999;
                height: 2px;
            }

            .active .linea_bajo_nom {
                position: relative;
                width: 100%;
                float: left;
                background-color: #FF8383;
                height: 2px;
            }

            .cont_text_inputs {
                position: relative;
                float: left;
                width: 100%;
                margin-top: 20px;
            }

            .input_form_sign {
                position: relative;
                float: left;
                width: 90%;
                border: none;
                border-bottom: 1px solid #B0BEC5 ;
                background-color: transparent;
                font-size: 14px;
                outline: none;
                transition: all 0.5s;
                height: 0px;
                margin: 0px;
                padding: 0px;  
                opacity: 0;
                display: none;
            }

            .active_inp {
                margin: 5% 5% ;  
                padding: 10px 0px;
                opacity: 1;
                height: 5px;
            }



            .input_form_sign:focus {
                border-bottom: 1px solid #FF8383 ;}

            .link_forgot_pass {
                position: relative;
                margin-top: 0px;
                margin-left: 30%;
                text-decoration: none;
                color: #999;
                font-size: 13px;
                display: none;
                float: left;
                transition: all 0.5s;
            }
            .cont_btn {
                position: relative;
                float: left;
            }

            .btn_sign {
                background: rgba(255,64,88,0.74);
                box-shadow: 0px 2px 20px 2px rgba(255,114,132,0.50);
                border-radius: 8px;
                padding: 15px 30px;
                border: none;
                color: #fff;
                font-size: 14px;
                position: relative;  
                float: left;
                margin-left: 100px;
                margin-top: 20px;
                margin-bottom: 20px;
                cursor: pointer;
            }

            .terms_and_cons {
                width: 70%;  
                color: #999;
                font-size: 13px;
                transition: all 0.5s;
            }

            .d_none {
                display: none;
            }

            .d_block {
                display: block;
            }

            .cont_text_inputs > input:nth-child(1){
                transition-delay: 0.2s;
            }

            .cont_text_inputs > input:nth-child(2){
                transition-delay: 0.4s;
            }
            .cont_text_inputs > input:nth-child(3){
                transition-delay: 0.6s;
            }
            .cont_text_inputs > input:nth-child(4){
                transition-delay: 0.8s;
            }




        </style>
        <!-- header -->
        <script>
            history.forward();
        </script>
    </head> 
    <body>
        <header class="navbar navbar-fixed-top navigasi">
            <div class="container">
                <div class="text-center">
                    HIS Care
                </div>
            </div>
        </header>
        <div class="container m-scene kandungan">
            <div class="row">
                <div class="col-md-7">
                    <h1>HIS-CARE</h1>
                    <p dir="auto">HIS-CARE offers free unlimited (private) repositories and unlimited collaborators.</p>
                </div>
                <div class="col-md-5">

                    <div class="cont_principal">

                        <div class="cont_centrar">
                            <div class="cont_login">
                                <form class="form-signin" id="leForm" >
                                    <div class="cont_tabs_login">
                                        <ul class='ul_tabs'>
                                            <li class="active"><a href="#" onclick="sign_in()">SIGN IN</a>
                                                <span class="linea_bajo_nom"></span>
                                            </li>
                                            <li><a href="#up" onclick="sign_up()">SIGN UP</a><span class="linea_bajo_nom"></span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="cont_text_inputs">
                                        <input type="text" class="input_form_sign " placeholder="NAME" name="name_us" />

                                        <input type="text" id="inputUserID" class="input_form_sign d_block active_inp" placeholder="EMAIL" name="emauil_us" />

                                        <input type="password" id="inputPassword" class="input_form_sign d_block  active_inp" placeholder="PASSWORD" name="pass_us" />  
                                        <input type="password" class="input_form_sign" placeholder="CONFIRM PASSWORD" name="conf_pass_us" />

                                        <a href="Forgot_Password" class="link_forgot_pass d_block" >Forgot Password ?</a>    
                                        <div class="terms_and_cons d_none">
                                            <p><input type="checkbox" name="terms_and_cons" /> <label for="terms_and_cons">Accept  Terms and Conditions.</label></p>

                                        </div>
                                    </div>
                                </form>
                                <div class="cont_btn">
                                    <button class="btn_sign" id="btnSign">SIGN IN</button>

                                </div>
                            </div>

                        </div>
                    </div>




                    <!--                    <div class="card card-container">
                                             <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> 
                                            <div class="profile-img-card">
                                                <img src="../assets/i-his.logo.svg" class="logo-login">
                                            </div>
                                            <div class="logo" style="font-size: 32px;">
                                                Welcome to <span>i-HIS</span>
                                            </div>
                                            <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
                                            <form class="form-signin" id="leForm" >
                                                <span id="reauth-email" class="reauth-email"></span>
                                                <input type="text" id="inputUserID" class="form-control" placeholder="Enter User ID" name="username" required autofocus>
                                                <input type="password" id="inputPassword" class="form-control" placeholder="Enter Password" name="password" required>
                                                                
                                                <div id="remember" class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="remember-me"> Remember me
                                                                    </label>
                                                                </div>
                                                
                    
                                            </form> /form 
                                            <button class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>
                                            <a href="Forgot_Password" class="forgot-password">
                                                Forgot the password?
                                            </a>
                                        </div> /card-container   -->
                </div>
            </div>
        </div><!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="libraries/script.html" %>
        <%@include file="../assets/script.html" %>
        <!--<script src="Dashboard_files\jquery.min.js.download"></script>
        <script src="http://www.w3schools.com/lib/w3data.js"></script>-->



        <script>

            $(document).ready(function () {

                $(document).bind('keypress', pressed);
            });

            function pressed(e)
            {
                if (e.keyCode === 13)
                {
                    //alert('enter pressed');
                    login();
                    //put button.click() here
                }
            }

            $('#btnSign').on('click', function () {

                login();

            });

            function login() {

                var userID = $("#inputUserID").val();
                var password = $("#inputPassword").val();

                if (userID === "") {
                    alert("Fill in the User ID");
                    $("#inputUserID").focus();
                } else if (password === "") {
                    alert("Fill in the password");
                    $("#inputPassword").focus();
                } else {
                    $('<div class="loading">Loading</div>').appendTo('#leForm');

                    $.ajax({
                        url: "login_process2.jsp",
                        type: "post",
                        data: {userID: userID,
                            password: password
                        },
                        timeout: 60000,
                        success: function (data) {
                            var num = parseInt(data);

                            if (num === 2)
                                window.location = "Home";
                            else if (num === 1)
                                alert("Wrong password");
                            else if (num === 0)
                                alert("User ID does not exist");
                            else if (num === 3)
                                alert("You don't have proper user access. Contact your admin to configure your user access");
                            else if (num === 4) {
                                alert("You have logged in to another PC or you did not log out properly");
                                window.location = "ReSign-in";
                            } else
                                alert("Error");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("Opps! " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $('.loading').hide();
                        }

                    });
                }
            }
        </script>
    </body>
</html>


<%@page import="dBConn.Conn"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.MySession" %>


<%@include file="validateSession.jsp" %>
<%    try {
        //------------------- Checking whether super user or not ------------------------------
        if (session.getAttribute("HFC_99") == null) {
            String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
            session.setAttribute("HFC_99", hfc_cd);

            //setting discipline and subdiscipline name
            Conn conn = new Conn();

            String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
            String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

            String query = "select dis.discipline_name, sub.subdiscipline_name "
                    + "from adm_discipline dis "
                    + "join adm_subdiscipline sub on sub.discipline_cd = dis.discipline_cd and sub.subdiscipline_hfc_cd = dis.discipline_hfc_cd "
                    + "where dis.discipline_cd = '" + dis_cd + "' AND sub.subdiscipline_cd = '" + sub_cd + "' and dis.discipline_hfc_cd = '" + hfc_cd + "' LIMIT 1;";

            ArrayList<ArrayList<String>> dataDis = conn.getData(query);

            if (dataDis.size() > 0) {
                session.setAttribute("DISCIPLINE_NAME", dataDis.get(0).get(0));
                session.setAttribute("SUB_DISCIPLINE_NAME", dataDis.get(0).get(1));
            } else {
                session.setAttribute("DISCIPLINE_NAME", "Unknown discipline code(" + dis_cd + "). Contact your admin.");
                session.setAttribute("SUB_DISCIPLINE_NAME", "Unknown subdiscipline code(" + sub_cd + "). Contact your admin.");
            }

        }

        String hfc_99 = (String) session.getAttribute("HFC_99");
        String user_99 = (String) session.getAttribute("USER_ID");
        String last_9 = user_99.substring(user_99.length() - 1);
        String my_1_gamba = session.getAttribute("PICTURE").toString();

        //====================================================================================
        //String modules = session.getAttribute("MODULE_CODE").toString();
        MySession mys = new MySession(user_99, hfc_99);
        mys.initModulePageAccess();

        String modules = mys.getLongStringModule();

        ArrayList<String> arrayModule = new ArrayList<String>(Arrays.asList(modules.split("\\|")));

        boolean mod01, mod02, mod03, mod04, mod05, mod06, mod07, mod08, mod09, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17, mod18, mod19, mod20, mod21, mod22;

        mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = mod18 = mod19 = mod20 = mod21 = mod22 = false;

        if (mys.isSuperUser()) {
            mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = mod18 = mod19 = mod20 = mod21 = mod22 = true;

        } else {

            for (int i = 0; i < arrayModule.size(); i++) {

                if (arrayModule.get(i).equalsIgnoreCase("01")) {

                    mod01 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("02")) {

                    mod02 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("03")) {

                    mod03 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("04")) {

                    mod04 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("05")) {

                    mod05 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("06")) {

                    mod06 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("07")) {

                    mod07 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("08")) {

                    mod08 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("09")) {

                    mod09 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("10")) {

                    mod10 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("11")) {

                    mod11 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("12")) {

                    mod12 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("13")) {

                    mod13 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("14")) {

                    mod14 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("15")) {

                    mod15 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("16")) {

                    mod16 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("17")) {

                    mod17 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("18")) {

                    mod18 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("19")) {

                    mod19 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("20")) {

                    mod20 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("21")) {

                    mod21 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("22")) {

                    mod22 = true;

                }
            }//end for loop

        }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <script src="libraries/jquery.min.js" type="text/javascript"></script>
        <link href="../assets/css/tabsDashboard.css" rel="stylesheet" type="text/css"/>
        <%@include file = "../assets/header.html" %>
        
        <!-- header -->

        <style>
            .twPc-div {
                background: #666 none repeat scroll 0 0;
                border: 1px solid #e1e8ed;
                height: 200px;
                margin-top: 50px;
            }
            .twPc-bg {
                background-image: url("https://pbs.twimg.com/profile_banners/50988711/1384539792/600x200");
                background-position: 0 50%;
                background-size: 100% auto;
                border-bottom: 1px solid #e1e8ed;
                border-radius: 4px 4px 0 0;
                height: 95px;
                width: 100%;
            }

            .navbar-brand{
                width:160px;
                height:160px;
                float:left;
                padding:0;
                margin-top:-130px;
                overflow:hidden;
                border:3px solid #eee;
                margin-left:15px;
                background:#333;
                text-align:center;
                line-height:160px;
                color:#fff !important;
                font-size:2em;
                -webkit-transition:  all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                -o-transition:  all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out ;
            }

            .site-name{
                color:#fff;
                font-size:2.4em;
                float:left;
                margin-top:-65px !important;
                margin-left:15px;
                font-family: 'Open Sans Condensed', sans-serif, sans-serif;

            }	
            .site-description{
                color:#fff;
                font-size:1.3em;
                float:left;
                margin-top:-30px !important;
                margin-left:15px;
            }
            .main-menu {
                position: absolute;
                left: 232px;
            }

            @import url(https://fonts.googleapis.com/css?family=Open+Sans:300);
            * {
                box-sizing: border-box;
            }

            .rollovers {
                overflow: hidden;
                list-style-type: none;
                margin: 0;
                padding: 1em;
                text-align: center;
            }
            .rollovers li {
                position: relative;
                display: inline-block;
                width: 13em;
            }
            .rollovers li a {
                position: relative;
                z-index: 1;
                display: block;
                font-family: 'Open Sans', sans-serif;
                font-weight: 300;
                font-size: 1.25em;
                text-decoration: none;
                color: #000;
                padding: 4.7em 1em 1em;
            }

            .icon_contain {
                position: absolute;
                top: 3em;
                left: 50%;
                width: 4.375em;
                height: 4.375em;
                -webkit-transform: translateX(-50%);
                transform: translateX(-50%);
            }
            .icon_contain .icon {
                position: absolute;
                top: 50%;
                left: 50%;
                fill: #fff;
                width: 35%;
                height: 35%;
                -webkit-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
                -webkit-transition: fill 1s ease;
                transition: fill 1s ease;
            }

            .logo {
                position: absolute;
                width: 4.375em;
                height: 4.375em;
                top: 3em;
                left: 50%;
                fill: #eb3f32;
                -webkit-transform: translateX(-50%);
                transform: translateX(-50%);
            }

            .icon_contain::before {
                content: "";
                position: absolute;
                top: 50%;
                left: 50%;
                width: 73%;
                height: 73%;
                opacity: 1;
                /*                background: #eb3f32;*/
                border-radius: .125em;
                -webkit-transform: translate(-50%, -50%) rotate(45deg);
                transform: translate(-50%, -50%) rotate(45deg);
            }

            .logo_reveal .icon_contain::before {
                -webkit-transition: opacity 1s ease;
                transition: opacity 1s ease;
            }
            .logo_reveal:hover .icon_contain .icon {
                fill: #eb3f32;
            }
            .logo_reveal:hover .icon_contain::before {
                opacity: 0;
            }

            .logo_grow .logo {
                -webkit-transform: translateX(-50%) scale(0);
                transform: translateX(-50%) scale(0);
                -webkit-transition: -webkit-transform 1s ease;
                transition: -webkit-transform 1s ease;
                transition: transform 1s ease;
                transition: transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_grow .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg) scale(1);
                transform: translate(-50%, -50%) rotate(45deg) scale(1);
                -webkit-transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, transform 1s ease;
                transition: opacity 1s ease, transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_grow:hover .logo {
                -webkit-transform: translateX(-50%) scale(1);
                transform: translateX(-50%) scale(1);
            }
            .logo_grow:hover .icon_contain .icon {
                fill: #eb3f32;
            }
            .logo_grow:hover .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg) scale(0);
                transform: translate(-50%, -50%) rotate(45deg) scale(0);
                opacity: 0;
            }

            .logo_grow_alt .logo {
                -webkit-animation: grow_alt 1s reverse;
                animation: grow_alt 1s reverse;
                -webkit-transform: translateX(-50%) scale(0);
                transform: translateX(-50%) scale(0);
            }
            .logo_grow_alt .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg) scale(1);
                transform: translate(-50%, -50%) rotate(45deg) scale(1);
                -webkit-transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, transform 1s ease;
                transition: opacity 1s ease, transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_grow_alt:hover .logo {
                -webkit-animation: grow_alt .7s ease-out;
                animation: grow_alt .7s ease-out;
                -webkit-transform: translateX(-50%) scale(1);
                transform: translateX(-50%) scale(1);
            }
            .logo_grow_alt:hover .icon_contain .icon {
                fill: #eb3f32;
            }
            .logo_grow_alt:hover .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg) scale(0);
                transform: translate(-50%, -50%) rotate(45deg) scale(0);
                opacity: 0;
            }

            @-webkit-keyframes grow_alt {
                0% {
                    -webkit-transform: translateX(-50%) scale(0);
                    transform: translateX(-50%) scale(0);
                }
                80% {
                    -webkit-transform: translateX(-50%) scale(1.2);
                    transform: translateX(-50%) scale(1.2);
                }
                100% {
                    -webkit-transform: translateX(-50%) scale(1);
                    transform: translateX(-50%) scale(1);
                }
            }

            @keyframes grow_alt {
                0% {
                    -webkit-transform: translateX(-50%) scale(0);
                    transform: translateX(-50%) scale(0);
                }
                80% {
                    -webkit-transform: translateX(-50%) scale(1.2);
                    transform: translateX(-50%) scale(1.2);
                }
                100% {
                    -webkit-transform: translateX(-50%) scale(1);
                    transform: translateX(-50%) scale(1);
                }
            }
            .logo_rotate .logo {
                -webkit-transform: translateX(-50%) rotate(90deg);
                transform: translateX(-50%) rotate(90deg);
                -webkit-transition: -webkit-transform 1s ease;
                transition: -webkit-transform 1s ease;
                transition: transform 1s ease;
                transition: transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_rotate .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg);
                transform: translate(-50%, -50%) rotate(45deg);
                -webkit-transition: opacity .5s ease, -webkit-transform .5s ease;
                transition: opacity .5s ease, -webkit-transform .5s ease;
                transition: opacity .5s ease, transform .5s ease;
                transition: opacity .5s ease, transform .5s ease, -webkit-transform .5s ease;
            }
            .logo_rotate:hover .logo {
                -webkit-transform: translateX(-50%) rotate(0);
                transform: translateX(-50%) rotate(0);
            }
            .logo_rotate:hover .icon_contain .icon {
                fill: #eb3f32;
            }
            .logo_rotate:hover .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(135deg);
                transform: translate(-50%, -50%) rotate(135deg);
                opacity: 0;
            }

            .logo_rotate_alt .logo {
                -webkit-animation: rotate_alt 1s reverse;
                animation: rotate_alt 1s reverse;
                -webkit-transform: translateX(-50%) scale(0);
                transform: translateX(-50%) scale(0);
            }
            .logo_rotate_alt .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg) scale(1);
                transform: translate(-50%, -50%) rotate(45deg) scale(1);
                -webkit-transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, transform 1s ease;
                transition: opacity 1s ease, transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_rotate_alt:hover .logo {
                -webkit-animation: rotate_alt .7s ease-out;
                animation: rotate_alt .7s ease-out;
                -webkit-transform: translateX(-50%) scale(1);
                transform: translateX(-50%) scale(1);
            }
            .logo_rotate_alt:hover .icon_contain .icon {
                fill: #eb3f32;
            }
            .logo_rotate_alt:hover .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(135deg) scale(0);
                transform: translate(-50%, -50%) rotate(135deg) scale(0);
                opacity: 0;
            }

            @-webkit-keyframes rotate_alt {
                0% {
                    -webkit-transform: translateX(-50%) rotate(90deg) scale(0);
                    transform: translateX(-50%) rotate(90deg) scale(0);
                }
                80% {
                    -webkit-transform: translateX(-50%) rotate(-15deg) scale(1.2);
                    transform: translateX(-50%) rotate(-15deg) scale(1.2);
                }
                100% {
                    -webkit-transform: translateX(-50%) rotate(0) scale(1);
                    transform: translateX(-50%) rotate(0) scale(1);
                }
            }

            @keyframes rotate_alt {
                0% {
                    -webkit-transform: translateX(-50%) rotate(90deg) scale(0);
                    transform: translateX(-50%) rotate(90deg) scale(0);
                }
                80% {
                    -webkit-transform: translateX(-50%) rotate(-15deg) scale(1.2);
                    transform: translateX(-50%) rotate(-15deg) scale(1.2);
                }
                100% {
                    -webkit-transform: translateX(-50%) rotate(0) scale(1);
                    transform: translateX(-50%) rotate(0) scale(1);
                }
            }
            .logo_grow_rotate .logo {
                -webkit-transform: translateX(-50%) rotate(90deg) scale(0);
                transform: translateX(-50%) rotate(90deg) scale(0);
                -webkit-transition: -webkit-transform 1s ease;
                transition: -webkit-transform 1s ease;
                transition: transform 1s ease;
                transition: transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_grow_rotate .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(45deg) scale(1);
                transform: translate(-50%, -50%) rotate(45deg) scale(1);
                -webkit-transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, -webkit-transform 1s ease;
                transition: opacity 1s ease, transform 1s ease;
                transition: opacity 1s ease, transform 1s ease, -webkit-transform 1s ease;
            }
            .logo_grow_rotate:hover .logo {
                -webkit-transform: translateX(-50%) rotate(0) scale(1);
                transform: translateX(-50%) rotate(0) scale(1);
            }
            .logo_grow_rotate:hover .icon_contain .icon {
                fill: #eb3f32;
            }
            .logo_grow_rotate:hover .icon_contain::before {
                -webkit-transform: translate(-50%, -50%) rotate(135deg) scale(0);
                transform: translate(-50%, -50%) rotate(135deg) scale(0);
                opacity: 0;
            }

            .grid li {
                width: 50%;
                padding: 3em 0;
                float: left;
                border-right: 1px solid rgba(0, 0, 0, 0.25);
                border-bottom: 1px solid rgba(0, 0, 0, 0.25);
            }

            .grid li:nth-child(2n) {
                border-right: none;
            }

            .grid li:last-child {
                border-bottom: none;
            }

            .grid li:nth-last-child(2) {
                border-bottom: none;
            }

            @media (min-width: 45em) {
                .grid li {
                    width: 33.333333%;
                }

                .grid li:nth-child(2n) {
                    border-right: 1px solid rgba(0, 0, 0, 0.25);
                }

                .grid li:nth-child(3) {
                    border-right: none;
                }

                .grid li:last-child {
                    border-right: none;
                    border-bottom: none;
                }

                .grid li:nth-last-child(2), .grid li:nth-last-child(3) {
                    border-bottom: none;
                }
            }

            .kotak{
                position: relative;
                z-index: 1;
                display: block;
                font-family: 'Open Sans', sans-serif;
                font-weight: 300;
                font-size: 1.25em;
                text-decoration: none;
                color: #000;
                padding: 4.7em 1em 0em;
            }

            .main-dashboard a.thumbnail{
                max-height: none;
                padding: 3em 0;
            }

        </style>

    </head>

    <body>
        <div class="loading"></div>

        <!-- menu top -->
        <%@include file = "libraries/topMenus-dashboard.html" %>
        <!-- menu top -->

        <div class="container-fluid m-scene">
            <div class="row">
                <!-- code start -->
                <div class="twPc-div">
                    &nbsp;
                </div>
                <nav class="navbar navbar-default" style="height: 75px;">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNav">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div class="navbar-brand profile-userpic">
                                <img src="<%= my_1_gamba%>">
                            </div>
                            <span class="site-name" id="welcomeMain"></span>
                            <span class="site-description">System Admin</span>
                        </div>

                        <div class="collapse navbar-collapse" id="mainNav" >
                            <ul class="nav main-menu navbar-nav">
                                <li><a href="#" style="text-align: center;"><span class="p-label" id="pIC">123</span>Total Patient </a></a></li>
                                <li><a href="#" style="text-align: center;"><span class="p-label" id="pIC">43</span>Patient Consult</a></a></li>
                                <li><a href="#" style="text-align: center;"><span class="p-label" id="pIC">23</span>Total Discharge</a></a></li>
                            </ul>

                            <ul class="nav  navbar-nav navbar-right">
                                <li><button class="btn btn-default" style="margin-top: 18px;"><i class="fa fa-bars"></i> Quick Menus</button></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- code end -->

                <div class="container">

                    <div class="tabbable-panel">
                        <div class="tabbable-line">
                            <ul class="nav nav-pills ">
                                <li class="active">
                                    <a href="#tab_default_1" data-toggle="tab">
                                        Lists </a>
                                </li>
                                <li>
                                    <a href="#tab_default_2" data-toggle="tab">
                                        Modules </a>
                                </li>
                                <li>
                                    <a href="#tab_default_3" data-toggle="tab">
                                        Tab 3 </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_default_1">
                                    <div class="col-md-12 thumbnail">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1.</td>
                                                    <td>Mizi Khanapi</td>
                                                    <td><button class="btn btn-default">Consult</button></td>
                                                </tr>
                                                <tr>
                                                    <td>2.</td>
                                                    <td>Mizi Khanapi</td>
                                                    <td><button class="btn btn-default">Consult</button></td>
                                                </tr>
                                                <tr>
                                                    <td>3.</td>
                                                    <td>Mizi Khanapi</td>
                                                    <td><button class="btn btn-default">Consult</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_default_2">
                                    <!-- main -->		
                                    <div class="col-md-12 main-dashboard">
                                        <div class="row">
                                            <%                            if (mod01) {
                                            %>
                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../SystemAdmin/Lookup" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-gears" aria-hidden="true" style="color: #FDC671;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        System Administration
                                                    </div>
                                                </a>
                                            </div>

                                            <%
                                                }

                                                if (mod03) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../Registration/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-desktop" aria-hidden="true" style="color: #c0a16b;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Medical Kiosk
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../PMS/index.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-user-plus" aria-hidden="true" style="color: #17A086;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Outpatient Management
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod02) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../CIS/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-user-md" aria-hidden="true" style="color: #E84C3D;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Patient Consultation
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod04) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../PIS/Dispense_Drug_Order" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-medkit" aria-hidden="true" style="color: #9A67A0;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Pharmacy Info System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod05) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../LIS/Order_list" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-flask" aria-hidden="true" style="color: #F26353;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Laboratory Info System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod06) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../RIS/HIS060001.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-fire" aria-hidden="true" style="color: #2A80B9;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Radiology Information System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod07) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../ADT/HIS070001.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-bed" aria-hidden="true" style="color: #DE3975;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Inpatient Management
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod08) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../Billing/HIS080001.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-money" aria-hidden="true" style="color: #34A8DA;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Billing System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod03) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../Appointment/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-calendar" aria-hidden="true" style="color: #33B3AA;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Patient Appointment
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod11) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../Report/MainMenu.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-bar-chart" aria-hidden="true" style="color: #00dd1c;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Reports
                                                    </div>
                                                </a>
                                            </div>

                                            <%
                                                }

                                                if (mod21) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../CallingSystem" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-phone-square" aria-hidden="true" style="color: #FFB74D;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">

                                                        Calling System
                                                    </div>
                                                </a>
                                            </div>

                                            <%
                                                }

                                                if (mod18) {
                                            %>
                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../POM/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-book" aria-hidden="true" style="color: orange;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Procedure Order Management
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }//end if mod18

                                                if (mod19) {
                                            %>
                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../OperationTheater/index.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-user-md" aria-hidden="true" style="color:#0000A0;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Operation Theater
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }//end if mod19

                                                if (mod20) {
                                            %>                        
                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../QMS/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-users" aria-hidden="true" style="color:#ab47bc;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Queue Management
                                                    </div>
                                                </a>
                                            </div>                        
                                            <%
                                                }// end if mod20

                                                if (mod22) {
                                            %>                        
                                            <div class="col-xs-6 col-sm-6 col-md-4">
                                                <a href="../SMS/Distribution_Stock_Order" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="fa fa-cubes" aria-hidden="true" style="color:#777620;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Stock Management
                                                    </div>
                                                </a>
                                            </div>                        
                                            <%
                                                }// end if mod22
                                            %>

                                        </div>
                                    </div>   
                                </div>
                                <div class="tab-pane" id="tab_default_3">
                                    3
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>


            </div>
            <!-- main -->		

        </div>


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="libraries/script.html"%>
        <%@include file="../assets/script.html"%>
        <script type="text/javascript" >


            $(function () {
                // Handler for .ready() called.

                $.ajax({
                    type: 'POST',
                    url: "getUserName.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#welcomeMain').text(data.trim());
                        $('#welcome').text(data.trim());
                        console.log(data);
                    }});

            });
        </script>




    </body></html>
<%
    }//end try
    catch (Exception e) {
        System.out.println("Entering dashboard");
        e.printStackTrace();
        out.print("<h1>Oopps! Something went wrong. Try again later.</h1>");
    }
%>
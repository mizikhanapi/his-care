<%-- 
    Document   : side_profile
    Created on : May 1, 2017, 9:55:21 PM
    Author     : user
--%>

<%
    String my_1_gamba = "";
    String my_1_nama = "";
    String my_1_role = "";
    String my_1_hfcName = "";
    String my_1_hfc_cd = "";
    String my_1_user_id = "";
    String my_1_dis_cd = "";
    String my_1_sub_cd = "";
    String my_1_dis_name = "";
    String my_1_sub_name = "";

    if (session.getAttribute("USER_NAME") != null) {

        my_1_gamba = session.getAttribute("PICTURE").toString();
        my_1_nama = session.getAttribute("USER_NAME").toString();
        my_1_role = session.getAttribute("ROLE_NAME").toString();
        my_1_hfcName = session.getAttribute("HFC_NAME").toString();
        my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        my_1_user_id = (String) session.getAttribute("USER_ID");
        my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        my_1_dis_name = (String) session.getAttribute("DISCIPLINE_NAME");
        my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
        my_1_sub_name = (String) session.getAttribute("SUB_DISCIPLINE_NAME");

    }

%>

<li class="dropdown user user-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <img src="<%= my_1_gamba%>" class="user-image" alt="User Image">
        <span class="hidden-xs top-profile" style="text-transform: lowercase;"><%=my_1_nama%></span>
    </a>
    <ul class="dropdown-menu">
        <!-- User image -->
        <li class="user-header">
            <img src="<%= my_1_gamba%>" class="img-circle" alt="User Image">

            <p style="text-transform: lowercase;">
                <%=my_1_nama%> - <%= my_1_role%>
                <small><%=my_1_user_id%></small>
            </p>
        </li>
        <!-- Menu Body -->
        <li class="user-body">
            <div class="row">
                <div class="col-xs-4 text-center">
                    <a href="#"><%= my_1_hfcName%></a>
                </div>
                <div class="col-xs-4 text-center">
                    <a href="#"><%= my_1_dis_name%></a>
                </div>
                <div class="col-xs-4 text-center">
                    <a href="#"><%= my_1_sub_name%></a>
                </div>
            </div>
            <!-- /.row -->
        </li>
        <!-- Menu Footer-->
        <li class="user-footer">
            <div class="pull-left">
                <button type="button" class="btn btn-default btn-flat" onclick="window.location.href = '../Entrance/Profile'">Manage Account</button>
            </div>
            <div class="pull-right">
                <a href="../Entrance/destroySession.jsp" id="btnCIS_LOGOUT" class="btn btn-default btn-flat">Sign out</a>
            </div>
        </li>
    </ul>
</li>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String wclass, wclassid, wstatus, dis, wbedid;

    wclass = request.getParameter("Ward_Class");
    wclassid = request.getParameter("Ward_ID");
    dis = request.getParameter("Dis");
    wbedid = request.getParameter("BedID");
    wstatus = request.getParameter("status");

    String bedName = "bed name";

    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);

    String hfc = request.getParameter("hfc");
    String sub = request.getParameter("sub");

    String createdBy = request.getParameter("createdBy");

    String sqlCheck = "Select * From wis_bed_id WHERE bed_id = '" + wbedid + "' ";
    ArrayList<ArrayList<String>> dataCheck = conn.getData(sqlCheck);

    if (dataCheck.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO wis_bed_id(ward_id,ward_class_code,bed_id, bed_status,bed_name,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) "
                + "VALUES ('" + wclassid + "','" + wclass + "','" + wbedid + "','" + wstatus + "','" + bedName + "','" + hfc + "','" + dis + "','" + sub + "','" + createdBy + "',now())";
        //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }


%>
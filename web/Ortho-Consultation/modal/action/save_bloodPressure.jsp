<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    String my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    String sitS = request.getParameter("sitS");
    String sitD = request.getParameter("sitD");
    String sitP = request.getParameter("sitP");
    String encounter_date = request.getParameter("encounter_date");
                              
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "UPDATE lhr_ort_neu_observation_chart SET systolic = '"+sitS+"',diastolic = '"+sitD+"',pulse = '"+sitP+"' WHERE pmi_no = '" + pmino + "' AND hfc_cd = '"+hfc+"' AND episode_date = '"+episodeDate+"' AND encounter_date = '"+encounter_date+"' AND discipline_cd = '"+my_1_dis_cd+"' AND subdiscipline_cd='"+my_1_sub_cd+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>

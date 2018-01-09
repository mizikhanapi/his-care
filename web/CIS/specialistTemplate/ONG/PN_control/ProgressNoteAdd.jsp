<%-- 
    Document   : ProgressNoteAdd
    Created on : Oct 3, 2017, 8:52:58 PM
    Author     : -D-
--%>

<%-- 
    Document   : ProgressNoteRetrieve
    Created on : Oct 3, 2017, 10:29:33 PM
    Author     : -D-
--%>
<%@page import="main.RMIConnector"%>
<%@page import="Formatter.ConvertMasa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="OnG_helper.ProgressNote"%>


<%

    Conn con = new Conn();
     RMIConnector rmi = new RMIConnector();
    
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String user_id = (String) session.getAttribute("USER_ID");

    String episodeDate = request.getParameter("episodeDate");
    String encounterDate = request.getParameter("encounterDate");
    String note = request.getParameter("note");
    


            String sql = "INSERT INTO emedica.lhr_ong_progress_notes (pmi_no, hfc_cd, episode_date, encounter_date, `Clinical_Notes`, created_date, created_by) \n"
                    + "	VALUES ('" + pmiNo + "', '" + hfc + "', '" + episodeDate + "', '" + encounterDate + "', '" + note + "', NOW(), '" + user_id + "')";
            
       
            Boolean state = rmi.setQuerySQL(con.HOST, con.PORT, sql);
            
            
            
        if(state){
            out.print("1");
        }else{
            out.print("0");
            
        }



%>
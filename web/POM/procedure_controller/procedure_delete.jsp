<%-- 
    Document   : procedure_delete
    Created on : May 10, 2017, 7:11:58 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String code = request.getParameter("code");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String sqlCheck = "Select procedure_cd from cis_procedure_1 where procedure_cd = '"+code+"' and hfc_cd = '"+hfc_cd+"' limit 1";
    ArrayList<ArrayList<String>> looked = conn.getData(sqlCheck);
    
    if(looked.size() > 0){
        out.print("look");
    
    }else{
        RMIConnector rmi = new RMIConnector(); 
        String query = "Delete from cis_procedure where procedure_cd = '"+code+"' AND hfc_cd = '"+hfc_cd+"'";
        boolean isDelete = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isDelete){
            out.print("success");
        }else{
            out.print("fail");
        }
        
    
    }
%>

<%-- 
    Document   : searchTitle
    Created on : Mar 13, 2017, 5:17:12 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String input = request.getParameter("input");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String searchProblem = "select hfc_name from adm_health_facility where CONCAT(UPPER(hfc_name),LOWER(hfc_name)) like '%" + input + "%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListHFC" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>

<%-- 
    Document   : SearchDiscipline
    Created on : 17-Feb-2017, 11:26:49
    Author     : ahmed
--%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%--<%@page import=""%>--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
   // String key = request.getParameter("input");
   Conn conn = new Conn();
    String id = StringUtils.trim(request.getParameter("id"));
    String searchProblem = "select d.discipline_name from adm_discipline d,adm_hfc_discipline hfcd where d.discipline_cd = hfcd.discipline_cd and d.discipline_hfc_cd = hfcd.hfc_cd and hfcd.hfc_cd='"+id+"' GROUP BY d.discipline_cd;";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    //out.print(search);
    //out.print(searchProblem);
   
//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
//            out.print(String.join("|", search.get(i)));
//        }
//    }
%>
  <div class="form-group">
                    <select name="hhh" id="hfcDiscipline1" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Discipline</option>
                        <% if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
                         //out.print(String.join("|", search.get(i).get(1)));
                        %>
                        <option value="<%=search.get(i).get(0)%>"><%=search.get(i).get(0)%></option>
                        <%}}%>
                    </select>
</div>
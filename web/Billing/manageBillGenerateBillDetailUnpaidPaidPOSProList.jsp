<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidPOSProList
    Created on : Oct 31, 2017, 1:27:42 PM
    Author     : Shammugam
--%>

<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<table id="tablePOSProc" class="table table-filter table-bordered">
    <thead>
    <th>Item Code</th>
    <th>Item Name</th>
    <th style="text-align: right;">Price (RM)</th>
</thead>
<tbody>
    <%
        String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

        DecimalFormat df = new DecimalFormat("0.00");
        String query = "SELECT PROCEDURE_CD, PROCEDURE_NAME, selling_price "
                + " FROM cis_procedure "
                + " WHERE hfc_cd = '" + hfc_cd + "'  ";
        ArrayList<ArrayList<String>> data2 = Conn.getData(query);
        if (!data2.isEmpty()) {
            for (int i = 0; i < data2.size(); i++) {
    %>
    <tr>

        <td><%=data2.get(i).get(0)%></td>
        <td><%=data2.get(i).get(1)%></td>
        <td style="text-align: right;"><%=df.format(Double.parseDouble(data2.get(i).get(2)))%></td>
    </tr>
    <%}
    }%>
</tbody>
</table>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tablePOSProc tbody tr").click(function () {
            $('tr.row_selected').removeClass('row_selected selectedtr');
            $(this).addClass('row_selected selectedtr');
        });
    });
</script>

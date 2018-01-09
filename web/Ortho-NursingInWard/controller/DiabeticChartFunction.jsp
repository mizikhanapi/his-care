<%-- 
    Document   : DiabeticChartFunction
    Created on : Jul 14, 2017, 6:08:11 PM
    Author     : Shammugam
--%>


<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="NIW_helper.DiabeticChartUtils"%>
<%@page import="java.util.ArrayList"%>
<%
    DiabeticChartUtils diab = new DiabeticChartUtils();
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");

    String created_by_name = session.getAttribute("USER_NAME").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdiscipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);

    String longString = "|" + created_by_name + "|" + discipline + "|" + subdiscipline + "|" + created_by + "|" + created_date;

    Boolean result;
    if (methodName.equalsIgnoreCase("add")) {
        result = diab.addDiabetic(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = diab.updateDiabetic(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = diab.delDiabetic(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("approve")) {
        result = diab.approveDiabetis(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = diab.getDiabetic(data);

%>
<div class="table-guling">
    <table class="table table-bordered" id="tableDiabeticChartTable" style="width: 100%">
        <thead>
        <th>Date</th>
        <th>Time</th>
        <th>Dextrostix</th>
        <th>Doctor Name</th>
        <th>Approval</th>
        <th>Action</th>
        </thead>
        <tbody>
            <% for (int i = 0; i < datas.size(); i++) {%>
            <tr>
        <input id="dataDiabeticCharthidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
        <td><%=datas.get(i).get(7)%></td>
        <td><%=datas.get(i).get(6)%></td>
        <td><%=datas.get(i).get(8)%></td>
        <td><%=datas.get(i).get(9)%></td>
        <td>
            <%
        if (datas.get(i).get(10).equalsIgnoreCase("pending")) { %>


            <button class="btn btn-warning btn-block" id="tableDiabeticChartPendingBtn"><i class="fa fa-check-square-o"></i> Pending</button>

            <%          } else if (datas.get(i).get(10).equalsIgnoreCase("approved")) { %>

            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
            <%    }
            %>
        </td>
        <td>
            <%
        if (datas.get(i).get(10).equalsIgnoreCase("pending")) { %>

            <a data-toggle="modal" data-target="#edit" id="tableDiabeticChartUpdateBtn"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <%  } %>
            &nbsp;
            <a id="tableDiabeticChartDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
        </tr> 
        <%    } %>
        </tbody>

    </table>
</div>
<script>
    $('#tableDiabeticChartTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>

<% }%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="bean.Calling_system_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>

<p style="text-align: right; position: absolute; top: 80px; left: 30px; color: #666; display: block; font-weight: 500; font-size: 24px;"><%

    String hfccd = "-";
    String discp = "-";
    String subdi = "-";
    String lang = "-";
    String initial = "-";
    String filterType = (String) session.getAttribute("CS_PARAM");
    Conn conn = new Conn();
    try {
        hfccd = request.getParameter("hfccd");
        discp = request.getParameter("discp");
        subdi = request.getParameter("subdi");
        lang = request.getParameter("lang");
        initial = request.getParameter("initial");

    } catch (Exception e) {
    }

    String hfccd_str = "";
    if (hfccd != "") {
        hfccd_str = " cs_hfc_cd = '" + hfccd + "'";
    }
    String discp_str = "";
    if (discp != "") {
        discp_str = " AND cs_discipline = '" + discp + "'";
    }
    String subdi_str = "";
    if (subdi != "") {
        subdi_str = " AND cs_sub_discipline = '" + subdi + "'";
    }

    String sql = "SELECT Id,cs_patient_name,cs_queue_no,cs_queue_name,cs_callingtime,cs_room_no FROM qcs_calling_system_queue";
    String fullSql = "";
    if (filterType.equalsIgnoreCase("0")) {
        fullSql = sql + " WHERE " + hfccd_str + discp_str + subdi_str + " and cs_callingtime > 0 and date(cs_datetime) = date(curdate())order by id asc limit 1";
    } else {
        fullSql = sql + " WHERE " + hfccd_str + discp_str + " and cs_callingtime=0 and date(cs_datetime) = date(curdate())order by id";
    }
    Query q = new Query();
    //ArrayList<Calling_system_bean> d = q.getQueryCallingSystem(sql);
    ArrayList<ArrayList<String>> d = conn.getData(fullSql);

    Date datenow = new Date();
    SimpleDateFormat tarikh = new SimpleDateFormat("dd/MM/YYYY");
    SimpleDateFormat masa = new SimpleDateFormat("HH:mm");
    SimpleDateFormat formate = new SimpleDateFormat("a");

    %></p>
<div id="callerTable">
    <%            if (d.size() > 0) {
            for (int i = 0; i < d.size(); i++) {
                String cs_id = d.get(i).get(0);
                String number = d.get(i).get(4);
                int cs_callingtime = Integer.parseInt(number);
    %>
    <div class="calling-queueNo">
        <h3 style="font-size: 20px;margin: 10px 0 0;">Queue No.</h3>
        <h1 id="qno_<%=i%>" style="font-size: 100%;margin: 0px;"><%=d.get(i).get(2)%></h1>
        <dt id="name_<%=i%>" style="font-size: 15px;">(<%=d.get(i).get(1)%>)</dt>
        <h4 style="font-size: 20px;margin: 0px;">Room No: <span id="qname_<%=i%>"><%=d.get(i).get(5)%></span></h4>
        <%
              String myString = d.get(i).get(2);
        %>
        <div id="view_VS"></div>
        <div>
            <input type="hidden" value="<%=d.get(i).get(0)%>" id="idCaller">
            <button class="btn btn-link" id="delCaller"><i class="fa fa-times"></i></button>
        </div>
    </div>  
    <%
            }
        }
    %>
</div>

<script>
    $('#callerTable #delCaller').on('click', function () {
        var row = $(this).closest('.queue-no');
        var idCaller = row.find('#idCaller').val();
        console.log(idCaller);
        bootbox.confirm({
            message: "Are you sure want to DELETE PATIENT CALLING?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                //if true go to PMI page
                if (result === true) {


                    $.ajax({
                        type: "post",
                        url: "delCaller.jsp",
                        data: {id: idCaller},
                        success: function (databack) {
                            console.log(databack);
                            if ($.trim(databack) === "success") {
                                bootbox.alert("success");
                            } else if ($.trim(databack) === "error") {
                                bootbox.alert("fail");
                            }

                        }
                    });
                }
            }
        });

    });
</script>

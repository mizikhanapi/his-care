<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>


<div class="table-guling" id="orderTable">
    <%
        Conn conn = new Conn();
        String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + my_1_hfc_cd + "'";
        ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_logo);
        String masterCode = request.getParameter("process");
        //out.print(masterCode);
        LocalDate localDate = LocalDate.now();
        String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
        String query1 = "";
        if ((masterCode.equals("0"))) {
            query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status = '0' AND lis_order_master.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
        } else if ((masterCode.equals("1"))) {
            query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status = '1' AND lis_order_master.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
        } else if ((masterCode.equals("2"))) {
            query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status = '2' AND lis_order_master.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
        } else if ((masterCode.equals("3"))) {
            query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status = '3' AND lis_order_master.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
        } else if ((masterCode.equals("4"))) {
            query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status = '4' AND lis_order_master.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
        } else if ((masterCode.equals("5"))) {
            query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.hfc_cd = '" + my_1_hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
        }
        ArrayList<ArrayList<String>> q1 = conn.getData(query1);
    %>

    <table id="OS"  class="table table-striped table-bordered" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th >Order No</th>
                <th >Pmi No</th>
                <th >HFC Name</th>
                <th >Episode Date</th>
                <th >Encounter Date</th>
                <th >Created By</th>
                <th> Patient Name</th>
            </tr>
        </thead>
        <tbody>

            <%
                if (q1.size() > 0) {
                    for (int i = 0; i < q1.size(); i++) {

            %>
            <tr>
                <td><%=q1.get(i).get(0)%></td>
                <td><%=q1.get(i).get(1)%></td>
                <td><%=q1.get(i).get(2)%></td>
                <td><%=q1.get(i).get(3)%></td>
                <td><%=q1.get(i).get(4)%></td>
                <td><%=q1.get(i).get(5)%></td>
                <td><%=q1.get(i).get(7)%></td>
            </tr>
            <% }
                }
            %>
        </tbody>
    </table>
</div>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        
        $('#OS').DataTable({
            language: {
                emptyTable: "No receive specimen for today"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            },
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf',
                {
                    extend: 'print',
                    title: $('h1').text(),
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Laporan ICD10</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    }
                }

            ]
        });
    });
</script>


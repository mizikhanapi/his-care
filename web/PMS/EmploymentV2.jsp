<%@page import="java.util.ArrayList"%>
<%--<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Conn conn = new Conn();
    String incomeRange5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0028' AND hfc_cd = '"+hfc+"' and status ='0'";
    String hcf5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0081' AND hfc_cd = '"+hfc+"' and status ='0'  ";
    String status5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0014' AND hfc_cd = '"+hfc+"' and status ='0'  ";
    String occupation5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0050' AND hfc_cd = '"+hfc+"' and status ='0'";

    //String empList = "select * from pms_employment where pmi_no = ''";
    ArrayList<ArrayList<String>> dataIncomeRange5, dataHfc5, dataStatus5, dataOccu5;

    dataIncomeRange5 = conn.getData(incomeRange5);
    dataHfc5 = conn.getData(hcf5);
    dataStatus5 = conn.getData(status5);
    dataOccu5 = conn.getData(occupation5);


%>
<div class="row">
    <div class="col-md-12">

        <div id="modalEMP"><%@include file = "EmploymentModal.jsp" %></div>
        <h4>List of Employments
            <button id="addEMPmodal" name="addEMPmodal" class="btn btn-success pull-right" data-toggle="modal" data-target="#EMPModal"><i class="fa fa-plus"></i>&nbsp; Add Employment Information</button></h4>
        <br/>
        <div id="tableListEmp" class="form-group">


            <table class="table table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; " id="listEMP">
                <thead>
                <th>Employer Name</th>
                <th>Occupation</th>
                <th style="width: 5%;">Update</th>
                <th style="width: 5%;">Delete</th>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
//    $('#modalEMP').load('EmploymentModal.jsp');
    $('#modalEMP').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });



    //function to edit employment data from table
    $('#tableListEmp').on('click', '#listEMP #EMPedit', function (e) {
        //prevent any default function
        e.preventDefault();

        $('#EMPpmino').prop('readonly', true);

        //go to the top
        $('html,body').animate({
            scrollTop: $("#maintainEMP").offset().top
        }, 500);
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#empval").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var pmino = arrayData[0], seqno = arrayData[1], empcode = arrayData[2], empname = arrayData[3], occu = arrayData[4], jdate = arrayData[5], incomerange = arrayData[6], hfc = arrayData[7], credate = arrayData[8], empstatus = arrayData[9], empoccuName = arrayData[10], emphfcName = arrayData[11];
        //convert date
        var splitCreDate = String(credate).split("-");
        var convertedCreDate = splitCreDate[2] + "/" + splitCreDate[1] + "/" + splitCreDate[0];

        var splitJDate = String(jdate).split("-");
        var convertedJDate = splitJDate[2] + "/" + splitJDate[1] + "/" + splitJDate[0];
//        console.log(convertedCreDate);
//        console.log(convertedJDate);

        $('#EMPpmino').val(pmino);
        $('#EMPempcode').val(empcode);
        $('#EMPempname').val(empname);
        $('#EMPoccu').val(empoccuName);
        $('#EMPjdate').val(convertedJDate);
        $('#EMPinrange').val(incomerange);
        $('#EMPhfc').val(emphfcName);
        $('#EMPcredate').val(convertedCreDate);
        $('#EMPstatus').val(empstatus);
        $('#EMPseq').val(seqno);

        $("#EMPhfcCODE").val(hfc);
        $("#EMPoccuCODE").val(occu);

        console.log(arrayData);
    });


    $('#tableListEmp').on('click', '#listEMP #EMPdel', function (e) {
        e.preventDefault();
        var row2 = $(this).closest("tr");
        var rowData2 = row2.find("#empval").val();

        console.log(rowData2);
        bootbox.confirm({
            message: "Are you sure want to delete patient's Employment Information?",
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

                if (result === true) {
                    //get the row value
                    row2.remove();
                    var arrayData2 = rowData2.split("|");
                    //assign into seprated val
                    var pmino = arrayData2[0], seqno = arrayData2[1];
                    var datas = {pmino: pmino, seqno: seqno};
                    console.log(datas);
                    $.ajax({
                        type: "post",
                        url: "controller/delEmp.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);


                        }, error: function () {

                        }

                    });
                }
            }
        });
    });

</script>
<%-- 
    Document   : searchMc
    Created on : Apr 17, 2017, 3:16:53 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>  
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataIdType;
    Conn conn = new Conn();
    dataIdType = conn.getData(idTYpe);
    String dataSystemStatus = "1"; //session.getAttribute("SYSTEMSTAT").toString();
%>
<h4>Search Patient
    <!--        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>-->
</h4>
<form class="form-horizontal" name="myForm" id="myForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
        <div class="col-md-4">
            <select id="tsType" name="tsType" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select ID type</option>
                <!--                    <option value="pmino">PMI No</option>
                                    <option value="icnew">IC No (NEW)</option>
                                    <option value="icold">IC No (OLD)</option>
                                    <option value="matricno">Matric No</option>
                                    <option value="staffno">Staff No</option>-->
                <%                                if (dataSystemStatus.equals("0")) {

                    } else if (dataSystemStatus.equals("1")) {
                        for (int i = 0; i < dataIdType.size(); i++) {%>
                <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
                <%  }
                    }

                %>
            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="tsInput" name="tsInput" placeholder="ID" maxlength=""/>
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

        <button id="clearSearch" name="clearSearch" type="clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
    </div>
</form>


<script>
    //validate max length of input
    $('#tsType').on('change', function () {
        var id = $('#tsType').val();
        if (id === "001") {
            $('#tsInput').attr('maxlength', '13');
        } else if (id === "002") {
            $('#tsInput').attr('maxlength', '12');
        } else if (id === "003") {
            $('#tsInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#tsInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#tsInput').attr('maxlength', '10');
        }
    });


    //event on click search button
    $('#searchPatient').on('click', function () {
        searchPatient();
    });


    //seaching patient function   
    function searchPatient() {

        var opt = $('#tsType option[disabled]:selected').val();

        //check if the input text or the select box is empty.

        if ($('#tsInput').val() === "" || $('#tsInput').val() === " ") {
            //if the id/ic input is empty
            alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            alert('Please select ID Type first.');
        } else {
            //if the select box is choosen and the input in key-in.

            //get value from text box and select box
            var tsType = $('#tsType').find(":selected").val();
            var tsInput = $('#tsInput').val();

            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "tsTable.jsp",
                data: {'tsType': tsType, 'tsInput': tsInput},
                timeout: 10000,
                success: function (list) {

                    //split the data into an array

                    //function when the value that returned either empty/null or has value.
                    //customize this part only
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    $('#tsTableDivision').html(list);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
                }
            });
        }
    }


    //event when press ENTER after inserting the ID
    $("#tsInput").on("keydown", function (e) {

        var code = e.keyCode;
        if (code === 13) {
            e.preventDefault();
            searchPatient();
        }

    });


    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#tsInput').prop('readonly', false);
        $('#myForm2')[0].reset();
        $('#myForm')[0].reset();
    });
</script>
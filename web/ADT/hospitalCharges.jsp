
<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--    <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">-->
    <!--    <script src="old/assets/js/jquery.min.js"></script>-->
    <!-- Custom styles for this template -->

    <link rel="stylesheet" href="old/assets/css/loading.css">
    <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
    <script src="old/assets/datepicker/jquery-ui.js"></script>
    <script src="old/assets/js/form-validator.min.js"></script>
    <script src="old/assets/js/bootstrap.min.js"></script> 

    <script src="old/assets/js/w3data.js"></script>
    <script src="old/assets/js/bootbox.min.js"></script>   

    <!-- header -->
    <%@include file = "../assets/header.html" %>

    <!-- header -->
</head>

<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063' and hfc_cd ='" + hfc + "'  ";
    ArrayList<ArrayList<String>> dataRole2, dataEliCat, dataAdmit, dataEliType, dataDocumentType, dataIdType, dataPayerGroup;
    dataEliCat = conn.getData(eliCat);


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="Rdis">
<input type="hidden" value="<%=sub%>" id="Rsub">


<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MAINTAIN HOSPITAL CHARGES
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detailID" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="C_ADD"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD HOSPITAL CHARGES</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detailID" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="width:100%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineIDLabel">Add Hospital Charges</h3>
            </div>
            <div class="modal-body" style="width:100%" >

                <!-- content goes here -->
                <form class="form-horizontal" id="addIDForm">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="selectbasic">Discipline *</label>
                                <div class="col-md-6">
                                    <input id="Dis" name="Dis" placeholder="Insert Discipline Code" maxlength="30" type="text"  class="form-control input-md">
                                    <div id="disList" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Subdiscipline *</label>
                                <div class="col-md-6">
                                    <input id="sub" name="sub" type="text" placeholder="Insert Sub Discipline Code" class="form-control input-md">
                                    <div id="subList" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!--                        <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-6 control-label" for="textinput">Eligibility Sources *</label>
                                                        <div class="col-md-6">
                                                            <input id="eliSrc" name="eliSrc" type="text" placeholder="Insert Eligibility Sources" class="form-control input-md">
                                                            <input type="hidden" id="eliSrc_cd">
                                                            <div id="eliSrcList" class="search-drop"></div>
                                                        </div>
                                                    </div>
                                                </div>-->

 <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="selectbasic">Eligibility Source*</label>
                            <div class="col-md-6">
                                <input type="hidden" id="eliSrc_cd">

                                <select id="eliSrc" name="eliSrc" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" >Select Eligibility Source</option>


                                    <%                                        for (int i = 0; i < dataEliCat.size(); i++) {%>
                                    <option value="<%=dataEliCat.get(i).get(1)%>"><%=dataEliCat.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div> 
                                                            </div> 

                        </div>



                        <!--                        <div class="form-group">
                                                    <div class="col-md-6">
                                                        <label class="col-md-6 control-label" for="selectbasic">Eligibility Type*</label>
                                                        <div class="col-md-6" id="EligibilityTypeDropdown">
                                                            <select id="EliTy" name="selectbasic" class="form-control" disabled="">
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                        -->


                        <div class="form-group">
                            <div class="col-md-6">
                            <label class="col-md-6 control-label" for="selectbasic">Eligibility Type*</label>
                            <div class="col-md-6" id="EligibilityTypeDropdown">
                                <select id="EliTy" name="selectbasic" class="form-control" disabled="">


                                </select>
                            </div>
</div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Ward Class</label>
                                <div class="col-md-6">
                                    <input  id="wclass" placeholder="Insert Ward Class" maxlength="30" type="text"   class="form-control input-md" >
                                    <input  type="hidden" id="wclass_cd">
                                    <div id="wclassList" class="search-drop"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <!--                        <div class="col-md-6">
                        
                                                    <div class="form-group">
                                                        <label class="col-md-6 control-label" for="textinput">Ward Name</label>
                                                        <div class="col-md-6">
                                                            <input  id="wname" name="wname" placeholder="Insert Ward Name" maxlength="30"  class="form-control input-md">
                                                            <input type="hidden" id="wname_cd">
                                                            <div id="wnameList" class="search-drop"></div>
                                                        </div>
                                                    </div>
                                                </div>
                        -->

                        <!-- Select Basic -->
                        <div class="col-md-6">

                            <div class="form-group">

                                <label class="col-md-6 control-label" for="selectbasic">Ward Name*</label>
                                <div class="col-md-6" id="WardNameDropdown">

                                    <select id="wname" name="selectbasic" class="form-control" disabled="">


                                    </select>
                                    <input  type="hidden" id="wclass_cd">
                                </div>

                            </div>
                        </div>

                    </div>





            </div>


            <div class="row">
                <div class="col-md-6">
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-6 control-label" for="selectbasic">Charges Type *</label>
                        <div class="col-md-6">
                            <input id="ChargeType" name="ChargeType" placeholder="Insert Charges Type" maxlength="30" type="text"  class="form-control input-md">
                            <input type="hidden" id="ChargeType_cd">
                            <div id="ChargeTypeList" class="search-drop"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-6 control-label" for="textinput">Charge Fees *</label>
                        <div class="col-md-6">
                            <input id="ChargeFees" name="ChargeFees" type="text" placeholder="Insert Charges Fees" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </div>




            </form>
        </div>
        <!-- content goes here -->

        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                <div class="btn-group" role="group">
                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MWID_add">Add</button>
                </div>
                <div class="btn-group" role="group">
                    <button type="reset" id="MWID_clear" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!--<script src="bootstrap-3.3.6-dist/js/jquery-2.1.4.js" type="text/javascript"></script>
<script src="bootstrap-3.3.6-dist/js/bootstrap.min.js" type="text/javascript"></script>

<script src="http://www.w3schools.com/lib/w3data.js"></script>-->
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
<!--<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>-->


<script>
    w3IncludeHTML();
    $(document).ready(function () {


        $("#wclass").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();
            var dis = $("#Rdis").val();




            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#wclassList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc, dis: dis}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchWardClass.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#wclassList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#wclass').val($(this).text());
                            $('#wclassList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#wclass').val().split("|");
                            var wclasscode = arrayData[0];
                            $('#wclass_cd').val(wclasscode);

                            $.ajax({
                                type: "post",
                                url: "listWardName2.jsp",
                                data: {'wclasscode': wclasscode, 'hfc': hfc},
                                timeout: 10000,
                                success: function (list) {
                                    //remove the loading 
                                    //$body.removeClass("loading");
                                    console.log(list);
                                    $('#WardNameDropdown').html(list);

                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    //bootbox.alert(err.Message);
                                }
                            });
                        });
                    },
                    error: function () { // if error
                        $('#wclassList').text('Problem!');
                    }
                });
            } else {
                $('#wclassList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });

        $("#wname").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();
            var dis = $("#Rdis").val();




            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#wnameList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc, dis: dis}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchWardName.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#wnameList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#wname').val($(this).text());
                            $('#wnameList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#wname').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#wnameList').text('Problem!');
                    }
                });
            } else {
                $('#wnameList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        $("#Dis").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();
            var dis = $("#Rdis").val();




            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#disList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc, dis: dis}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#disList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#Dis').val($(this).text());
                            $('#disList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#Dis').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#disList').text('Problem!');
                    }
                });
            } else {
                $('#disList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });

//        $("#eliSrc").on('keyup', function () { // everytime keyup event
//            var input = $(this).val(); // We take the input value
//            var hfc = $("#Rhfc").val();
//            var EliSrc = $("#eliSrc").val();
//
//
//
//            if (input.length >= 1) { // Minimum characters = 2 (you can change)
//                $('#eliSrcList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
//                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
//                $.ajax({
//                    type: "POST",
//                    url: "searchEligibilitySource.jsp", // call the php file ajax/tuto-autocomplete.php
//                    data: dataFields, // Send dataFields var
//                    timeout: 3000,
//                    success: function (dataBack) { // If success
//                        $('#eliSrcList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
//                        $('#matchListDis li').on('click', function () { // When click on an element in the list
//                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
//                            $('#eliSrc').val($(this).text());
//                            $('#eliSrcList').text(''); // Clear the <div id="match"></div>
//                            var arrayData = $('#eliSrc').val().split("|");
//                            //console.log(arrayData);
//                            //console.log(arrayData[0].trim());
//                            //console.log(arrayData[1].trim());
//                            $.ajax({
//                                type: "post",
//                                url: "PMS/listEliTy.jsp",
//                                data: {'EliSrc': EliSrc, 'hfc': hfc},
//                                timeout: 10000,
//                                success: function (list) {
//                                    //remove the loading 
//                                    //$body.removeClass("loading");
//                                    console.log(list);
//                                    $('#EligibilityTypeDropdown').html(list);
//
//                                },
//                                error: function (xhr, status, error) {
//                                    var err = eval("(" + xhr.responseText + ")");
//                                    //bootbox.alert(err.Message);
//                                }
//                            });
//                        });
//                    },
//                    error: function () { // if error
//                        $('#eliSrcList').text('Problem!');
//                    }
//                });
//            } else {
//                $('#eliSrcList').text(''); // If less than 2 characters, clear the <div id="match"></div>
//            }
//
//        });
        
        
         $("#eliSrc").on('change', function () {
        var EliSrc = $(this).val();
        $.ajax({
            type: "post",
            url: "PMS/listEliTy.jsp",
            data: {'EliSrc': EliSrc},
            timeout: 10000,
            success: function (list) {
                //remove the loading 
                //$body.removeClass("loading");
                console.log(list);
                $('#EligibilityTypeDropdown').html(list);

            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                //bootbox.alert(err.Message);
            }
        });
    });
        
        
        
        
        
        
        
        $("#sub").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();



            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#subList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchSubDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#subList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#sub').val($(this).text());
                            $('#subList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#sub').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#subList').text('Problem!');
                    }
                });
            } else {
                $('#subList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        $("#ChargeType").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();



            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#ChargeTypeList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchChargeType.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#ChargeTypeList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#ChargeType').val($(this).text());
                            $('#ChargeTypeList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#ChargeType').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#ChargeTypeList').text('Problem!');
                    }
                });
            } else {
                $('#ChargeTypeList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });

        $('#C_ADD').on('click', function (e) {
            e.preventDefault();






            var eliSrc = $('#eliSrc').val();
            var eliTy = $('#eliTy').val();
            var Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var ChargeType = $('#ChargeType').val();
            var ChargeFees = $('#ChargeFees').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();


            //$('#Dis').val(Dis);
            // $('#sub').val(hfc);
            //$('#ChargeType').val(createdBy);
            //$('#ChargeFees').val(dis);
        });


        $('#MWID_add').on('click', function () {

           var eliSrc = $('#eliSrc').val();
 var EliTy = $('#EliTy').val();


            var wclass = $('#wclass').val();
            var array_wclass = wclass.split("|");
            var wclass = array_wclass[0];

            var wname = $('#wname').val();
            var array_wname = wname.split("|");
            var wname = array_wname[0];

            var Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];

            var sub = $('#sub').val();
            var array_sub = sub.split("|");
            var sub = array_sub[0];

            var ChargeType = $('#ChargeType').val();
            var array_ChargeType = ChargeType.split("|");
            var ChargeType = array_ChargeType[0];

            var ChargeFees = $('#ChargeFees').val();


            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();



            if (ChargeType === "") {
                bootbox.alert("Complete The Fields of Ward Class");
                return false;
            }
            if (ChargeFees === "") {
                bootbox.alert("Complete The Fields of Ward ID");
                return false;
            }
            if (wname === "") {
                bootbox.alert("Complete The Fields of Discipline");
                return false;
            }
            if (wclass === "") {
                bootbox.alert("Complete The Fields of Discipline");
                return false;
            }
            if (Dis === "") {
                bootbox.alert("Complete The Fields of Discipline");
                return false;
            }
            if (eliSrc === "") {
                bootbox.alert("Complete The Fields of Ward Name");
                return false;
            }
            if (EliTy === "") {
                bootbox.alert("Complete The Fields of Citizen Rates");
                return false;
            } else {
                var data = {
                    eliSrc: eliSrc,
                    EliTy: EliTy,
                    ChargeType: ChargeType,
                    ChargeFees: ChargeFees,
                    Dis: Dis,

                    hfc: hfc,
                    createdBy: createdBy,
                    dis: dis,
                    sub: sub,
                    wname: wname,
                    wclass: wclass
                };

                console.log(data);

                $.ajax({
                    url: "hospitalCharges-insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {
                        if (data.trim() === 'Success') {
                            $("#FacilityIDTable").load("hospitalCharges-Table.jsp");
                            $('#detailID').modal('hide');
                            $(".modal-backdrop").hide();

                            bootbox.alert({
                                message: "Hospital Charges information successfully added",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();
                        } else if (data.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Sorry, duplication data detected.",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (data.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#detailID').modal('hide');
                            reset();
                        }
                    }, error: function (err) {
                        console.log("Ajax Is Not Success " + err);
                    }

                });

            }
        });


        function reset() {
            document.getElementById("ChargeType").value = "";
            document.getElementById("eliSrc").value = "";
            document.getElementById("Dis").value = "";
            document.getElementById("EliTy").value = "";
            document.getElementById("ChargeFees").value = "";
            document.getElementById("sub").value = "";
            document.getElementById("wname").value = "";
            document.getElementById("wclass").value = "";
//            document.getElementById("NonCitizenDeposit").value = "";
//            document.getElementById("NonCitizenDiscount").value = "";
//            document.getElementById("PensionerDeposit").value = "";
//            document.getElementById("PensionerDiscount").value = "";
//            document.getElementById("PensionerRates").value = "";
//            document.getElementById("NoOfBed").value = "";
//            document.getElementById("bathroom").checked = false;
//            document.getElementById("toilet").checked = false;
//            document.getElementById("televison").checked = false;
//            document.getElementById("telephone").checked = false;
//            document.getElementById("status1").checked = false;
//            document.getElementById("status2").checked = false;

        }
        $('#MWID_clear').on('click', function (e) {
            e.preventDefault();
            reset();


        });




    });


//        $("#wclass").on('change', function () {
//            var wclass = $(this).val();
//            var hfc = $("#Rhfc").val();
//            $.ajax({
//                type: "post",
//                url: "listWardName2.jsp",
//                data: {'wclass': wclass, 'hfc': hfc},
//                timeout: 10000,
//                success: function (list) {
//                    //remove the loading 
//                    //$body.removeClass("loading");
//                    console.log(list);
//                    $('#WardNameDropdown').html(list);
//
//                },
//                error: function (xhr, status, error) {
//                    var err = eval("(" + xhr.responseText + ")");
//                    //bootbox.alert(err.Message);
//                }
//            });
//        });

//        $("#eliSrc").on('change', function () {
//        var EliSrc = $(this).val();
//        $.ajax({
//            type: "post",
//            url: "PMS/listEliTy.jsp",
//            data: {'EliSrc': EliSrc},
//            timeout: 10000,
//            success: function (list) {
//                //remove the loading 
//                //$body.removeClass("loading");
//                console.log(list);
//                $('#EligibilityTypeDropdown').html(list);
//
//            },
//            error: function (xhr, status, error) {
//                var err = eval("(" + xhr.responseText + ")");
//                //bootbox.alert(err.Message);
//            }
//        });
//    });
//        


//        $("#eliTy").on('keyup', function () { // everytime keyup event
//            var input = $(this).val(); // We take the input value
//            var hfc = $("#Rhfc").val();
//
//
//
//            if (input.length >= 1) { // Minimum characters = 2 (you can change)
//                $('#eliTyList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
//                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
//                $.ajax({
//                    type: "POST",
//                    url: "searchEligibilityType.jsp", // call the php file ajax/tuto-autocomplete.php
//                    data: dataFields, // Send dataFields var
//                    timeout: 3000,
//                    success: function (dataBack) { // If success
//                        $('#eliTyList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
//                        $('#matchListDis li').on('click', function () { // When click on an element in the list
//                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
//                            $('#eliTy').val($(this).text());
//                            $('#eliTyList').text(''); // Clear the <div id="match"></div>
//                            var arrayData = $('#eliTy').val().split("|");
//                            //console.log(arrayData);
//                            //console.log(arrayData[0].trim());
//                            //console.log(arrayData[1].trim());
//                        });
//                    },
//                    error: function () { // if error
//                        $('#eliTyList').text('Problem!');
//                    }
//                });
//            } else {
//                $('#eliTyList').text(''); // If less than 2 characters, clear the <div id="match"></div>
//            }
//
//        });


</script> 
<br>


</body>
</html>

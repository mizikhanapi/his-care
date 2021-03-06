dis<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>

<%@ page session="true" %>
<%
    //String WardClass = "select * from wis_ward_class";
    //String Discipline = "select * from lookup_detail where master_ref_code ='0072'";

    //ArrayList<ArrayList<String>> dataWardClass;
    //ArrayList<ArrayList<String>> dataDiscipline;
    //dataWardClass = connect.getData(WardClass);
    //dataDiscipline = connect.getData(Discipline);

%>

<div id="tableOccuTable" class="form-group">
        <table id="OccuTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


        <thead>


        <th>Ward Name</th>
        <th>Bed</th>
        <th>Patient Name</th>
        <th>Patient ID</th>
        <th>Sponsor</th>
        <th>Transfer hh</th>
        </thead>
        <tbody>

            <%                Conn conn = new Conn();
                String sqldataOccu = "SELECT ward_class_code, bed_id, PATIENT_NAME, ID_NO, eligibility_category_cd  FROM wis_inpatient_episode";
                ArrayList<ArrayList<String>> dataOccu = conn.getData(sqldataOccu);

                int size11 = dataOccu.size();
                for (int i = 0; i < size11; i++) {
            %>


            <tr>

        <input id="dataFacilityIDhidden" type="hidden" value="<%=String.join("|", dataOccu.get(i))%>">
        <td><%= dataOccu.get(i).get(0)%></td>
        <td><%= dataOccu.get(i).get(1)%></td>
        <td><%= dataOccu.get(i).get(2)%></td>
        <td><%= dataOccu.get(i).get(3)%></td>
        <td><%= dataOccu.get(i).get(4)%></td>

        <td>
            <!-- Update Part Start -->
            <a id="Occu_transfer" data-toggle="modal" data-target="#TransferModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            <!-- Update Part End -->
        </td>
        
        </tr>
        <%
            }

        %>
        </tbody>
    </table>
</div>

<!-- Modal Update -->
<div class="modal fade" id="TransferModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 175%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineTransferLabel">Transfer Patient</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="TransferForm">
                    <h4>Transfer Ward</h4>
                    <hr/>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                                <div class="col-md-4">
                                    <select id="Dis" name="Dis" class="form-control">
                                        <option value="" selected="" disabled="">List of Discipline</option>


                                        <%                                            String sql222 = "SELECT  discipline_cd FROM adm_hfc_discipline";
                                            ArrayList<ArrayList<String>> dataDiscipline222 = conn.getData(sql222);

                                            int size3 = dataDiscipline222.size();

                                            for (int R = 0; R < size3; R++) {
                                        %>
                                        <option value="<%= dataDiscipline222.get(R).get(0)%>"><%= dataDiscipline222.get(R).get(0)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                                <div class="col-md-4">
                                    <select id="WardName" name="Dis" class="form-control">
                                        <option value="" selected="" disabled="">List of ward name</option>


                                        <%
                                            String sqlWname = "SELECT  ward_name  FROM wis_ward_name";
                                            ArrayList<ArrayList<String>> dataWname245 = conn.getData(sqlWname);

                                            int size4 = dataWname245.size();

                                            for (int J = 0; J < size4; J++) {
                                        %>
                                        <option value="<%= dataWname245.get(J).get(0)%>"><%= dataWname245.get(J).get(0)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                                <div class="col-md-4">
                                    <input id="Deposit" name="textinput" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                                <div class="col-md-4">
                                    <select id="WardType" name="Dis" class="form-control">
                                        <option value="" selected="" disabled="">List of ward type</option>
                                        <%
                                            String sqlWtype = "SELECT  ward_class_code FROM wis_ward_name";
                                            ArrayList<ArrayList<String>> dataWtype = conn.getData(sqlWtype);

                                            int size5 = dataWtype.size();

                                            for (int K = 0; K < size5; K++) {
                                        %>
                                        <option value="<%= dataWtype.get(K).get(0)%>"><%= dataWtype.get(K).get(0)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>   

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Transfer Reason</label>
                                <div class="col-md-4">
                                    <input id="TransferReason" name="TransferReason" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                                <div class="col-md-4">
                                    <select id="BedIDReg" name="Dis" class="form-control">
                                        <option value="" selected="" disabled="">Locate selected bed here..</option>
                                        <%
                                            String sqlBed = "SELECT  bed_id FROM wis_bed_id";
                                            ArrayList<ArrayList<String>> dataBed = conn.getData(sqlBed);

                                            int size6 = dataBed.size();

                                            for (int H = 0; H < size6; H++) {
                                        %>
                                        <option value="<%= dataBed.get(H).get(0)%>"><%= dataBed.get(H).get(0)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <button class="btn btn-default" type="button"> List Bed</button>
                            </div>




                        </div>
                    </div>
                    <!-- List of Bed -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div>
                                <%@include file = "bed.jsp" %>
                            </div>
                        </div>
                    </div>
                    <!-- List of Bed -->

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="TransferButton">Transfer</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="TransferReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>


<script type="text/javascript">

    $(document).ready(function () {



        //function to edit facility type from table
        $('#WardOccupancyTable').off('click', '#OccuTable #Occu_transfer').on('click', '#OccuTable #Occu_transfer', function (e) {
            e.preventDefault();
            //go to the top

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataTransferhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);
            //assign into seprated val

            var Dis = arrayData[0];
            var WardName = arrayData[1];
            var Deposit = arrayData[2];
            var WardType = arrayData[3];
            var BedID = arrayData[4];
            var TransferReason = arrayData[5];

            $('#Dis').val(Dis);
            $('#WardName').val(WardName);
            $('#Deposit').val(Deposit);
            $('#WardType').val(WardType);
            $('#BedID').val(BedID);
            $('#TransferReason').val(TransferReason);

        });

        $("#TransferButton").off('click').on('click', function (e) {

            e.preventDefault();
            var Dis = $('#Dis').val();
            var WardName = $('#WardName').val();
            var Deposit = $('#Deposit').val();
            var WardType = $('#WardType').val();
            var BedID = $('#BedID').val();
            var TransferReason = $('#TransferReason').val();

            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (Dis === "" || Dis === null) {
                alert("Complete The Fields");
            } else if (WardName === "" || WardName === null) {
                alert("Complete The Fields");
            } else if (Deposit === "" || Deposit === null) {
                alert("Complete The Fields");
            } else if (WardType === "" || WardType === null) {
                alert("Complete The Fields");
            } else if (BedID === "" || BedID === null) {
                alert("Complete The Fields");
            } else if (TransferReason === "" || TransferReason === null) {
                alert("Complete The Fields");

            } else {

                var data = {
                    Dis: Dis,
                    WardName: WardName,
                    Deposit: Deposit,
                    WardType: WardType,
                    BedID: BedID,
                    TransferReason: TransferReason

                };
                $.ajax({
                    url: "transferPatient.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#WardOccupancyTable').load("WardOccupancy-Table.jsp");
                            $(".modal-backdrop").hide();
                            bootbox.alert({
                                message: "Successfully updated",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                        }

                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
            }
        });
    });
    //delete function when click delete on next of kin

</script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#OccuTable').DataTable();

    });
</script>


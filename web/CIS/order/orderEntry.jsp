
<div class="thumbnail">

    <!-- Tab Menu -->
    <div class="tabbable-panel cis-tab">
        <div class="tabbable-line">
            <ul class="nav nav-tabs ">
                <li class="active">
                    <a href="#OrderEntry" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-info-circle fa-lg"></i> Order Entry </a>
                </li>
                <li class="pull-right">
                    <a href="#generic-soap" class="panelito general-exam">
                        <i class="fa fa-chevron-left"></i> Back to General Examination </a>
                </li>

            </ul>

            <div class="tab-content">
                <!-- content -->
                <div class="tab-pane active fade in" id="OrderEntry">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#CIS040000" href="" class="soap-select"><i class="fa fa-bolt fa-li"></i>Radiology Request</a></li>
                        <li><a data-toggle="modal" data-target="#CIS040001" href="" class="soap-select"><i class="fa fa-thermometer-empty fa-li"></i> Laboratory Request</a></li>
                        <li><a data-toggle="modal" data-target="#CIS040002" href="" class="soap-select" onClick="searchHFCDetail('DTO')"> <i class="fa fa-medkit fa-li"></i> Drug Order</a></li>
<!--                        <li><a data-toggle="modal" data-target="#CIS040003" href="" class="soap-select" hide ><i class="fa fa-file-text-o fa-li"></i> Monitoring</a></li>-->
                        <!--                        <li><a data-toggle="modal" data-target="#CIS040004" href="" class="soap-select"> <i class="fa fa-bar-chart fa-li"></i> Follow Up</a></li>-->
                        <li><a data-toggle="modal" data-target="#CIS040005" href="" class="soap-select hide"><i class="fa fa-user-md fa-li"></i> Second Opinion</a></li>
                        <li><a data-toggle="modal" data-target="#CIS040006" href="" class="soap-select" onClick="searchHFCDetail('POS')" ><i class="fa fa-list-ol fa-li"></i> Procedure</a></li>
                        <li><a data-toggle="modal" data-target="#CIS040011" href="" class="soap-select" onClick="searchHFCDetail('SPO')" ><i class="fa fa-list-ol fa-li"></i> Surgical Procedure</a></li>
                        <li><a data-toggle="modal" data-target="#CIS040007" href="" class="soap-select" onClick="searchHFCDetail('ADW')"><i class="fa fa-bed fa-li"></i> Admit To Ward</a></li>
                        <!--                        <li><a data-toggle="modal" data-target="#CIS040008" href="" class="soap-select"><i class="fa fa-clock-o fa-li"></i> MC & Time Slip</a></li>-->
                        <li><a data-toggle="modal" data-target="#CIS040009" href="" class="soap-select"><i class="fa fa-clock-o fa-li"></i> Referral</a></li>
                        <li><a data-toggle="modal" data-target="#mCIS_Discharge_Summary" href="" class="soap-select" id=""><i class="fa fa-clock-o fa-li"></i> Order To Discharge</a></li>
                    </ul>
                    <hr class="pemisah" />



                </div>

            </div>

        </div>
    </div>
    <!-- Tab Menu -->
</div>

<script src="../assets/js/btn.number.js" type="text/javascript"></script>
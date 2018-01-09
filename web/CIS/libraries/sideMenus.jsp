<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>

            <li><a id="btnCIS_MAIN_QUEUE"><i class="fa fa-users fa-lg"></i> <span>Queue</span></a></li>
            <li><a id="searchBtn"><i class="fa fa-search fa-lg"></i> <span>View Visit History</span></a></li>
            <li><a id="btnAnalysePatient"><i class="fa fa-bar-chart-o fa-lg"></i> <span>Analyse Patient</span></a></li>
            <li><a href="../QMS/"><i class="fa fa-gear fa-lg"></i> <span>Second Opinion</span></a></li>
            <li class="hidden"><a id="settingBtn"><i class="fa fa-gear fa-lg"></i> <span>Setting</span></a></li>
            <li><a class="panelito" onclick="checkClick('./../Report/mcMain2.jsp')"><i class="fa fa-calendar fa-lg"></i> <span>Print MC</span></a></li>
            <li><a class="panelito" onclick="checkClick('./../Report/timeSlipMain2.jsp')"><i class="fa fa-clock-o fa-lg"></i> <span>Print Time Slip</span></a></li>

            <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li class="header">SPECIALIST</li>
            <li id="generalLi"><a href="#generic-soap" role="tab" data-toggle="tab" class="panelito general-exam"><i class="fa fa-angle-right fa-lg"></i> <span>General Examination</span></a></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Orthopedic</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a class="panelito ortho-niward" style="cursor: pointer;"><i class="fa fa-circle-o"></i> Nursing</a></li>
                    <li><a class="panelito ortho-opthe" style="cursor: pointer;"><i class="fa fa-circle-o"></i> Report</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Obstetrics & Gynecology</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a class="panelito ong-general" style="cursor: pointer;" id="LinkOngGeneral"><i class="fa fa-circle-o"></i> General</a></li>
                    <li><a class="panelito ong-general" style="cursor: pointer;" id="LinkOngCareWard"><i class="fa fa-circle-o"></i> Care Ward</a></li>
                </ul>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>



    //set modal width to dynamic
    $('#modalSaya').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });
    $('#modalSaya2').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });
    
    

       

        var $body = $('body');
        var yyyyMMddHHmmss;
        var HHmmss;
        var yyyyMMdd;
        var ddMMyyyy;
        var tahun, bulan, hari, ICbday;
        //function get birth date

        function getBday(x) {


            if (x.length === 12) {
                tahun = x.substr(0, 2);
                bulan = x.substr(2, 2);
                hari = x.substr(4, 2);
                if (tahun >= 00 && tahun < 50)
                {

                    //                    ICbday = "20" + tahun + "-" + bulan + "-" + hari;
                    ICbday = hari + "-" + bulan + "-" + "20" + tahun;
                } else
                {
                    //                    ICbday = "19" + tahun + "-" + bulan + "-" + hari;
                    ICbday = hari + "-" + bulan + "-" + "19" + tahun;
                }
            }

        }

        //function to get date 
        function getDateNow() {
            //yyyy-MM-dd HH:mm:ss
            var nowDate = new Date();
            var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
            //months
            var month = (nowDate.getMonth() + 1);
            if (month < 10) {
                ZeroMonth = "0" + month;
            } else {
                ZeroMonth = month;
            }

            //days
            var day = (nowDate.getDate());
            if (day < 10) {
                ZeroDay = "0" + day;
            } else {
                ZeroDay = day;
            }

            //years
            var year = (nowDate.getFullYear());
            //hours
            var hours = nowDate.getHours();
            //minutes
            var minutes = nowDate.getMinutes();
            if (minutes < 10) {
                ZeroMinutes = "0" + minutes;
            } else {
                ZeroMinutes = minutes;
            }
            //seconds
            var seconds = nowDate.getSeconds();
            if (seconds < 10) {
                ZeroSeconds = "0" + seconds;
            } else {
                ZeroSeconds = seconds;
            }
            //complete day
            yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
            HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
            yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
            ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
        }

        //register patient
        $('#registerBed').click(function () {
            getDateNow();
            setInterval(getDateNow, 1000);
            if ($('#pmino').val() === " " || $('#pmino').val() === "") {
                bootbox.alert('Please use a proper PMI no.');
            } else {
                //var r = confirm("Are you sure want to REGISTER PATIENT?");


                var pmino, poic, pid, MRN, pname, pnic, pidno,
                        EliSource, AdmissionType, Refer, DocType, GL, EliTy, AdmissionReason, PoliceCase, DocNo, payer,
                        Dis, wname, Deposit, WardType, BedID,
                        guardInd, referNo, referHfc, referDis, gruGuard, epiTime, epiDate, stat, hfc;
                pmino = $('#pmino').val();
                epiDate = yyyyMMddHHmmss;
                poic = $('input[id=poic]').val();
                pid = $('input[id=pid]').val();
                MRN = $('input[id=MRN]').val();
                pname = $('input[id=pname]').val();
                pnic = $('input[id=pnic]').val();
                pidno = $('input[id=pidno]').val();
                EliSource = $('#EliSource').val();
                AdmissionType = $('#AdmissionType').val();
                Refer = $('#Refer').val();
                DocType = $('#DocType').val();
                GL = $('#GL').val();
                if ($('#EliTy').val() === null) {
                    EliTy = "-";
                } else {
                    EliTy = $('#EliTy').val();
                }
                AdmissionReason = $('#AdmissionReason').val();
                PoliceCase = $('input[name="PoliceCase"]:checked').val();
                DocNo = $('#DocNo').val();
                payer = $('#payer').val();
                Dis = $('#Dis').val();
                var array_dis = Dis.split("|");
                var Dis = array_dis[0];
                wname = $('#wname').val();
                Deposit = $('#Deposit').val();
                WardType = $('#WardType').val();
                BedID = $('#BedID').val();
                guardInd = "-";
                referHfc = "-";
                referDis = "-";
                referNo = "-";
                gruGuard = "-";
                epiTime = HHmmss;
                stat = "0";
                var hfc = $("#Rhfc").val();
                var createdBy = $("#Rid").val();
                var sub = $("#Rsub").val();
                //hfc amik kat session
                hfc = $('#sessionHfc').val();
                var datas = {'pmino': pmino,
                    'epiDate': epiDate,
                    'poic': poic,
                    'pid': pid,
                    'MRN': MRN,
                    'pname': pname,
                    'pnic': pnic,
                    'pidno': pidno,
                    'EliSource': EliSource,
                    'AdmissionType': AdmissionType,
                    'Refer': Refer,
                    'DocType': DocType,
                    'GL': GL,
                    'EliTy': EliTy,
                    'AdmissionReason': AdmissionReason,
                    'PoliceCase': PoliceCase,
                    'DocNo': DocNo,
                    'payer': payer,
                    'Dis': Dis,
                    'wname': wname,
                    'Deposit': Deposit,
                    'WardType': WardType,
                    'BedID': BedID,
                    'guardInd': guardInd,
                    'referNo': referNo,
                    'referHfc': referHfc,
                    'referDis': referDis,
                    'gruGuard': gruGuard,
                    'epiTime': epiTime,
                    'stat': stat,
                    'hfc': hfc,
                    'now': yyyyMMdd,
                    hfc: hfc,
                    createdBy: createdBy,
                    sub: sub

                };
                //console.log(datas);
                bootbox.confirm({
                    message: "Are you sure want to REGISTER PATIENT?",
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
                            $body.addClass("loading");
                            $.ajax({
                                type: "POST",
                                url: "registration.jsp",
                                data: datas, // Send input
                                timeout: 3000,
                                success: function (list) {
                                    console.log(list);
                                    $body.removeClass("loading");
                                    if ($.trim(list) === "Success") {

                                        bootbox.alert("Patient has been register successfully");
                                    } else if ($.trim(list) === "already") {
                                        bootbox.alert("Patient is already registered");
                                    }
                                }, error: function () {
                                    bootbox.alert("There is an error!");
                                }
                            });
                        }
                    }
                });
            }


        });
        //event on click clear buton
        $('#btnclear').click(function () {
            $('#myForm2')[0].reset();
        });



//
//
//    //load appointment modal into the registration page
////            $("#headerindex").load("libraries/header.html");
////            $("#topmenuindex").load("libraries/topMenus.html");
////            $("#sidemenus").load("libraries/sideMenus.jsp");
//
//
//
////
////    function load() {
////        $("#listbed").load('bed.jsp');
////    }
//
//
////
////    $(function () {
////        $('#listbed').on('click', function (e) {
////            e.preventDefault();
////            $("#content").load(this.id + "bed.jsp");
////        });
////    });
//
//    //event on click search button
//
//    $(document).ready(function () {
//
//
//        $('#listbed').on('click', function () {
//            //console.log("lalu sini");
//            listbed();
//            console.log(" sudah lalu sini");
//            });
//
//        function listbed() {
////                                            var Dis = "";
////                                            var wname = "";
////                                            var WardType = "";
////
////
////
////                                            $('#discip').on('change', function () {
////                                                //bootbox.alert("Discipline Ward");
////                                                Dis = $('#discip').val();
////                                                $('#discip').val(Dis);
////                                            });
////                                            $('#wname').on('change', function () {
////                                                //bootbox.alert("Ward Class");
////                                                wname += $('#wname').val();
////                                                $('#wname').val(wname);
////                                            });
////                                            $('#wtype').on('change', function () {
////                                                //bootbox.alert("Ward ID");
////                                                WardType += $('#wtype').val();
////                                                $('#wtype').val(WardType);
////                                            });
//
//            var Dis = $('#Dis').val();
//            var WardType = $('#wtype').val();
//            var wname = $('#wname').val();
//
//
//            if (Dis === "") {
//                bootbox.alert("Please select the discipline");
//            } else if (wname === "") {
//                bootbox.alert("Please select the ward name");
//            } else if (WardType === "") {
//                bootbox.alert("Please select the ward type");
//            } else {
//
//                var data = {
//                    Dis: Dis,
//                    wname: wname,
//                    WardType: WardType
//                };
//
//                $.ajax({
//                    url: "bed.jsp",
//                    type: "post",
//                    data: data,
//                    timeout: 10000,
//                    success: function (data) {
//
//                        console.log(data);
//
//                        if (data.trim() === 'Success') {
//                            $("#InpatientRegister").load("InpatientRegistration.jsp");
//
//                            bootbox.alert({
//                                message: " You have successfully make your choice",
//                                title: "Process Result",
//                                backdrop: true
//                            });
//                            reset();
//
//
//
//                        } else if (data.trim() === 'Failed') {
//                            bootbox.alert({
//                                message: "You have failed to make your choice",
//                                title: "Process Result",
//                                backdrop: true
//                            });
//
//
//                        }
//
//                    }, error: function (err) {
//                        console.log("Ajax Is Not Success");
//
//                    }
//
//                });
//
//            }
//
//
//
//        }
//        ;
//


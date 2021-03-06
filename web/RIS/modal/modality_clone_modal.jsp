<%-- 
    Document   : modality_clone_modal
    Created on : Jul 18, 2017, 7:14:26 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<!-- Clone Modal Start -->
<div class="modal fade" id="MOD_clone_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Modality</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="MOD_clone_form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select modality to be cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="MOD_clone_select_all">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="MOD_clone_deselect_all">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="MOD_clone_select_list" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="MOD_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   


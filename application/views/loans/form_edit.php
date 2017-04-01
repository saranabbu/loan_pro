<?php $this->load->view("partial/header"); ?>
<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<?php echo form_open('loans/save/' . $loan_info->loan_id, array('id' => 'loan_form', 'class' => 'form-horizontal')); ?>

<style>
    #drop-target {
        border: 10px dashed #999;
        text-align: center;
        color: #999;
        font-size: 20px;
        width: 600px;
        height: 300px;
        line-height: 300px;
        cursor: pointer;
    }

    #drop-target.dragover {
        background: rgba(255, 255, 255, 0.4);
        border-color: green;
    }
</style>

<input type="hidden" id="loan_id" name="loan_id" value="<?= $loan_info->loan_id; ?>" />
<input type="hidden" id="controller" value="<?= strtolower($this->lang->line('module_' . $controller_name)); ?>" />
<input type="hidden" id="linker" value="<?= random_string('alnum', 16); ?>" />


<div class="row">
    <div class="col-lg-12">
        <div class="inqbox float-e-margins">
            <div class="inqbox-content">
                <h2><?php echo $this->lang->line('common_list_of') . ' ' . $this->lang->line('module_' . $controller_name); ?></h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="<?= site_url(); ?>">Home</a>
                    </li>
                    <li>
                        <a href="<?= site_url(strtolower($this->lang->line('module_' . $controller_name))); ?>"><?= ucwords($this->lang->line('module_' . $controller_name)); ?></a>
                    </li>
                    <li class="active">
                        <strong>Add</strong>
                    </li>
                </ol>
            </div>
        </div>
    </div>    
</div>


<div class="row">
    <div class="col-lg-12">
        <div class="inqbox float-e-margins">
            <div class="inqbox-title">
                <h5>
                    <?php echo $this->lang->line("loans_info"); ?>
                </h5>
                <div class="inqbox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#">Config option 1</a>
                        </li>
                        <li><a href="#">Config option 2</a>
                        </li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="inqbox-content">
                <div class="tabs-container">
                    <ul class="nav nav-tabs tab-border-top-danger">
                        <li class="active"><a data-toggle="tab" href="#sectionA"><?= $this->lang->line("loans_information"); ?></a></li>
                        <li><a data-toggle="tab" href="#sectionB"><?= $this->lang->line("loans_misc_fees"); ?></a></li>
                        <li><a data-toggle="tab" href="#sectionC"><?= $this->lang->line('loans_attachments') ?></a></li>
                        <li><a data-toggle="tab" href="#sectionE"><?= $this->lang->line('loans_guarantee') ?></a></li>
                       <!-- <li><a data-toggle="tab" href="#sectionF">Payment Schedule</a></li>-->
                    </ul>
                    <div class="tab-content">
					
						 
                        <div id="sectionA" class="tab-pane fade in active">
                            <div style="text-align: center">
                                <h3><?= $this->lang->line("loans_information"); ?></h3>
                                <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
                                <ul id="error_message_box"></ul>
                            </div>
                            
                            <!--
                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_type') . ':', 'loan_type', array('class' => 'wide')); ?></label>
                                <div class="col-sm-10">
                                    <?php echo form_dropdown("loan_type", $loan_types, $loan_info->loan_type_id, "id='loan_type' class='form-control'"); ?>
                                    <input type="hidden" id="loan_type_id" name="loan_type_id" value="<?= $loan_info->loan_type_id; ?>" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            -->

                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('customers_customer') . ':', 'inp-customer', array('class' => 'wide required')); ?></label>
                                <div class="col-sm-10">
                                    <?php
                                    echo form_input(
                                            array(
                                                'name' => 'inp-customer',
                                                'id' => 'inp-customer',
                                                'value' => $loan_info->customer_name,
                                                'class' => 'form-control',
                                                'placeholder' => $this->lang->line('common_start_typing'),
                                                'style' => 'width:30%;display:' . ($loan_info->customer_id <= 0 ? "" : "none")
                                            )
                                    );
                                    ?>

                                    <span id="sp-customer" style="display: <?= ($loan_info->customer_id > 0 ? "" : "none") ?>">
                                        <?= $loan_info->customer_name; ?>
                                        <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>
                                    </span>
                                    <input type="hidden" id="customer" name="customer" value="<?= $loan_info->customer_id; ?>" />

                                </div>
                            </div>

                           

                            <div class="hr-line-dashed"></div>
                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_description') . ':', 'description', array('class' => 'wide')); ?></label>
                                <div class="col-sm-10">
                                    <?php
                                    echo form_textarea(
                                            array(
                                                'name' => 'description',
                                                'id' => 'description',
                                                'value' => $loan_info->description,
                                                'rows' => '5',
                                                'style' => 'width:30%',
                                                'class' => 'form-control'
                                            )
                                    );
                                    ?>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_amount') . ':', 'amount', array('class' => 'wide required')); ?></label>
                                <div class="col-sm-10">
                                    <?php
                                    echo form_input(
                                            array(
                                                'name' => 'amount',
                                                'id' => 'amount',
                                                'value' => $loan_info->loan_amount,
                                                'class' => 'form-control',
                                                'type' => 'number',
                                                'style' => 'width:30%',
                                            )
                                    );
                                    ?>
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
							 <div class="form-group">
                                <label class="col-sm-2 control-label">
                                    Interest Rate:
                                </label>
                                <div class="col-sm-10">
									<?php
										$interest = array();
										foreach ($paymenterm as $pay_row)
										{
											$interest[$pay_row->payement_percent] = $pay_row->payment_name;
										}

										echo form_dropdown("interest_rate", $interest, '', "id='interest_rate' class='form-control' style='display: inline; width: 30%'"); 
									?>
                                   
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">
                                    Schedule of Payment:
                                </label>
                                <div class="col-sm-10">
                                    <?php
										$schedule = array();
										foreach ($paymenschedule as $schedule_row)
										{
											$schedule[$schedule_row->payment_schedule_id] = $schedule_row->name;
										}

										echo form_dropdown("schedule", $schedule, '', "id='schedule' class='form-control' style='display: inline; width: 30%'"); 
									?>
                                </div>
                            </div>
							
							
                            <div class="hr-line-dashed"></div>
                            <div class="form-group" id="data_1"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_apply_date') . ':', 'apply_date', array('class' => 'wide required')); ?></label>
                                <div class="col-sm-10">
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <?php
                                        echo form_input(
                                                array(
                                                    'name' => 'apply_date',
                                                    'id' => 'apply_date',
                                                    'value' => (isset($loan_info->loan_applied_date) && $loan_info->loan_applied_date !="") ? date("m/d/Y", strtotime($loan_info->loan_applied_date)) : date("m/d/Y"),
                                                    'class' => 'form-control',
                                                    'type' => 'datetime',
													'style'=>'width:27% !important'
                                                )
                                        );
                                        ?>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_agent') . ':', 'agent', array('class' => 'wide')); ?></label>
                                <div class="col-sm-10">
                                    <?php if ($user_info->person_id === '1'): ?>
                                        <?php echo form_dropdown("sel_agent", $employees, ($loan_info->loan_agent_id > 0 ? $loan_info->loan_agent_id : $user_info->person_id), "id='sel_agent' class='form-control' style='width:30%'"); ?>
                                    <?php else: ?>
                                        <?= ucwords($user_info->first_name . " " . $user_info->last_name); ?>
                                    <?php endif; ?>
                                    <!--
                                    <?php echo isset($loan_info->agent_name) ? ucwords($loan_info->agent_name) : ucwords($user_info->first_name . " " . $user_info->last_name); ?>
                                    -->
                                    <input type="hidden" id="agent" name="agent" value="<?= ($loan_info->loan_agent_id > 0 ? $loan_info->loan_agent_id : $user_info->person_id) ?>" />
                                    <input type="hidden" id="approver" name="approver" value="" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_status') . ':', 'status', array('class' => 'wide')); ?></label>
                                <div class="col-sm-10">
                                    <?= $loan_status; ?>
                                    <input type="hidden" id="status" name="status" value="<?= $loan_info->loan_status; ?>" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('loans_remarks') . ':', 'remarks', array('class' => 'wide')); ?></label>
                                <div class="col-sm-10">
                                    <?php
                                    echo form_textarea(
                                            array(
                                                'name' => 'remarks',
                                                'id' => 'remarks',
                                                'value' => $loan_info->remarks,
                                                'rows' => '5',
                                                'style' => 'width:30%',
                                                'class' => 'form-control'
                                            )
                                    );
                                    ?>
                                </div>
                            </div>
                        </div>
                        <div id="sectionB" class="tab-pane fade">
                            <div style="text-align: center">
                                <h3><?= $this->lang->line("loans_misc_fees"); ?></h3>
                            </div>
                            <table class="table" id="tbl-income-sources">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 1%">
                                            <input type="checkbox" class="select_all_" />
                                        </th>
                                        <th style="text-align: center; width: 80%"><?= $this->lang->line("loans_fee"); ?></th>
                                        <th style="text-align: center; width: 20%"><?= $this->lang->line("loans_amount"); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                </tbody>
                            </table>
                            <button class="btn btn-primary" type="button" id="btn-add-row"><?= $this->lang->line("common_add_row"); ?></button>
                            <button class="btn btn-danger" type="button" id="btn-del-row"><?= $this->lang->line("common_delete_row"); ?></button>
                        </div>

                        <div id="sectionC" class="tab-pane fade">
                            <h3><?= $this->lang->line('loans_attachments') ?></h3>
                            <div id="required_fields_message"><?php echo $this->lang->line('loans_attachments_message'); ?></div>
                            <div>
                                <ul class="list-inline" id="filelist">
                                    <?php foreach ($attachments as $attachment): ?>
                                        <li>
                                            <a href="uploads/loan-<?= $loan_info->loan_id; ?>/<?= $attachment['filename']; ?>" target="_blank" title="<?= $attachment['filename']; ?>"><img src="<?= $attachment['icon']; ?>" /></a>
                                            <span class="close remove-file" data-file-id="<?= $attachment['id']; ?>" title="Remove this file"><i class="fa fa-times-circle"></i></span>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                            <div id="progress" class="overlay"></div>
                            <div class="progress progress-task" style="height: 4px; width: 15%; margin-bottom: 2px; display: none">
                                <div style="width: 0%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-info"></div>                                    
                            </div>
                            <div id="container">
                                <a id="pickfiles" href="javascript:;" class="btn btn-default" data-loan-id="<?= $loan_info->loan_id; ?>"><?= $this->lang->line("common_browse"); ?></a> 
                            </div>
                        </div>
						
						
						<div id="sectionE" class="tab-pane fade in">

                            <div style="text-align: center">
                                <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
                                <ul id="error_message_box"></ul>
                            </div>
							
							

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_first_name') . ':', 'first_name', array('class' => 'required')); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'first_name',
											'id' => 'first_name',
											'value' => $guarantee->first_name,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>


						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_last_name') . ':', 'last_name', array('class' => 'required')); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'last_name',
											'id' => 'last_name',
											'value' => $guarantee->last_name,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						
						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('customers_age') . ':', 'last_name', array('class' => 'required')); ?></label>
							<div class="col-sm-10">
								<?php
								
								
								 $options = array(
											'1' => 'Male',
											'0' => 'Female',
											);
											echo form_dropdown('gender', $options,$guarantee->gender, ' id="gender"');
										  
								
								
							   
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('customers_age') . ':', 'last_name', array('class' => 'required')); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'cus_age',
											'id' => 'cus_age',
											'value' => $guarantee->age,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('customers_id') . ':', 'last_name', array('class' => 'required')); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'id_card',
											'id' => 'id_card',
											'value' => $guarantee->id_card,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_email') . ':', 'email'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'email',
											'id' => 'email',
											'value' => $guarantee->email,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>


						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_phone_number') . ':', 'phone_number'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'phone_number',
											'id' => 'phone_number',
											'value' => $guarantee->phone_number,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_address_1') . ':', 'address_1'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'address_1',
											'id' => 'address_1',
											'value' => $guarantee->address_1,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_address_2') . ':', 'address_2'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'address_2',
											'id' => 'address_2',
											'value' => $guarantee->address_2,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_city') . ':', 'city'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'city',
											'id' => 'city',
											'value' => $guarantee->city,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_state') . ':', 'state'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'state',
											'id' => 'state',
											'value' => $guarantee->state,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>


						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_zip') . ':', 'zip'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'zip',
											'id' => 'zip',
											'value' => $guarantee->zip,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_country') . ':', 'country'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_input(
										array(
											'name' => 'country',
											'id' => 'country',
											'value' => $guarantee->country,
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_comments') . ':', 'comments'); ?></label>
							<div class="col-sm-10">
								<?php
								echo form_textarea(
										array(
											'name' => 'comments',
											'id' => 'comments',
											'value' => $guarantee->comments,
											'rows' => '5',
											'cols' => '17',
											'class' => 'form-control'
										)
								);
								?>
							</div>
						</div>







                            <div class="hr-line-dashed"></div>
							
                        </div>
  
                        <div id="sectionF" class="tab-pane fade in" style="display:none" disabled>
                            <div style="text-align: center">
                                <h3>Payment Schedule</h3>
                                <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
                                <ul id="error_message_box"></ul>
                            </div>
                           
                            
                            <div class="form-group " style="display:none" disabled>
                                <label class="col-sm-2 control-label">
                                    Schedules:
                                </label>
                                <div class="col-sm-10">
                                    <table class="table table-bordered" id="tbl-payment-sched">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center; width: 1%">
                                                    <input type="checkbox" class="payment_select_all_" />
                                                </th>
                                                <th style="text-align: center;">Schedule</th>
                                                <th style="text-align: center;">Balance</th>
                                                <th style="text-align: center;">Interest</th>
                                                <th style="text-align: center;">Payment</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (count($c_payment_scheds["payment_breakdown"]["balance"]) > 0): ?>
                                                <?php for ($i = 0; $i < count($c_payment_scheds["payment_breakdown"]["balance"]); $i++): ?>
                                                    <tr>
                                                        <td><input type='checkbox' class='payment_select_' /></td>
                                                        <td style="width:30%">
                                                            <div class="input-group date">
                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                <input type="text" name="payment_date[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["schedule"][$i]; ?>" />
                                                            </div>
                                                        </td>
                                                        <td><input type="number" name="payment_balance[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["balance"][$i]; ?>"/></td>
                                                        <td><input type="number" name="payment_interest[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["interest"][$i]; ?>"/></td>
                                                        <td><input type="number" name="payment_amount[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["amount"][$i]; ?>"/></td>
                                                    </tr>
                                                <?php endfor; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td><input type='checkbox' class='payment_select_' /></td>
                                                    <td style="width:30%">
                                                        <div class="input-group date">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                            <input type="text" name="payment_date[]" class="form-control" value="" />
                                                        </div>
                                                    </td>
                                                    <td><input type="number" name="payment_balance[]" class="form-control" value=""/></td>
                                                    <td><input type="number" name="payment_interest[]" class="form-control" value=""/></td>
                                                    <td><input type="number" name="payment_amount[]" class="form-control" value=""/></td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>

                                    <button class="btn btn-primary" type="button" id="btn-add-row-payment"><?= $this->lang->line("common_add_row"); ?></button>
                                    <button class="btn btn-danger" type="button" id="btn-del-row-payment"><?= $this->lang->line("common_delete_row"); ?></button>

                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<div class="row">
    <div class="form-group">
        <div class="col-sm-offset-2">
            <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close"><?= $this->lang->line("common_close"); ?></button>
    
            <?php
            echo form_submit(
                    array(
                        'name' => 'submit',
                        'id' => 'btn-save',
                        'value' => $this->lang->line('common_save'),
                        'class' => 'btn btn-primary'
                    )
            );
            ?>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="attachment_modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            fdsfas
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<?php
echo form_close();
?>

<?php $this->load->view("partial/footer"); ?>

<!-- Date picker -->
<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="<?php echo base_url(); ?>js/loan.js?v=<?= time(); ?>"></script>

<script type='text/javascript'>

    //validation and submit handling
    $(document).ready(function () {
        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

        $(document).on("change, keyup", "#amount", function () {
            $("#sp-current-balance").html($(this).val());
            $("#current_balance").val($(this).val());
        });

        $(document).on("click", ".remove-file", function () {
            var el = $(this);
            $.ajax({
                url: '<?= site_url('loans/remove_file'); ?>',
                data: {file_id: el.data("file-id"), softtoken: $("#token_hash").val()},
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    el.parent().remove();
                },
                error: function () {
                    ;
                }
            });
        });

        $("#btn-add-row").click(function () {
            $(".select_all_").prop("checked", false);

            var rowCount = $('#tbl-misc-fees tr').length;
            if (rowCount > 1)
            {
                $("#tbl-income-sources tbody").append("<tr>" + $('#tbl-income-sources tr:last').html() + "</tr>");
            }
            else
            {
                $("#tbl-income-sources tbody").append("<tr><td><input type='checkbox' class='select_' /></td><td><input type='text' class='form-control' name='sources[]' /></td><td><input type='number' class='form-control' name='values[]' /></td></tr>");
            }
        });

        $("#btn-del-row").click(function () {
            $('.select_').each(function () {
                if ($(this).is(":checked"))
                {
                    $(this).parent().parent().remove();
                }
            });
        });

        $("#loan_type").change(function () {
            $("#loan_type_id").val($(this).val());
        });

        $("#sel_agent").change(function () {
            $("#agent").val($(this).val());
        });

        $("#btn-approve").click(function () {
            $("#approver").val($("#user_info").val());
            $("#loan_form").submit();
        });

        if ($("#agent").val() <= 0)
        {
            $("#agent").val($("#user_info").val());
        }


        if ($("#loan_id").val() > -1)
        {
           
            
           

            if ($("#status").val() !== "approved")
            {
                $("#btn-approve").show();
            }
            else
            {
                $("#btn-approve").hide();
            }

            $("#btn-break-gen").show();
            $("#btn-edit").show();

            $("#btn-edit").click(function () {
               
                $(this).hide();
                
               
                $("#btn-save").show();
            });
        }
        else
        {
            $("#btn-approve").hide();
            $("#btn-break-gen").hide();
            $("#btn-edit").hide();
        }

        $(document).on("click", ".btn-remove-row", function () {
            $("#sp-customer").hide();
            $("#sp-customer").html("");
            $("#inp-customer").val("");
            $("#inp-customer").show();
            $("#customer").val("");
        });

        $('#inp-customer').autocomplete({
            serviceUrl: '<?php echo site_url("loans/customer_search"); ?>',
            onSelect: function (suggestion) {
                $("#account").val(suggestion.data);
                $("#customer").val(suggestion.data);
                $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
                $("#sp-customer").show();
                $("#inp-customer").hide();
            }
        });

        var settings = {ignore: "",
						invalidHandler: function (form, validator) {
                set_feedback("Error: Please correct all the required fields", 'error_message', true);
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (response) {
						
                        post_loan_form_submit(response);
						
                        if ($("#loan_id").val() > 0)
                        {
							$("form").trigger("reset");
                            setTimeout(function () {
                                location.reload()
                            }, 1000);
							
                        }
                    },
                    dataType: 'json',
                    type: 'post'
                });

            },
            rules: {
                account: "required",
                amount: "required",
                "inp-customer": "required"
            },
            messages: {
                account: "<?php echo $this->lang->line('loans_account_required'); ?>",
                amount: "<?php echo $this->lang->line('loans_amount_required'); ?>",
                "inp-customer": "<?php echo $this->lang->line('loans_customer_required'); ?>"
            }
        };

        $('#loan_form').validate(settings);

        function post_loan_form_submit(response) {
            if (!response.success)
            {
                set_feedback(response.message, 'error_message', true);
            }
            else
            {
                set_feedback(response.message, 'success_message', false);
            }

            $('#loan_form').attr("action", "<?= site_url(); ?>loans/save/" + response.loan_id);
        }

        $("#btn-add-row-payment").click(function () {
            $(".payment_select_all_").prop("checked", false);

            var rowCount = $('#tbl-payment-sched tr').length;
            if (rowCount > 1)
            {
                $("#tbl-payment-sched tbody").append("<tr>" + $('#tbl-payment-sched tr:last').html() + "</tr>");
            }
            else
            {
                $("#tbl-payment-sched tbody").append("<tr><td><input type='checkbox' class='payment_select_' /></td><td><input type='date' class='form-control' name='payment_date[]' /></td><td><input type='number' class='form-control' name='payment_balance[]' /></td><td><input type='number' class='form-control' name='payment_interest[]' /></td><td><input type='number' class='form-control' name='payment_amount[]' /></td></tr>");
            }
            
            $('.input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });
        });

        $("#btn-del-row-payment").click(function () {
            $('.payment_select_').each(function () {
                if ($(this).is(":checked"))
                {
                    $(this).parent().parent().remove();
                }
            });
        });
    });
</script>
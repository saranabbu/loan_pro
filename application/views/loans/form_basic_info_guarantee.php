<div class="form-group">
    <label class="col-sm-2 control-label">
        <?php echo form_label($this->lang->line('common_photo') . ':', 'photo_url'); ?>
    </label>
	
	
    <div class="col-sm-10">
        <img id="img-pic" src="<?= (trim($guarantee->photo_url) !== "") ? base_url("uploads/profile-" . $guarantee->person_id . "/" . $guarantee->photo_url) : base_url("uploads/common/images.jpg"); ?>" style="height:99px" />
        <div id="filelist"></div>
        <div id="progress" class="overlay"></div>

        <div class="progress progress-task" style="height: 4px; width: 15%; margin-bottom: 2px; display: none">
            <div style="width: 0%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-info">

            </div>                                    
        </div>

        <div id="container">
            <a id="pickfiles" href="javascript:;" class="btn btn-default" data-person-id="<?= $guarantee->person_id; ?>"><?= $this->lang->line("common_browse"); ?></a> 
        </div>
    </div>
</div>
<div class="hr-line-dashed"></div>

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






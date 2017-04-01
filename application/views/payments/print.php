<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>


	<link href="style.css" rel="stylesheet">
  
	
  </head>
 <body>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title"><?php echo $this->lang->line("common_print"); ?></h4>

</div>
<div class="modal-body">
   <div class="a4">
	<center>
		<div class="tophead">
			<p>ព្រះរាជាណាចក្រកម្ពជា</p>
			<p>ជាតិ សាសនា ព្រះមហាក្សត្រ</p>
		</div> 		 		
		<div class<="tittle"> លិខិតបញ្ជាក់ ការសង់ការប្រាក់ </div>
		<p></p>
	</center>
	<div class="sexybody">
		<?php
		$i=0;
		$info = each($company->result_array());
		$info = explode('|',$info[1]['value']);
		$trans_date = explode('-',$trans_date);
		
		
		?>
		<p>ខ្ញុំបាទ/នាងខ្ញុំឈ្មោះ<?=($client!=""?"&nbsp;&nbsp;<b>".$client."</b>&nbsp;&nbsp;":".....................");?>ភេទ..................អាយុ ...............មានទីលំនៅភូមិ<?=($addr->address_1!=""?"&nbsp;&nbsp;<b>".$addr->address_1."</b>&nbsp;&nbsp;":".....................");?></p>
		ឃុំ/សង្កាត់<?=($addr->address_2!=""?"&nbsp;&nbsp;<b>".$addr->address_2."</b>&nbsp;&nbsp;":".....................");?>ស្រុក/ខណ្ឌ<?=($addr->city!=""?"&nbsp;&nbsp;<b>".$addr->city."</b>&nbsp;&nbsp;":".....................");?>កាន់អត្តសញ្ញាណប័ណ្ញលេខ........................................​</p>
		<p>បានបង់ប្រាក់ការចំនួន <?=($interest_rate!=""?"&nbsp;&nbsp;<b>".$interest_rate."</b>&nbsp;&nbsp;":".....................");?>%នៃប្រាក់ដើមក្នុង <?=($loan_amount!=""?"&nbsp;&nbsp;<b>".$loan_amount."</b>&nbsp;&nbsp;":".....................");?>ដែលត្រូវនិង <?=($amount_paid_rate!=""?"&nbsp;&nbsp;<b>".$amount_paid_rate."</b>&nbsp;&nbsp;":".....................");?></p>
		<p>ទៅកាន់ម្ចាស់លុយឈ្មោះ............................................. មានទីលំនៅភូមិ.<?=($info[0]!=""?"&nbsp;&nbsp;<b>".$info[0]."</b>&nbsp;&nbsp;":".....................");?></p>
		<p>ឃុំ/សង្កាត់<?=($info[1]!=""?"&nbsp;&nbsp;<b>".$info[1]."</b>&nbsp;&nbsp;":".....................");?>ស្រុក/ខណ្ឌ័<?=($info[2]!=""?"&nbsp;&nbsp;<b>".$info[2]."</b>&nbsp;&nbsp;":".....................");?>។</p>
		<br/>

		<p style="text-align:right;"> ខេត្តត្បូងឃ្មុំ ថ្ងៃទី    <?=$trans_date[2]?>  ខែ   <?=$trans_date[1]?>  ឆ្នាំ <?=$trans_date[0]?></p><br/><br/><br/><br/>
		<p style="text-align:right;">ឈ្មោះអ្នកទទួល</p>
		<p style="text-align:right;"><?=$teller?></p>
	
	</div>
	
</div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close">Close</button>
</div>
  </body>
</html>

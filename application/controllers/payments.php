<?php

require_once ("secure_area.php");
require_once ("interfaces/idata_controller.php");

class Payments extends Secure_area implements iData_controller {

    function __construct()
    {
        parent::__construct('payments');
    }

    function index()
    {
        $data['controller_name'] = strtolower(get_class());
        $data['form_width'] = $this->get_form_width();
        
        $res = $this->Employee->getLowerLevels();
        $data['staffs'] = $res;
        
        $this->load->view('payments/manage', $data);
    }

    function search()
    {
        
    }

    /*
      Gives search suggestions based on what is being searched for
     */

    function suggest()
    {
        
    }

    function get_row()
    {
        
    }

    function view($payment_id = -1)
    {
        $data['payment_info'] = $this->Payment->get_info($payment_id);
		
        $res = $this->Payment->get_loans($data['payment_info']->customer_id);

        $loans = array();
        foreach ($res as $loan)
        {
            $tmp['loan_id'] = $loan->loan_id;
            $tmp['balance'] = $loan->loan_balance;
           
            $loans[] = $tmp;
        }

        $data['loans'] = $loans;
        $this->load->view("payments/form", $data);
    }
	
	
	function edit($payment_id = -1)
    {
        $data['payment_info'] = $this->Payment->get_info($payment_id);
		//print_r($this->Payment->get_info($payment_id));
		
        $res = $this->Payment->get_loans_edit($data['payment_info']->customer_id);

        $loans = array();
        foreach ($res as $loan)
        {
            $tmp['loan_id'] = $loan->loan_id;
            $tmp['loan_amount'] = $loan->loan_amount;
			$tmp['interest_rate'] = $loan->interest_rate;
			$tmp['amount_paid_rate'] = $loan->amount_paid_rate;
            $loans[] = $tmp;
        }

        $data['loans'] = $loans;
        $this->load->view("payments/form_edit", $data);
    }
	
	
	function update_payment($payment_id=null)
    {
        $payment_data = array(
            'loan_id' => $this->input->post('loan_id'),
            'customer_id' => $this->input->post('customer'),
			'paid_amount'=> $this->input->post('paid_amount'),
            'amount_paid_rate' => $this->input->post('paid_amount_rate'),
            'date_paid' => date('Y-m-d',strtotime($this->input->post('date_paid'))),
            'remarks' => $this->input->post('remarks'),
            'teller_id' => $this->input->post('teller'),
            'modified_by' => $this->input->post('modified_by')
        );

        if ($this->input->post("loan_payment_id") > 0)
        {
            $payment_data['loan_payment_id'] = $this->input->post('loan_payment_id');
        }

       
        if ($this->Payment->update($payment_data, $payment_id))
        {			$payment_id=1;
			
			 echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_adding') . ' ' .
                    $payment_data['loan_payment_id'], 'loan_payment_id' => $payment_data['loan_payment_id']));
				    $payment_id = $payment_data['loan_payment_id'];
					redirect('payments');
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loans_error_adding_updating') . ' ' .
                $payment_data['loan_payment_id'], 'loan_payment_id' => -1));
        }
      
    }
	

    function printIt($payment_id = -1)
    {
        $payment      = $this->Payment->get_info($payment_id);
        $loan         = $this->Loan->get_info($payment->loan_id);
        $person       = $this->Person->get_info($payment->teller_id);
        $customer     = $this->Person->get_info($payment->customer_id);
		$data['company']    = $this->Appconfig->get_companies_info();
		
		
		$data['addr']             = $this->Person->get_info($payment->customer_id);
        // pdf viewer 
        $data['count']            = $payment->loan_payment_id;
        $data['client']           = ucwords($customer->first_name." ".$customer->last_name);
		$data['interest_rate']    = $loan->interest_rate;
		$data['amount_paid_rate'] = to_currency($payment->amount_paid_rate);
        $data['loan_amount']      = to_currency($loan->loan_amount);
        $data['paid']             = to_currency($payment->paid_amount);
        $data['trans_date']       = ($payment->date_paid);
        $data['teller']           = $person->first_name . " " . $person->last_name;

        $filename                 = "payments_".date("ymdhis");
        // As PDF creation takes a bit of memory, we're saving the created file in /downloads/reports/
        $pdfFilePath = FCPATH . "/downloads/reports/$filename.pdf";

        ini_set('memory_limit', '32M'); // boost the memory limit if it's low <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
       // $html = $this->load->view('payments/pdf_report', $data, true); // render the view into HTML

       // $this->load->library('pdf');
      //  $pdf = $this->pdf->load();
       // $pdf->SetFooter($_SERVER['HTTP_HOST'] . '|{PAGENO}|' . date(DATE_RFC822)); // Add a footer for good measure <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
       // $pdf->WriteHTML($html); // write the HTML into the PDF
       // $pdf->Output($pdfFilePath, 'F'); // save to file because we can
        // end of pdf viewer
        //$data['pdf_file'] = FCPATH ."/downloads/reports/$filename.pdf";
        $data['pdf_file'] = "downloads/reports/$filename.pdf";


        $this->load->view("payments/print", $data);
    }

    function save($payment_id = -1)
    {
        $payment_data = array(
            'loan_id' => $this->input->post('loan_id'),
            'customer_id' => $this->input->post('customer'),
			'paid_amount'=> $this->input->post('paid_amount'),
            'amount_paid_rate' => $this->input->post('paid_amount_rate'),
            'date_paid' => date('Y-m-d',strtotime($this->input->post('date_paid'))),
            'remarks' => $this->input->post('remarks'),
            'teller_id' => $this->input->post('teller'),
            'modified_by' => $this->input->post('modified_by')
        );

        if ($this->input->post("loan_payment_id") > 0)
        {
            $payment_data['loan_payment_id'] = $this->input->post('loan_payment_id');
        }

        // transactional to make sure that everything is working well
     //   $this->db->trans_start();
        if ($this->Payment->save($payment_data, $payment_id))
        {			$payment_id=1;
			
			 echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_adding') . ' ' .
                    $payment_data['loan_payment_id'], 'loan_payment_id' => $payment_data['loan_payment_id']));
				    $payment_id = $payment_data['loan_payment_id'];
			
        }
        else//failure
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loans_error_adding_updating') . ' ' .
                $payment_data['loan_payment_id'], 'loan_payment_id' => -1));
        }
      //  $this->db->trans_complete();
    }

    function delete()
    {
        $payments_to_delete = $this->input->post('ids');

        if ($this->Payment->delete_list($payments_to_delete))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_deleted') . ' ' .
                count($payments_to_delete) . ' ' . $this->lang->line('payments_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('payments_cannot_be_deleted')));
        }
    }

    /*
      get the width for the add/edit form
     */

    function get_form_width()
    {
        return 360;
    }

    function data()
    {
        $sel_user = $this->input->get("employee_id");
        $index = isset($_GET['order'][0]['column']) ? $_GET['order'][0]['column'] : 1;
        $dir = isset($_GET['order'][0]['dir']) ? $_GET['order'][0]['dir'] : "asc";
        $order = array("index" => $index, "direction" => $dir);
        $length = isset($_GET['length'])?$_GET['length']:50;
        $start = isset($_GET['start'])?$_GET['start']:0;
        $key = isset($_GET['search']['value'])?$_GET['search']['value']:"";

        $payments = $this->Payment->get_all($length, $start, $key, $order, $sel_user);

        $format_result = array();

        foreach ($payments->result() as $payment)
        {
            $format_result[] = array(
                "<input type='checkbox' name='chk[]' id='payment_$payment->loan_payment_id' value='" . $payment->loan_payment_id . "'/>",
                $payment->loan_payment_id,
                ucwords($payment->customer_name),
                to_currency($payment->loan_amount),
				to_currency($payment->amount_paid_rate),
                to_currency($payment->paid_amount),
                date("m/d/Y",strtotime($payment->date_paid)),
                ucwords($payment->teller_name),
                anchor('payments/edit/' . $payment->loan_payment_id, $this->lang->line('common_edit'), array('class' => 'btn btn-info', "title" => $this->lang->line('payments_update'))) . " " .
                anchor('payments/printIt/' . $payment->loan_payment_id, $this->lang->line('common_print'), array('class' => 'modal_link btn btn-primary', 'data-toggle' => 'modal', 'data-target' => '#print_modal', "title" => $this->lang->line('payments_print')))
            );
        }

        $data = array(
            "recordsTotal" => $this->Payment->count_all(),
            "recordsFiltered" => $this->Payment->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

    function get_loans($customer_id)
    {
        $loans = $this->Payment->get_loans($customer_id);

        foreach ($loans as $loan)
        {
            $loan->loan_amount = ($loan->loan_amount);
            $loan->loan_balance = "bal: " . to_currency($loan->loan_balance);
			$loan->loan_id      = $loan->loan_id;
			$loan->name    		= $loan->name;
        }

        echo json_encode($loans);
        exit;
    }

    function get_customer($customer_id)
    {
        $customer = $this->Customer->get_info($customer_id);
        $suggestion['data'] = $customer->person_id;
        $suggestion['value'] = $customer->first_name . " " . $customer->last_name;

        echo json_encode($suggestion);
        exit;
    }

}

?>
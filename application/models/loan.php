<?php

class Loan extends CI_Model {
    /*
      Determines if a given loan_id is a loan
     */

    function exists($loan_id)
    {
        $this->db->from('loans');
        $this->db->where('loan_id', $loan_id);
        $query = $this->db->get();

        return ($query->num_rows() == 1);
    }
	
	
	function  get_all_overdue($limit = 10000, $offset = 0, $search = "", $order = array(), $status = "", $sel_user = false)
    {
        $employee_id = $this->Employee->get_logged_in_employee_info()->person_id;

        $sorter = array(
            "loan_id",
            "scheduled.name",
            "description",
            "loan_amount",
            "loan_balance",
            "customer.first_name",
            "agent.first_name",
            "approver.first_name",
            "loan_applied_date",
            "loan_payment_date",
            "loan_status",
        );

        $select = "loans.*,scheduled.name, CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, 
                   CONCAT(agent.first_name, ' ',agent.last_name) as agent_name, 
                   CONCAT(approver.first_name, ' ', approver.last_name) as approver_name,
				   IFNULL(abs(DATEDIFF(DATE_ADD(
					c19_loans.loan_payment_date ,INTERVAL scheduled.value_day DAY),CURDATE())),0) AS overdue_day
                   ";

        $this->db->select($select, FALSE);
        $this->db->from('loans');
        $this->db->join('people as customer', 'customer.person_id = loans.customer_id', 'LEFT');
        $this->db->join('people as agent', 'agent.person_id = loans.loan_agent_id', 'LEFT');
        $this->db->join('people as approver', 'approver.person_id = loans.loan_approved_by_id', 'LEFT');
		$this->db->join('payment_schedules as scheduled', 'scheduled.payment_schedule_id = loans.payment_scheds', 'LEFT');
        

        $employee_id = ($sel_user) ? $sel_user : $employee_id;

        if ($employee_id > 1)
        {
            $this->db->where("loan_agent_id", $employee_id);
        }


        if ($search !== "")
        {
            // hard coded the kpos_loans table here might bug in the future
            $this->db->where("(
                account LIKE '%" . $search . "%' OR
                kpos_loans.description LIKE '%" . $search . "%' OR
                customer.first_name LIKE '%" . $search . "%' OR
                customer.last_name LIKE '%" . $search . "%' OR
                CONCAT(customer.first_name,' ', customer.last_name) LIKE '%" . $search . "%' OR
                kpos_loan_types.name LIKE '%" . $search . "%' OR        
                agent.first_name LIKE '%" . $search . "%' OR
                agent.last_name LIKE '%" . $search . "%' OR 
                CONCAT(agent.first_name, ' ', agent.last_name) LIKE '%" . $search . "%'
                )");
        }

        if (count($order) > 0 && $order['index'] < count($sorter))
        {
            $this->db->order_by($sorter[$order['index']], $order['direction']);
        }
        else
        {
            $this->db->order_by("loan_id", "desc");
        }

       // $this->db->where('delete_flag', 0);

        if ($status !== "")
        {
            if ($status === "paid")
            {
                $this->db->where("loan_balance", 0);
            }
            else if ($status === "unpaid")
            {
                $this->db->where("loan_balance >", 0);
            }
            else if ($status === "overdue")
            {
                $this->db->where("loan_payment_date < UNIX_TIMESTAMP() AND DATE_ADD(loan_payment_date, INTERVAL scheduled.value_day  DAY) <= CURDATE()");
            }
        }

        $this->db->limit($limit);
        $this->db->offset($offset);
        return $this->db->get();
    }
	
    function get_all($limit = 10000, $offset = 0, $search = "", $order = array(), $status = "", $sel_user = false)
    {
        $employee_id = $this->Employee->get_logged_in_employee_info()->person_id;

        $sorter = array(
            "loan_id",
            "scheduled.name",
            "description",
            "loan_amount",
            "loan_balance",
            "customer.first_name",
            "agent.first_name",
            "approver.first_name",
            "loan_applied_date",
            "loan_payment_date",
            "loan_status",
        );

        $select = "loans.*,scheduled.name, CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, 
                   CONCAT(agent.first_name, ' ',agent.last_name) as agent_name, 
                   CONCAT(approver.first_name, ' ', approver.last_name) as approver_name
                   ";

        $this->db->select($select, FALSE);
        $this->db->from('loans');
        $this->db->join('people as customer', 'customer.person_id = loans.customer_id', 'LEFT');
        $this->db->join('people as agent', 'agent.person_id = loans.loan_agent_id', 'LEFT');
        $this->db->join('people as approver', 'approver.person_id = loans.loan_approved_by_id', 'LEFT');
		$this->db->join('payment_schedules as scheduled', 'scheduled.payment_schedule_id = loans.payment_scheds', 'LEFT');
        

        $employee_id = ($sel_user) ? $sel_user : $employee_id;

        if ($employee_id > 1)
        {
            $this->db->where("loan_agent_id", $employee_id);
        }


        if ($search !== "")
        {
            // hard coded the kpos_loans table here might bug in the future
            $this->db->where("(
                account LIKE '%" . $search . "%' OR
                kpos_loans.description LIKE '%" . $search . "%' OR
                customer.first_name LIKE '%" . $search . "%' OR
                customer.last_name LIKE '%" . $search . "%' OR
                CONCAT(customer.first_name,' ', customer.last_name) LIKE '%" . $search . "%' OR
                kpos_loan_types.name LIKE '%" . $search . "%' OR        
                agent.first_name LIKE '%" . $search . "%' OR
                agent.last_name LIKE '%" . $search . "%' OR 
                CONCAT(agent.first_name, ' ', agent.last_name) LIKE '%" . $search . "%'
                )");
        }

        if (count($order) > 0 && $order['index'] < count($sorter))
        {
            $this->db->order_by($sorter[$order['index']], $order['direction']);
        }
        else
        {
            $this->db->order_by("loan_id", "desc");
        }

       // $this->db->where('delete_flag', 0);

        if ($status !== "")
        {
            if ($status === "paid")
            {
                $this->db->where("loan_balance", 0);
            }
            else if ($status === "unpaid")
            {
                $this->db->where("loan_balance >", 0);
            }
            else if ($status === "overdue")
            {
                $this->db->where("loan_payment_date < UNIX_TIMESTAMP()");
            }
        }

        $this->db->limit($limit);
        $this->db->offset($offset);
        return $this->db->get();
    }

    function count_all()
    {
        $this->db->from('loans');
        $this->db->where("delete_flag", 0);
        return $this->db->count_all_results();
    }
	
	
	
	
	function getPaymentterm()
	{
		$this->db->select('*');
		$this->db->from('payment_term');
		$query = $this->db->get();

        if ($query->num_rows() > 0)
        {
            return $query;
        }
	}
	
	
	function getPaymentSchedule()
	{
		
		$this->db->select('*');
		$this->db->from('payment_schedules');
		$query = $this->db->get();

        if ($query->num_rows() > 0)
        {
            return $query;
        }
		
	}

    function count_overdues()
    {
        $employee_id = $this->Employee->get_logged_in_employee_info()->person_id;

        $this->db->where("loan_payment_date < UNIX_TIMESTAMP()");
        $this->db->from('loans');
        $this->db->where("delete_flag", 0);

        if ($employee_id > 1)
        {
            $this->db->where("loan_agent_id", $employee_id);
        }

        return $this->db->count_all_results();
    }

    /*
      Gets information about a particular loan
     */

    function get_info($loan_id)
    {
        $select = "loans.*, CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, 
                   CONCAT(agent.first_name, ' ',agent.last_name) as agent_name, 
                   CONCAT(approver.first_name, ' ', approver.last_name) as approver_name";
        $this->db->select($select, FALSE);
        $this->db->from('loans');
        $this->db->join('people as customer', 'customer.person_id = loans.customer_id', 'LEFT');
        $this->db->join('people as agent', 'agent.person_id = loans.loan_agent_id', 'LEFT');
        $this->db->join('people as approver', 'approver.person_id = loans.loan_approved_by_id', 'LEFT');
        $this->db->where('loan_id', $loan_id);

        $query = $this->db->get();

        if ($query->num_rows() == 1)
        {
            return $query->row();
        }
        else
        {
            //Get empty base parent object, as $loan_id is NOT a loan
            $loan_obj = new stdClass();

            //Get all the fields from items table
            $fields = $this->db->list_fields('loans');

            foreach ($fields as $field)
            {
                $loan_obj->$field = '';
            }

            $loan_obj->loan_id = -1;
            $loan_obj->customer_name = '';
            $loan_obj->loan_status = 'pending';

            return $loan_obj;
        }
    }

    /*
      Gets information about multiple loans
     */

    function get_multiple_info($loans_ids)
    {
        $this->db->from('loans');
        $this->db->where_in('item_kit_id', $loans_ids);
        $this->db->order_by("account", "asc");
        return $this->db->get();
    }

    /*
      Inserts or updates a loan
     */

    function save(&$loan_data, $loan_id = false, $has_payment = false,$guarantee_data)
    {

        if (!$loan_id or ! $this->exists($loan_id))
        {
            if ($this->db->insert('loans', $loan_data))
            {
                $loan_data['loan_id'] = $this->db->insert_id();
				$g_loan_id            = $this->db->insert_id();
				$this->move_attachments($loan_data);
				
				$this->Guarantee->save($guarantee_data, $g_loan_id);
                return true;
            }
            return false;
        }

        $this->db->where('loan_id', $loan_id);
        return $this->db->update('loans', $loan_data);
    }

    private function _get_loan_balance($loan_data)
    {
        $loan_type = $this->Loan_type->get_info($loan_data['loan_type_id']);

        $num_weeks = ($loan_type->term_period_type === "year") ? 52 : 4;
        $num_months = ($loan_type->term_period_type === "year") ? 12 : 1;

        if ($loan_type->term_period_type === "year")
        {
            switch ($loan_type->period_type1)
            {
                case "Week": // 52 weeks in 1yr
                    $apr = (52 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                    $interest_rate = $apr / $num_weeks;
                    break;
                case "Month": // 12 months in 1yr
                    $apr = (12 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                    $interest_rate = $apr / $num_months;
                    break;
                case "Year": // 1yr in 1yr
                    $apr = (1 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                    $interest_rate = $apr / 1;
                    break;
            }
        }
        else if($loan_type->term_period_type === "month")
        {
            $interest_rate = $loan_type->percent_charge1;
        }
        else
        {
            $interest_rate = 0;
        }


        return $loan_data['loan_amount'] + ($loan_data['loan_amount'] * ($interest_rate / 100) );
    }

    private function _get_loan_payment_date($loan_data)
    {
        // 52 - Weekly
        // 26 - Biweekly
        // 12 - Monthly
        //  6 - Bimonthly
        // 365- Daily
        $time = 0;
        $loan_type = $this->Loan_type->get_info($loan_data['loan_type_id']);
        switch ($loan_type->payment_schedule)
        {
            case "weekly":
                $time = strtotime("+7 day", $loan_data['loan_applied_date']);
                break;
            case "biweekly":
                $time = strtotime("+14 day", $loan_data['loan_applied_date']);
                break;
            case "monthly":
                $time = strtotime("+1 month", $loan_data['loan_applied_date']);
                break;
            case "bimonthly":
                $time = strtotime("+2 month", $loan_data['loan_applied_date']);
                break;
            case "daily":
                $time = strtotime("+1 day", $loan_data['loan_applied_date']);
                break;
        }
        return $time;
    }

    /*
     * Move attachment to the right location
     */

    function move_attachments($loan_data)
    {
        $linker = $this->session->userdata('linker');

        $this->db->from('attachments');
        $this->db->where('session_id', $linker);
        $query = $this->db->get();

        $this->db->where('session_id', $linker);
        $this->db->update('attachments', array("loan_id" => $loan_data['loan_id']));

        $attachments = $query->result();
        foreach ($attachments as $attachment)
        {
            $tmp_dir = FCPATH . "uploads/loan--1/";
            $user_dir = FCPATH . "uploads/loan-" . $loan_data['loan_id'] . "/";

            if (!file_exists($user_dir))
            {
                // temporary set to full access
                @mkdir($user_dir);
            }

            $target_dist = $user_dir . $attachment->filename;

            if (file_exists($tmp_dir . $attachment->filename))
            {
                copy($tmp_dir . $attachment->filename, $target_dist);
                unlink($tmp_dir . $attachment->filename);
            }
        }
    }

    /*
      Deletes one loan
     */

    function delete($loan_id)
    {
        $this->db->where('loan_id', $loan_id);
        return $this->db->delete('loans', array('delete_flag' => 1));
    }

    /*
      Deletes a list of loans
     */

    function delete_list($loan_ids)
    {
        $this->db->where_in('loan_id', $loan_ids);
        return $this->db->update('loans', array("delete_flag" => 1));
    }

    /*
      Get search suggestions to find loans
     */

    function get_search_suggestions($search, $limit = 25)
    {
        $suggestions = array();

        $this->db->from('loans');
        $this->db->like('account', $search);
        $this->db->order_by("account", "asc");
        $by_name = $this->db->get();
        foreach ($by_name->result() as $row)
        {
            $suggestions[] = $row->account;
        }

        //only return $limit suggestions
        if (count($suggestions > $limit))
        {
            $suggestions = array_slice($suggestions, 0, $limit);
        }
        return $suggestions;
    }

    function get_loan_search_suggestions($search, $limit = 25)
    {
        $suggestions = array();

        $this->db->from('loans');
        $this->db->like('account', $search);
        $this->db->order_by("account", "asc");
        $by_name = $this->db->get();
        foreach ($by_name->result() as $row)
        {
            $suggestions[] = 'LOAN ' . $row->item_kit_id . '|' . $row->name;
        }

        //only return $limit suggestions
        if (count($suggestions > $limit))
        {
            $suggestions = array_slice($suggestions, 0, $limit);
        }
        return $suggestions;
    }

    /*
      Preform a search on loans
     */

    function search($search)
    {
        $this->db->from('loans');
        $this->db->where("account LIKE '%" . $this->db->escape_like_str($search) . "%' or 
		description LIKE '%" . $this->db->escape_like_str($search) . "%'");
        $this->db->order_by("account", "asc");
        return $this->db->get();
    }
    
    function _get_count_payments($loan_id)
    {
        $this->db->where("loan_id", $loan_id);
        $cnt = $this->db->count_all_results("loan_payments");
        return $cnt;
    }

    /*
     * Perform update/insert balance
     */

    function update_balance($amount, $loan_id)
    {
        $loan = $this->get_info($loan_id);

        $loan_data['loan_type_id'] = $loan->loan_type_id;
        $loan_data['loan_applied_date'] = time();

        if ($loan->loan_type_id > 0)
        {
            $due_date = $this->_get_loan_payment_date($loan_data);
        }
        else
        {
            $c_payment_scheds = json_decode($loan->payment_scheds, TRUE);
            $count_payments = $this->_get_count_payments($loan->loan_id);

            $due_date = time();
            if (isset($c_payment_scheds["payment_breakdown"]["schedule"][1]))
            {
                $due_date = strtotime($c_payment_scheds["payment_breakdown"]["schedule"][1]);
            }
            
            if ( isset($c_payment_scheds["payment_breakdown"]["schedule"][$count_payments + 1]) )
            {
                $due_date = strtotime($c_payment_scheds["payment_breakdown"]["schedule"][$count_payments + 1]);
            }
        }

        $this->db->trans_start();

        $new_balance = $loan->loan_balance - $amount;
        $loan_data['loan_amount'] = $new_balance;
        $new_balance = $this->_get_loan_balance($loan_data);

        $data = array(
            'loan_balance' => $new_balance,
            'loan_payment_date' => $due_date
        );
        $this->db->where('loan_id', $loan_id);
        $this->db->update('loans', $data);
        $this->db->trans_complete();
    }

    function save_attachments($loan_id, &$data)
    {
        if ($loan_id > 0)
        {
            if ($this->db->insert('attachments', array("filename" => $data['filename'], "loan_id" => $loan_id)))
            {
                $data['attachment_id'] = $this->db->insert_id();
                return true;
            }
        }

        $session_id = $data['params']['linker'];
        $this->load->library('session');
        $this->session->set_userdata(array("linker" => $session_id));
        if ($this->db->insert('attachments', array("filename" => $data['filename'], "session_id" => $session_id)))
        {
            $data['attachment_id'] = $this->db->insert_id();
            return true;
        }
    }
    
    function save_attach_desc($id, $desc)
    {
        $this->db->where('attachment_id', $id);
        return $this->db->update('attachments', array("descriptions" => $desc));
    }

    function get_attachments($loan_id)
    {
        $this->db->from('attachments');
        $this->db->where('loan_id', $loan_id);
        $query = $this->db->get();

        return $query->result();
    }

    function remove_file($file_id)
    {
        $this->db->from('attachments');
        $this->db->where('attachment_id', $file_id);
        $query = $this->db->get();
        $res = $query->row();

        $user_dir = FCPATH . "uploads/loan--1/";
        if ($res->loan_id > 0)
        {
            $user_dir = FCPATH . "uploads/loan-" . $res->loan_id . "/";
        }

        if (file_exists($user_dir . $res->filename))
        {
            unlink($user_dir . $res->filename);
        }

        return $this->db->delete('attachments', array('attachment_id' => $file_id));
    }

    function get_total_loans()
    {
        $this->db->select("SUM(loan_amount) as total_loans");
        $this->db->from("loans");
        $this->db->where("loan_status", "pending");
        $this->db->where("delete_flag", "0");
        $query = $this->db->get();
        $res = $query->row();

        return to_currency($res->total_loans, TRUE, 0);
    }

}

?>
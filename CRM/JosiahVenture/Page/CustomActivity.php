<?php
use CRM_JosiahVenture_ExtensionUtil as E;

class CRM_JosiahVenture_Page_CustomActivity extends CRM_Core_Page {

  public function preProcess() {    
    $this->_contactId = CRM_Utils_Request::retrieve('cid', 'Positive', $this, TRUE);
    $this->assign('contactId', $this->_contactId);
    
    $this->_count = CRM_Contact_BAO_Contact::getCountComponent('activity', $this->_contactId, 1);
    $this->assign('count', $this->_count);

    // check logged in url permission
    CRM_Contact_Page_View::checkUserPermission($this);
  }

  public function run() {
    // get id of user
    $session = CRM_Core_Session::singleton();
    $this->_id = $session->get('userID');
    
    if ($this->_id &&
      in_array("view", [CRM_Core_Action::UPDATE, CRM_Core_Action::VIEW])
    ) {
      if (!CRM_Activity_BAO_Activity::checkPermission($this->_id, CRM_Core_Action::​VIEW)) {
        CRM_Core_Error::statusBounce(ts('You are not authorized to access this page.'));
      }
    } else {
      $this->preProcess();
      
      $params = [
        'contact_id' => $this->_contactId,
        'activity_type_id' => 1,
        'offset' => 0,
        'rowCount' => 50,
      ];
      $config = CRM_Core_Config::singleton();
      $rows = CRM_Activity_BAO_Activity::getActivities($params);    
      print_r($rows);     
    }
    
    

    parent::run();
  }

}

<?php
/*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
 */

/**
 *
 * @package CRM
 * @copyright CiviCRM LLC https://civicrm.org/licensing
 */

/**
 * This class contains all the function that are called using AJAX (jQuery)
 */
class CRM_JosiahVenture_Ajax_AddToMyContact {
  public function GetMyContact($group_name, $contactId){
    $group = civicrm_api3('Group', 'get', [
      'title' => $group_name,
      'description' => "My People"
    ]);  
    if($group["is_error"]==0){
      if($group["count"]==1) {
        $gid=$group["id"];
        $group_contact = civicrm_api3('GroupContact', 'getcount', [
          'id' => $gid,
          'contact_id' => $contactId
        ]);  

        if($group_contact==1) {
          return 1;
        } else {
          return 0;
        }        
      } elseif($group["count"]==0) {
        return 0;
      }
    }  
    return -1;
  }
  
  public function AddToMyContact($group_name, $contactId){
    $group = civicrm_api3('Group', 'get', [
      'title' => $group_name,
    ]);
    
    if($group["count"]==0) {
      $create_g = civicrm_api3('Group', 'create', [
        'title' => $group_name,
        'description' => "My People",
      ]);
      if(isset($create_g["id"])) {
        $gid=$create_g["id"];
      }
    } elseif($group["count"]==1 && isset($group["id"])) {
      $gid=$group["id"];
    } 
    
    if(isset($gid)) {
      // add to group 
      $group_add = civicrm_api3('GroupContact', 'create', [
        'group_id' => $gid,
        'contact_id' => $contactId,
      ]);
      
      if($group_add["is_error"]==0) {
        if($group_add["added"]==1) {
          return 1;
        } elseif($group_add["added"]==0) {
          return 0;
        }
      }
    }      
    return -1;
  }
  
  public function RemoveFromMyContact($group_name, $contactId){
    $group = civicrm_api3('Group', 'get', [
      'title' => $group_name,
      'description' => "My People",
    ]);
    if($group["is_error"]==0){
      $gid=$group["id"];
      if($group["count"]==1) {
        $group_remove = civicrm_api3('GroupContact', 'delete', [
          'group_id' => $gid,
          'contact_id' => $contactId,
        ]);
        if($group_remove["is_error"]==0) {
          return 1;
        }
      } elseif($group["count"]==0) {
        return 0;
      }
    }  
    return -1;
  }
    
  public static function Ajax(){
    $contactId = CRM_Utils_Request::retrieve('cid', 'Positive');
    
    // action: get, add, remove
    $action = CRM_Utils_Request::retrieve('action', 'Positive');
     
    // permission update=2; view=4
    if(!CRM_Contact_BAO_Contact_Permission::allowList($contactId, 4)) {
      CRM_Core_Error::statusBounce(ts('You are not authorized to access this page.'));
    } else {    
      $session = CRM_Core_Session::singleton();
      $id = $session->get('ufID');  
      
      $name = civicrm_api3('UFMatch', 'getsingle', [
        'return' => ["uf_name"],
        'id' => $id,
      ]);
      
      if(strpos($name["uf_name"], '@') !== false) {
        $group_name = explode("@", $name["uf_name"])[0];
      } else {
        $group_name = $name["uf_name"];
      }      
      $group_name.=" My People";
      
      switch($action) {
        // -1 error 
        //  0 skip     contact is not in group 
        //  1 success  contact is in group
        case 0:
          $return = CRM_JosiahVenture_Ajax_AddToMyContact::GetMyContact($group_name, $contactId); 
          break;
        // -1 error 
        //  0 skip     contact is already in group 
        //  1 success  contact added to group
        case 1:
          $return = CRM_JosiahVenture_Ajax_AddToMyContact::AddToMyContact($group_name, $contactId);
          break;
        // -1 error 
        //  0 skip     contact is not in group 
        //  1 success  contact remove from group
        case 2:
          $return = CRM_JosiahVenture_Ajax_AddToMyContact::RemoveFromMyContact($group_name, $contactId);
          break;
      }          
      CRM_Utils_JSON::output($return); 
    }
  }

}

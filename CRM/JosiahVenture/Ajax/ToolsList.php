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
class CRM_JosiahVenture_Ajax_ToolsList {
  public function GetCustomName($gid) {
    switch($gid) {
      case 2:
        $custom = 'Custom_five_challanges_of_christ_tool';
        break;
      case 3:
        $custom = 'Custom_Gro';
        break;
    } 
    return $custom;
  }
  
  public function Current($cid, $gid) {
    $custom = CRM_JosiahVenture_Ajax_ToolsList::GetCustomName($gid);
    $current_level = civicrm_api4($custom, 'get', [
      'select' => [
        '*',
        'current_level:label',
      ],
      'where' => [
        ['entity_id', '=', 3],
      ],
      'orderBy' => [
        'Date' => 'DESC',
      ],
      'limit' => 1,
    ]);
    
    return $current_level[0];
  }
  
  public function ToolHistory($cid, $gid) {
    $custom = CRM_JosiahVenture_Ajax_ToolsList::GetCustomName($gid);
    $history = civicrm_api4($custom, 'get', [
      'select' => [
        'id',
        'source_contact',
        'Note', 
        'Date',
        'entity_id',
        'c.display_name',
        'current_level:label', 
      ],
      'join' => [
        ['Contact AS c', TRUE, NULL, ['source_contact', '=', 'c.id']],
      ],
      'where' => [
        ['entity_id', '=', $cid],
      ],
      'orderBy' => [
        'Date' => 'DESC',
      ],
      'limit' => 25,
    ]);    
    return $history;
    
    
  }
  
  public function CustomKey(){
    return CRM_Core_Key::get('civicrm/ajax/customvalue');
  }
    
  public static function Ajax(){    
    //https://mvp1portal.josiahventure.com/civicrm/ajax/ToolsList?cid=3&type=1
    $contactId = CRM_Utils_Request::retrieve('cid', 'Positive');
    $type = CRM_Utils_Request::retrieve('type', 'Positive');
    
    $session = CRM_Core_Session::singleton();
    $id = $session->get('ufID');
    
    $return="";
    switch($type) {
      case 0:
        $gid = CRM_Utils_Request::retrieve('gid', 'Positive');
        $return = CRM_JosiahVenture_Ajax_ToolsList::Current($contactId, $gid); 
        break;
      case 1:
        $gid = CRM_Utils_Request::retrieve('gid', 'Positive');
        $return = CRM_JosiahVenture_Ajax_ToolsList::ToolHistory($contactId, $gid);
        break;
      case 2:
        $return = CRM_JosiahVenture_Ajax_ToolsList::CustomKey();
        break;
    }       
    
    CRM_Utils_JSON::output($return); 
  }

}

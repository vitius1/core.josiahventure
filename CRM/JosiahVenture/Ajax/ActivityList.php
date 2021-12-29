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
class CRM_JosiahVenture_Ajax_ActivityList {
    
  public static function Ajax(){
    //http://localhost/drupal/drupal-7/civicrm/ajax/ActivityList?cid=202&type=1&offset=0&rows=50
    
    $contactId = CRM_Utils_Request::retrieve('cid', 'Positive');
    $type = CRM_Utils_Request::retrieve('type', 'Positive');
    $offset = CRM_Utils_Request::retrieve('offset', 'Positive'); 
    $rowCount = CRM_Utils_Request::retrieve('rows', 'Positive');
    
    $session = CRM_Core_Session::singleton();
    $id = $session->get('ufID');
    
    // permission update=2; view=4
    if(!CRM_Activity_BAO_Activity::checkPermission(1, 4)) {
      CRM_Core_Error::statusBounce(ts('You are not authorized to access this page.'));
    } else {     
    
      $params = [
        'contact_id' => $contactId,
        'activity_type_id' => $type,
        'offset' => $offset,
        'rowCount' => $rowCount,
      ];
      
      $count = civicrm_api3('Activity', 'getcount', [
        'activity_type_id' => $type,
        'contact_id' => $contactId,
      ]);
      
      $activities = civicrm_api3('Activity', 'get', [
        'sequential' => 1,
        'return' => ["source_contact_id", "target_contact_id", "activity_date_time", "source_record_id", "custom_1", "details", "custom_2", "custom_3", "assignee_contact_id"],
        'contact_id' => $contactId,
        'activity_type_id' => $type,
        'options' => ['limit' => $rowCount, 'offset' => $offset, 'sort' => "activity_date_time desc"],
      ]);
      
      $category = civicrm_api3('OptionValue', 'get', [
        'sequential' => 1,
        'return' => ["label", "value"],
        //'option_group_id' => "category_20210719104109",
        'option_group_id' => "category_20210719104108",
        'is_active' => 1,
      ]);
      
      $offer = civicrm_api3('OptionValue', 'get', [
        'sequential' => 1,
        'return' => ["value", "label"],
        //'option_group_id' => "what_can_we_offer_20210719104352",
        'option_group_id' => "what_can_we_offer_20210719104350",
        'is_active' => 1,
      ]);
      
      
      $return=[];
      
      foreach ($activities["values"] as $activity) {
        $pom=[];
        $pom["count"]=$count;
        $pom["activity_id"]=$activity["id"];
        $date=date_create($activity["activity_date_time"]);
        $pom["activity_date_time"]=date_format($date, 'd.m.Y');
        $pom["source_contact_id"]=$activity["source_contact_id"];
        $pom["source_contact_name"]=$activity["source_contact_name"];
        $pom["target_contact_name"]=$activity["target_contact_name"];
        $pom["details"]=$activity["details"];
        $pom["assignee_contact_name"]=$activity["assignee_contact_name"];
        $pom["offer_more"]=$activity["custom_3"];
        $pom["category"]=[];
        foreach ($activity["custom_1"] as $key => $custom) {
          foreach ( $category["values"] as $cat ) {
              if ( $key == $cat["value"] ) {
                  $pom["category"][$key]=$cat["label"];
              }
          }
        }
        $pom["offer"]=[];
        foreach ($activity["custom_2"] as $key => $custom) {
          foreach ($offer["values"] as $value) {
            if($key==$value["value"]) {
              $pom["offer"][$key]=$value["label"];
            }
          }
        }    
        array_push($return, $pom);
      }  
      
      // print_r($return);
      CRM_Utils_JSON::output($return); 
    }
  }

}

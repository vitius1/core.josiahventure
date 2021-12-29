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
class CRM_JosiahVenture_Ajax_RelationshipList {
    
  public static function Ajax(){
    //https://localhost/drupal/drupal-7/civicrm/contact/view/rel?cid=202&action=add&reset=1
    //http://localhost/drupal/drupal-7/civicrm/ajax/RelationshipList?cid=202&offset=0&rows=50
    
    $contactId = CRM_Utils_Request::retrieve('cid', 'Positive');
    $offset = CRM_Utils_Request::retrieve('offset', 'Positive'); 
    $rowCount = CRM_Utils_Request::retrieve('rows', 'Positive');
     
    // permission update=2; view=4
    if(!CRM_Contact_BAO_Contact_Permission::allowList($contactId, 4)) {
      CRM_Core_Error::statusBounce(ts('You are not authorized to access this page.'));
    } else {      
      $result = civicrm_api3('Relationship', 'get', [
        'sequential' => 1,
        'return' => ["contact_id_a.display_name", "contact_id_b.display_name", "contact_id_a.id", "contact_id_b.id", "description", "start_date", "end_date", "relationship_type_id.label_a_b", "relationship_type_id.label_b_a", "custom_28"],
        'contact_id_a' => $contactId,
        'contact_id_b' => $contactId,  
        'relationship_type_id.description' => "relationship",
        'options' => ['limit' => $rowCount, 'offset' => $offset, 'sort' => "start_date desc", 'or' => [["contact_id_a", "contact_id_b"]]],
      ]);
      
      CRM_Utils_JSON::output($result["values"]); 
    }
  }

}

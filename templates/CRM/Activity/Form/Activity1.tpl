{*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
*}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anonymous+Pro&family=M+PLUS+1p:wght@100&display=swap" rel="stylesheet">
{literal}
<style>
  .fs-15 {
    font-size: 15px;
  }
  
  /* with contacts container */
  .crm-activity-form-block-target_contact_id .select2-choices {
    border: none;
    cursor: pointer;
    background: none;
  }
  
  .crm-activity-form-block-target_contact_id .select2-container {
    width: auto !important;
    
  }
  
  .crm-activity-form-block-target_contact_id .select2-choices:after {
    content: '+ Add a Name';
    color: var(--color-orange);
    font-style: italic;
  }
  
  /* with contacts */
  .crm-activity-form-block-target_contact_id .select2-search-choice {
    border: none !important;
    background: none !important;
    box-shadow: none !important;
    color: #556EE6 !important;
    font-size: 15px;
    font-weight: 600;
  }
  
  .activity-field {
    background: var(--color-lightest-gray) !important;
    width: 100%;
    margin-bottom: 2px;
    padding: 13px;
  }
  

  
  .activity-field .activity-inline {
    display: inline-flex;
    align-content: center;
    align-items: center;
    width: 33%;
  }
  
  .activity-field label {
    margin: 0;
  }
  
  .crm-activity-form-block table {
    width: 100%;
  }
  
  .crm-form-time, .crm-accordion-header {
    display: none;
  }
  
  #categories select {
    width: 150px;
  }
  
  #content {
    background: white;
  }
  
  #custom_13_13 {
    height: 5em;
    width: 6000em;
    width: 100%;
    border: none;
  }
  
  #custom_13_13:focus-visible {
    outline: none;
  }
  
  #what-offer-more .html-adjust {
    width: 100%;
  }
  
  #what-offer input {
    width: 16px;
    height: 16px;
    border-radius: 2px;
    border: 1px solid #556EE6;
    margin-top: 10px;
    display: none;
  }
  
  #what-offer input + *::before { 
  content: "\00a0";
  display: inline-flex;
  justify-content: center;
  align-items: bottom;
  line-height: 1.5em;
  width: 16px;
  height: 16px;
  border-radius: 3px;
  border: 1px solid #556EE6;
  font-size: 10px;
  cursor: pointer;
  margin-right: 8.5px;
  }
  
#what-offer input:checked + *::before {
  font-size: 10px;
  font-weight: bold;
  content: "✓";
  font-family: 'M PLUS 1p', sans-serif;
  -webkit-transform:scale(1.3,1); /* Safari and Chrome */
  -moz-transform:scale(1.3,1); /* Firefox */
  -ms-transform:scale(1.3,1); /* IE 9 */
  -o-transform:scale(1.3,1); /* Opera */
  transform:scale(1.3,1); /* W3C */
  width: 12.3px;
  margin-left: 1.85px;
  margin-right: 10.35px;
  color: white;
  background: #556EE6;
}
  
  #what-offer label {
    font-size: 13px;
    font-weight: normal;
    cursor: pointer;
    line-height: 1em;
    min-width: 100px;
    margin: 8px 0;
  }
  
  .label {
    margin-top: 12px;
  }
  
  #what-offer-more {
    margin-top: 8.5px;
    margin-bottom: 12px;
  }
  
  
  
  
</style>
{/literal}
{* this template is used for adding/editing other (custom) activities. *}
  <div class="crm-block crm-form-block crm-activity-form-block">

  {if $action eq 8} {* Delete action. *}
  <table class="form-layout">
  <tr>
    <td colspan="2">
      <div class="status">{ts}Are you sure you want to delete {/ts}{if $delName}'{$delName}'{/if}?</div>
    </td>
  </tr>
  {elseif $action eq 1 or $action eq 2  or $action eq 4 or $context eq 'search' or $context eq 'smog'}

  <table class="{if $action eq 4}crm-info-panel{else}form-layout{/if}">
  <div class="fs-15"><strong>Edit Your Conversation with:</strong></div>
  
  <!-- with contact {$form.target_contact_id.label} -->
  <div class="crm-activity-form-block-target_contact_id">
  
    <div class="view-value" colspan="2">
      {$form.target_contact_id.html}
    </div>
  </div>
  
  <div class="activity-field">
  
    <!-- date -->
    <div class="activity-inline">
      <span class="label">{$form.activity_date_time.label}</span>
      {if $action neq 4}
        <span class="view-value">{$form.activity_date_time.html}</span>
        {else}
        <span class="view-value">{$form.activity_date_time.value|crmDate}</span>
      {/if}
    </div>
    
    <div class="activity-inline">
      <span>Categories:*</span>
      <span id="categories">adsasd</span>
    </div>
    

    <!-- added by {$form.source_contact_id.label} -->
    <div class="float-right activity-inline">
      <span class="label"><label>Created by: </label></span>
      <span class="view-value">
        {$form.source_contact_id.html}
      </span>
    </div>

  
  </div>
  

  <!-- 
  subject 
  <tr class="crm-activity-form-block-subject">
    <td class="label">{$form.subject.label}</td><td class="view-value">{$form.subject.html}</td>
  </tr>
  -->



  <!-- status required 
  <tr class="crm-activity-form-block-status_id">
    <td class="label">{$form.status_id.label}</td><td class="view-value">{$form.status_id.html}</td>
  </tr>
  -->
  <div class="activity-field">
  <!-- details -->
  <div><strong>Notes:</strong></div>
  <div class="crm-activity-form-block-details">
    {if $activityTypeNameAndLabel.machineName eq "Print PDF Letter"}
      <div class="view-value" colspan="2">
      {$form.details.html}
      </div>
    {elseif $activityTypeNameAndLabel.machineName eq "Inbound Email"}
      <div class="view-value" colspan="2">
       {$form.details.html|crmStripAlternatives|nl2br}
      </div>
    {else}
      <div class="view-value" colspan="2">
       {$form.details.html|crmStripAlternatives}
      </div>
    {/if}
  </div>
  
  <!-- what can we offer -->
  <div>
    <div class="label"><label>What can we offer to help meet their needs? </label></div>
    <div class="view-value" id="what-offer">
    </div>
  </div>
  
  <!-- what can we offer - more info -->
  <div class="view-value" id="what-offer-more">    
  </div>
  
  <!-- custom data -->
  {if $action neq 4 OR $viewCustomData}
  <div class="crm-activity-form-block-custom_data">
    <div colspan="2">
      {include file="CRM/Activity/Form/ActivityCustomBlock.tpl"}
    </div>
  </div>
  
  <!-- assigned contact -->
  <div class="crm-activity-form-block-assignee_contact_id">
      <div class="label">
        {$form.assignee_contact_id.label}
        {edit}{help id="assignee_contact_id" title=$form.assignee_contact_id.label}{/edit}
      </div>
      <div>
        {$form.assignee_contact_id.html}
        {if $action neq 4}
          {if !$form.target_contact_id.frozen}
            <a href="#" class="crm-hover-button" id="swap_target_assignee" title="{ts}Swap Target and Assignee Contacts{/ts}" style="position:relative; bottom: 1em;">
              <i class="crm-i fa-random" aria-hidden="true"></i>
            </a>
          {/if}
          {if $activityAssigneeNotification}
            <br />
            <span id="notify_assignee_msg" class="description"><i class="crm-i fa-paper-plane" aria-hidden="true"></i> {ts}A copy of this activity will be emailed to each Assignee.{/ts} {help id="sent_copy_email"}</span>
          {/if}
        {/if}
      </div>
  </div>
  <div>
  
  {/if}
  <!-- require by civicrm hidden -->
  <tr class="crm-activity-form-block-priority_id" style="display: none;">
    <td class="label">{$form.priority_id.label}</td><td class="view-value">{$form.priority_id.html}</td>
  </tr>
  
  <tr class="crm-activity-form-block-status_id" style="display: none;">
    <td class="label">{$form.status_id.label}</td><td class="view-value">{$form.status_id.html}</td>
  </tr>
  
  {/if} {* End Delete vs. Add / Edit action *}
  </table>
  <div class="crm-submit-buttons">
  {if $action eq 4 && ($activityTypeNameAndLabel.machineName neq 'Inbound Email' || $allow_edit_inbound_emails == 1)}
    {if !$context }
      {assign var="context" value='activity'}
    {/if}
    {if $permission EQ 'edit'}
      {assign var='urlParams' value="reset=1&atype=$atype&action=update&reset=1&id=$entityID&cid=$contactId&context=$context"}
      {if ($context eq 'fulltext' || $context eq 'search') && $searchKey}
        {assign var='urlParams' value="reset=1&atype=$atype&action=update&reset=1&id=$entityID&cid=$contactId&context=$context&key=$searchKey"}
      {/if}
      <a href="{crmURL p='civicrm/activity/add' q=$urlParams}" class="edit button" title="{ts}Edit{/ts}"><span><i class="crm-i fa-pencil" aria-hidden="true"></i> {ts}Edit{/ts}</span></a>
    {/if}

    {if call_user_func(array('CRM_Core_Permission','check'), 'delete activities')}
      {assign var='urlParams' value="reset=1&atype=$atype&action=delete&reset=1&id=$entityID&cid=$contactId&context=$context"}
      {if ($context eq 'fulltext' || $context eq 'search') && $searchKey}
        {assign var='urlParams' value="reset=1&atype=$atype&action=delete&reset=1&id=$entityID&cid=$contactId&context=$context&key=$searchKey"}
      {/if}
      <a href="{crmURL p='civicrm/contact/view/activity' q=$urlParams}" class="delete button" title="{ts}Delete{/ts}"><span><i class="crm-i fa-trash" aria-hidden="true"></i> {ts}Delete{/ts}</span></a>
    {/if}
  {/if}
  {if $action eq 4 and $context != 'case' and call_user_func(array('CRM_Case_BAO_Case','checkPermission'), $activityId, 'File On Case', $atype)}
    <a href="#" onclick="fileOnCase('file', {$activityId}, null, this); return false;" class="cancel button" title="{ts}File On Case{/ts}"><span><i class="crm-i fa-clipboard" aria-hidden="true"></i> {ts}File on Case{/ts}</span></a>
    {include file="CRM/Case/Form/ActivityToCase.tpl"}
  {/if}
  {include file="CRM/common/formButtons.tpl" location="bottom"}
  </div>


  {if $action eq 1 or $action eq 2 or $context eq 'search' or $context eq 'smog'}
    {literal}
    <script type="text/javascript">
      CRM.$(function($) {
        var doNotNotifyAssigneeFor = {/literal}{$doNotNotifyAssigneeFor|@json_encode}{literal};
        $('#activity_type_id').change(function() {
          if ($.inArray($(this).val(), doNotNotifyAssigneeFor) != -1) {
            $('#notify_assignee_msg').hide();
          }
          else {
            $('#notify_assignee_msg').show();
          }
        });
      });
    </script>
    {/literal}
  {/if}
  </div>{* end of form block*}

{include file="CRM/Event/Form/ManageEvent/ConfirmRepeatMode.tpl" entityID=$activityId entityTable="civicrm_activity"}

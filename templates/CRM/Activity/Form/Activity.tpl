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
<link href="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/css/activity.css" rel="stylesheet">

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
  <div class="fs-15"><strong>{ts}Edit Your Conversation with{/ts}:</strong></div>
  
  <!-- with contact {$form.target_contact_id.label} -->
  <div class="crm-activity-form-block-target_contact_id">
  
    <div class="view-value" colspan="2">
      {$form.target_contact_id.html}
    </div>
  </div>
  
  <div class="activity-field">
  
    <!-- date -->
    <div class="activity-inline">
      <span class="label">{ts}Date{/ts}:*</span>
      {if $action neq 4}
        <span class="view-value">{$form.activity_date_time.html}</span>
        {else}
        <span class="view-value">{$form.activity_date_time.value|crmDate}</span>
      {/if}
    </div>
    
    <div class="activity-inline category">
      <label>{ts}Categories{/ts}:*</label>
      <span>
        <div class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdown-category" role="button" aria-haspopup="true" aria-expanded="false"></a>
          <div id="categories" class="dropdown-menu shadow animated--grow-in" aria-labelledby="userDropdown">
          </div>
        </div>
      </span>
    </div>
    

    <!-- added by {$form.source_contact_id.label} -->
    <div class="activity-inline created-by">
      <span class="label"><label>{ts}Created by{/ts}: </label></span>
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
  <div><strong>{ts}Notes{/ts}:</strong> <div class="show-ckeditor">Show editor</div></div>
  
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
    <div class="label"><label>{ts}What can we offer to help meet their needs?{/ts}</label></div>
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
        {ts}Who do you want to send a copy of this conversation to? Blue indicates that they were already notified.{/ts}
      </div>
      <div class="asignee">
        {$form.assignee_contact_id.html}
        {if $action neq 4}
          {if !$form.target_contact_id.frozen}
            <a href="#" class="crm-hover-button" id="swap_target_assignee" title="{ts}Swap Target and Assignee Contacts{/ts}" style="position:relative; bottom: 1em;">
              <i class="crm-i fa-random" aria-hidden="true"></i>
            </a>
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
  <div class="required">*Required fields</div>
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
  
  <div id="replace-button-name" style="display: none;">
    <div class="submit">{ts}Save and Send Conversation{/ts}</div>
    <div class="cancel">{ts}Cancel{/ts}</div>
  </div>
  
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
{literal}
<script>
  CRM.$(function($) {
    $('.show-ckeditor').click(function(){
      if ($('.cke_top').css('display') != "block") {
        $('.cke_top').css('display', 'block'); 
        $('.show-ckeditor').html('Hide editor');
    } else {
      $('.cke_top').css('display', 'none'); 
      $('.show-ckeditor').html('Show editor');
    }
    });
    
    if ($("#replace-button-name").length) {
      $('.crm-submit-buttons .crm-button-type-upload').html($("#replace-button-name .submit").html());
      $('.crm-submit-buttons .crm-button-type-cancel').html($("#replace-button-name .cancel").html());
    }
    
    setTimeout(function(){
      $(".asignee .select2-search-choice").addClass('asignee_sended');
    }, 500);
    
    
    
    
    
    $('.category .dropdown-menu').click(function(e) {
      e.stopPropagation();
    });
    
    // change categories label
    $('body').on('change', 'input[name*="custom_1"]', function() {
      var categories_css="";
      $('input[name*="custom_1"]:checked').each(function() {  
        if(categories_css=="") {
          categories_css=$('label[for="'+this.id+'"]').html();
        } else {
          categories_css+=", "+$('label[for="'+this.id+'"]').html();
        }
      });
      if(categories_css=="") {
        $('#category-before-class').html("");
      } else {
        $('#category-before-class').html('<style>.category .dropdown-toggle::before{content:"'+categories_css+'"; color:var(--color-blue);} </style>');
      }
      //console.log(categories_css);
      
    });
  });
  
  
</script>  
{/literal}

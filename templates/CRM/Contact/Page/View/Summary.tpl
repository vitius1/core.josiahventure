{*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
*}
{literal}
<script>
function getCid() {
  return {/literal}{$contactId}{literal};
}
</script>
{/literal}
<link href="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/css/summary.css" rel="stylesheet">
{assign var="prefix" value=""}

{* Contact Summary template for new tabbed interface. Replaces Basic.tpl *}
{if $action eq 2}
  {*edit contact*}
  {include file="CRM/Contact/Form/Contact.tpl"}
{else}

<div class="summary-menu">
{*next prev contact*}
<li class="crm-next-action d-inline-flex">
{if $nextContactID}
  
    {crmButton p='civicrm/contact/view' q="$urlParams&cid=$nextContactID" class="view" title=$nextContactName icon="chevron-right"}
      {ts}Next{/ts}
    {/crmButton}
  
{/if}
</li>
<li class="crm-previous-action d-inline-flex">
{if $prevContactID}
  
    {crmButton p='civicrm/contact/view' q="$urlParams&cid=$prevContactID" class="view" title=$prevContactName icon="chevron-left"}
      {ts}Previous{/ts}
    {/crmButton}
  
{/if}
</li>
  <div class="inline-flex tile-menu tile-menu-collapsed">
      <a href="#" id="show-tile-menu">Show tile menu</a>
  </div>
  <div class="inline-flex tile-menu tile-menu-expanded" style="display: none;">

      <a href="#conversation" id="show-conversation">Conversations</a>

      <a href="#relationship" id="show-relationship">Roles/Relationships</a>

      <a href="#program" id="show-program">Programs</a>

      <a href="#training" id="show-training">Trainings</a>
  
      <a href="#event" id="show-event">Events</a>
  
      <a href="#" id="hide-tile-menu" class="active">Hide tile menu</a>

  </div>
</div>

    <div class="crm-summary-block" id="contactname-block">
      <div class="summary-left-block">
        {include file="CRM/Contact/Page/Profile/MiniDashboard.tpl" prefix=$prefix}
        {include file="CRM/Contact/Page/Profile/Conversations.tpl" prefix=$prefix}
        {include file="CRM/Contact/Page/Profile/Relationships.tpl" prefix=$prefix}
        {include file="CRM/Contact/Page/Profile/Programs.tpl" prefix=$prefix}
        {include file="CRM/Contact/Page/Profile/Training.tpl" prefix=$prefix}
        {include file="CRM/Contact/Page/Profile/Events.tpl" prefix=$prefix}        
      </div>
      
      <div class="summary-right-block">
        {include file="CRM/Contact/Page/Profile/MinistryOverview.tpl" prefix=$prefix}
        {include file="CRM/Contact/Page/Profile/Tools.tpl" prefix=$prefix}
        <!--{include file="CRM/Contact/Page/Profile/Test.tpl" prefix=$prefix}-->
      </div>
    </div>
    
    {include file="CRM/Activity/Form/Activity.tpl"}
{/if}

{literal}
<script type="text/javascript" src="{/literal}{$prefix}{literal}/sites/all/themes/mycooltheme/js/summary/blocks.js"></script>
{/literal}



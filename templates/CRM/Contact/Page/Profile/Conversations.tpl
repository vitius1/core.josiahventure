<div id="conversation" class="summary-block" style="height: 70px;">
  <div class="title pointer">
    <div class="circle light-blue"><div class="arrow bigger-arrow"></div></div>
    <div class="w-90">
      <h3 class="title-label">Conversations</h3>
      <p class="description" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
        Use this tool for taking notes on conversations and notifying others about follow up needs. Click on the button on the right. Add the people involved, the date, and choose the topic of conversation. 
        You can type notes. Click on the conversations below to expand and edit.
      </p>
    </div>
    <div>
      <span class="hover hover-left" id="hover-new-conversation" style="display: none;">New conversation</span>
    </div>
    <div class="crm-contact_activities-list">
    <a class="plus circle orange mr-0 hover-desc" id="new-conversation" href="{$prefix}/civicrm/activity?reset=1&action=add&context=standalone&cid={$contactId}&selectedChild=activity&atype=1"></a> 
  </div>       
  </div>
  <div id="conversations" class="fancy-scroll summary-table" style="display: none;">
  </div>
</div>
{literal} 
<script type="text/javascript" src="{/literal}{$prefix}{literal}/sites/all/themes/mycooltheme/js/summary/conversations.js"></script>
{/literal}

<div id="relationship" class="summary-block" style="height: 70px;">
  <div class="title pointer">
    <div class="circle light-blue"><div class="arrow bigger-arrow"></div></div>
    <div class="w-90">
      <h3 class="title-label">Roles/Relationships</h3>
      <p class="description" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
        Click on the button right. Add the people involved, the date, and choose the topic of conversation. You can type notes. Click on the conversations below to edit the info and see 
        your
      </p>
    </div>
    <div>
      <span class="hover hover-left" id="hover-new-relationship" style="display: none;">New relationship</span>
    </div>
    <div class="crm-contact_activities-list">
    <a class="plus circle orange mr-0 hover-desc" id="new-relationship" href="{$prefix}/civicrm/contact/view/rel?cid={$contactId}&action=add&type=relationship&reset=1"></a>
    </div>
  </div>
  <div id="relationships" class="fancy-scroll summary-table" style="display: none;">
  </div>
</div>

{literal}
<script type="text/javascript" src="{/literal}{$prefix}{literal}/sites/all/themes/mycooltheme/js/summary/relationships.js"></script>
{/literal}
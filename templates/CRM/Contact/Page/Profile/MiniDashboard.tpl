<div class="mini-dashboard summary-block">
  <div class="dashboard-background">
    <div class="dashboard-add-my-contact" style="display: none;">
      <a class="plus circle transparent mt-1" href="#"></a>
      <span class="hover hover-right" style="display: none; margin-left: -7px;">Add to My Contacts</span>
    </div>
    <div class="dashboard-remove-my-contact" style="display: none;">
      <a class="circle transparent mt-1" href="#"><div class="checkmark"></div></a>
      <span class="hover hover-right" style="display: none; margin-left: -7px;">Remove from My Contacts</span>
    </div>
    <div class="inline-center dashboard-name">
      {$title}
    </div>
    <div class="inline-center dashboard-right">
      <div class="dashboard-relationship orange-text" style="font-size: 15px; font-weight: 600;"> 
        
        Youth Group Leader +2
      </div>
      
      <div class="dashboard-relationship-detail">
        5 years  1.9.2016 to 13.8.2018
      </div>
    </div>
  </div>
  <div class="dashboard-actions">
    <i class="fas fa-ellipsis-h dropdown" id="dropdownMenuButton" data-toggle="dropdown"></i>
    <div class="dropdown-menu drop2" aria-labelledby="dropdownMenuButton">
      <span><a href="{$prefix}/civicrm/contact/add?&action=update&cid={$contactId}">edit</a></span>
    </div>
  </div>
  <div class="dashboard-image">
    {if !empty($imageURL)}
          {$imageURL}
    {/if}
  </div>
  <div class="dashboard-content">
  <div class="dashboard-content-left">
  
      <div class="inline">
        <div>
          {foreach from=$email key="blockId" item=item}
            {if $item.email}
              {if $item.is_primary eq 1}
                {$item.email}
              {/if}
            {/if}
          {/foreach} 
        </div>
        <div>
          Brno, Czech Republic
        </div>
      </div>
      <div class="inline flex-center">
        <div class="text-left">
        <div>
          {foreach from=$phone item=item}
            {if $item.phone || $item.phone_ext}          
                {if $item.phone_ext}+{$item.phone_ext}&nbsp;{/if}{$item.phone}  
            {/if}
          {/foreach} 
          &nbsp;
        </div>
        <div>
          South Moravia
        </div>
      </div>
    </div>
    </div>
    <div class="dashboard-content-left">
      <div class="inline">
        <div>
          Male
        </div>
        <div>
          Age: 36
        </div>
      </div>
    <div class="inline bold flex-center">
      <div class="text-left">
      <div style="color: var(--color-dark-gray);">
        Nearby Regional Worker: 
      </div>
      <div>
        <a href="">Michal Soukup</a>
      </div>
    </div>
    </div>
  </div>
</div>
</div>

{literal}
<script type="text/javascript" src="{/literal}{$prefix}{literal}/sites/all/themes/mycooltheme/js/summary/miniDashboard.js"></script>
{/literal}
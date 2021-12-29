{*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
*}

<div class="row">
<div class="search {if $rows}collapsed{/if}" style="{if $rows}display: none;{/if}">
    <div class="crm-accordion-body">
            {* Loop through all defined search criteria fields (defined in the buildForm() function). *}
            {assign var="withradio" value="0"}
            {foreach from=$elements item=element}
                {if $form.$element.html|strstr:"crm-form-radio"}
                  {assign var="html" value=$form.$element.html}
                  {assign var="withradio" value="1"}
                {else}
                  {if $withradio=="1"}
                    {assign var="withradio" value="0"}
                    <div class="mb-3 crm-contact-custom-search-form-row-{$element}">
                        {$form.$element.label}
                        {$form.$element.html}
                        <div class="show-hide-radio" style="display: none;">{$html}</div>
                        {assign var="html" value=""}
                    </div>
                  {elseif $form.$element.label|strstr:"Show more options"}
                  <div class="mb-3 crm-contact-custom-search-form-row-{$element}">

                      <div>{$form.$element.html}{$form.$element.label}</div>
                  </div>
                  {else}
                    <div class="mb-3 crm-contact-custom-search-form-row-{$element}">
                        {$form.$element.label}
                        {$form.$element.html}
                    </div>
                  {/if}
                {/if}
            {/foreach}
        <div class="crm-submit-buttons">{include file="CRM/common/formButtons.tpl" location="bottom"}</div>
    </div><!-- /.crm-accordion-body -->
</div><!-- /.crm-accordion-wrapper -->
</div><!-- /.crm-form-block -->










{if $rowsEmpty || $rows}
<div class="crm-content-block">
{if $rowsEmpty}
    {include file="CRM/Contact/Form/Search/Custom/EmptyResults.tpl"}
{/if}

{if $summary}
    {$summary.summary}: {$summary.total}
{/if}

{if $rows}
  <div class="crm-results-block">
    {* Search request has returned 1 or more matching rows. Display results and collapse the search criteria fieldset. *}
        {* This section handles form elements for action task select and submit *}
       <div class="crm-search-tasks">
        {include file="CRM/Contact/Form/Search/ResultTasks.tpl"}
    </div>
        {* This section displays the rows along and includes the paging controls *}
        <div class="crm-search-results">
        {strip}
          <table class="table selector row-highlight" summary="{ts}Search results listings.{/ts}">
            <thead class="sticky table-light">
                <tr>
                <th class="sticky-col first-col" title="Select All Rows">{$form.toggleSelect.html}</th>
                {foreach from=$columnHeaders item=header}
                    {if $header.name == "Name"}
                      <th class="sticky-col second-col">  
                        {assign var='key' value=$header.sort}
                        {$sort->_response.$key.link}
                        <span class="cara"></span>  
                      </th>                   
                    {else}
                      <th scope="col">                      
                          {if $header.sort}
                              {assign var='key' value=$header.sort}
                              {$sort->_response.$key.link}
                          {else}
                              {$header.name}
                          {/if}                                          
                        </th>
                    {/if}
                {/foreach}
                <th>Action</th>
                </tr>
            </thead>
            <tbody>

            {counter start=0 skip=1 print=false}
            {foreach from=$rows item=row}
                <tr id='rowid{$row.contact_id}' class="{cycle values="odd-row,even-row"}">
                    {assign var=cbName value=$row.checkbox}
                    <td class="sticky-col first-col">{$form.$cbName.html}</td>
                    {foreach from=$columnHeaders item=header}
                      {assign var=fName value=$header.sort}
                  
                        {if $fName eq 'sort_name'}
                            <td class="sticky-col second-col"><a href="{crmURL p='civicrm/contact/view' q="reset=1&cid=`$row.contact_id`&key=`$qfKey`"}"><img class="search-image" src="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/images/default.jpg" />{$row.sort_name}</a><span class="cara"></span></td>
                        {else}
                            <td>{$row.$fName}</td>
                        {/if}
                    {/foreach}
                    <td><i class="fas fa-ellipsis-h dropdown" id="dropdownMenuButton" data-toggle="dropdown"></i>
                      <div class="dropdown-menu drop2" aria-labelledby="dropdownMenuButton">
                      {$row.action}
                    </div></td>
                </tr>
            {/foreach}
          </tbody>
        </table>
        </div>
        {/strip}


        {include file="CRM/common/pager.tpl" location="bottom"}

        </p>
    {* END Actions/Results section *}
    
    </div>
    {*include file="CRM/common/searchJs.tpl"*}
{/if}



</div>
{/if}

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
{literal}
$("#_qf_Custom_refresh-bottom").attr("formtarget", "_parent");

function CountryChange(value) {
  if(value!="") {
    var o;
    CRM.api3('StateProvince', 'get', {
      "sequential": 1,
      "return": ["name"],
      "country_id": value,
      "options": {"limit":0}
    }).then(function(result) {
      $("#s2id_kraj .select2-search-choice").remove();
      $("#kraj").find('option').remove();
      $("#kraj").attr('placeholder', '- libovolný kraj -');
      $("#kraj").attr("disabled", false);
      for (var i = 0; i < result["values"].length; i++) {
        o=new Option(result["values"][i]["name"], result["values"][i]["id"]);
        $(o).html(result["values"][i]["name"]);
        $("#kraj").append(o);

      }
    }, function(error) {
      // oops
    });
  } else {
    //$("#kraj option:selected").prop("selected", false);
    $("#s2id_kraj .select2-search-choice").remove();
    $("#kraj").find('option').remove();
    $("#kraj").attr("disabled", true);
  }
}




$("body").on("click", "#showHide", function(){
  if($("#showHide").is(":checked")){
    $(".show-hide-radio").show();
  } else {
    $(".show-hide-radio").hide();
  }

});
CRM.$(".crm-ajax-selection-form").removeClass("crm-ajax-selection-form");
{/literal}
</script>



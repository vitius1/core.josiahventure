{*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
*}
<div class="crm-block crm-form-block crm-contact-custom-search-form-block">
<div class="crm-accordion-wrapper crm-custom_search_form-accordion {if $rows}collapsed{/if}">
    <div class="crm-accordion-header crm-master-accordion-header">
      {ts}Edit Search Criteria{/ts}
    </div><!-- /.crm-accordion-header -->
    <div class="crm-accordion-body">
        <div class="crm-submit-buttons">{include file="CRM/common/formButtons.tpl" location="top"}</div>
        <table class="form-layout-compressed">
            {* Loop through all defined search criteria fields (defined in the buildForm() function). *}
            {assign var="withradio" value="0"}
            {foreach from=$elements item=element}
                {if $form.$element.html|strstr:"crm-form-radio"}
                  {assign var="html" value=$form.$element.html}
                  {assign var="withradio" value="1"}
                {else}
                  {if $withradio=="1"}
                    {assign var="withradio" value="0"}
                    <tr class="crm-contact-custom-search-form-row-{$element}">
                        <td class="label">{$form.$element.label}</td>
                        <td>{$form.$element.html}</td>
                        <td class="show-hide-radio" style="display: none;">{$html}</td>
                        {assign var="html" value=""}
                    </tr>
                  {elseif $form.$element.label|strstr:"Show more options"}
                  <tr class="crm-contact-custom-search-form-row-{$element}">
                      <td></td>
                      <td></td>
                      <td>{$form.$element.html}{$form.$element.label}</td>
                  </tr>
                  {else}
                    <tr class="crm-contact-custom-search-form-row-{$element}">
                        <td class="label">{$form.$element.label}</td>
                        <td>{$form.$element.html}</td>
                    </tr>
                  {/if}
                {/if}
            {/foreach}
        </table>
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

        {include file="CRM/common/pager.tpl" location="top"}

        {* Include alpha pager if defined. *}
        {if $atoZ}
            {include file="CRM/common/pagerAToZ.tpl"}
        {/if}

        {strip}
        <table class="selector row-highlight" summary="{ts}Search results listings.{/ts}">
            <thead class="sticky">
                <tr>
                <th scope="col" title="Select All Rows">{$form.toggleSelect.html}</th>
                {foreach from=$columnHeaders item=header}
                    <th scope="col">
                        {if $header.sort}
                            {assign var='key' value=$header.sort}
                            {$sort->_response.$key.link}
                        {else}
                            {$header.name}
                        {/if}
                    </th>
                {/foreach}
                <th>&nbsp;</th>
                </tr>
            </thead>

            {counter start=0 skip=1 print=false}
            {foreach from=$rows item=row}
                <tr id='rowid{$row.contact_id}' class="{cycle values="odd-row,even-row"}">
                    {assign var=cbName value=$row.checkbox}
                    <td>{$form.$cbName.html}</td>
                    {foreach from=$columnHeaders item=header}
                        {assign var=fName value=$header.sort}
                        {if $fName eq 'sort_name'}
                            <td><a href="{crmURL p='civicrm/contact/view' q="reset=1&cid=`$row.contact_id`&key=`$qfKey`"}">{$row.sort_name}</a></td>
                        {else}
                            <td>{$row.$fName}</td>
                        {/if}
                    {/foreach}
                    <td>{$row.action}</td>
                </tr>
            {/foreach}
        </table>
        {/strip}


        {include file="CRM/common/pager.tpl" location="bottom"}

        </p>
    {* END Actions/Results section *}
    </div>
    </div>
{/if}



</div>
{/if}

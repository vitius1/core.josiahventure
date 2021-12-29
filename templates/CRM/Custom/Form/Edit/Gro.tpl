<div class="tool-detail">
<div class="fs-15 tool-title"><strong>{ts}Gro Tool{/ts} - </strong></div>
<div style="width:calc(100% - 230px); display: inline-block; margin-right: 24px;">
  <div class="text">{ts}This tool is designed to help you assess the health of a disciple´s growth in Christ. To learn more about our GRO study{/ts} <a class="tool-trigger-instruction">click here</a>.</div>
  <div style="display: flex;">
    <img src="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/images/FiveChallanges.png" alt="5 Challanges of Christ Tool" style="width: 100%; margin: auto; max-width: 650px;">
  </div>
  <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
    <div class="slider-label">{ts}Overall Gro Level{/ts}:</div>
    <input class="slider" min="1" max="5" value="0" type="range" list="slider" id="current_level">

<datalist id="slider">
  <option value="1" label="1"></option>
  <option value="2" label="2"></option>
  <option value="3" label="3"></option>
  <option value="4" label="4"></option>
  <option value="5" label="5"></option>
</datalist>

</div>

  <div class="text">{ts}Open the GRO Diagnostic Tool by clicking on the button above to expand the sliders that you
    can use to assess the person´s current growth levels based on the instructions on the right.
    Take notes and once you click on the ´Save´ button bellow a new record will be made.{/ts}</div>
<div class="tool-footer"> 
<div class="tool-buttons">
</div>
<div class="tool-instruction">
  <a class="tool-trigger-instruction">{ts}Open diagnostic instruction{/ts}</a>
</div>
</div>

</div>
<div style="width: 200px; display: inline-block; vertical-align: top;">
  <div class="text fs-15 font-weight-bold mt-4 mb-3">History:</div> 
  <div class="history fancy-scroll">
    <table class="tool-history">
    </table>
  </div>
  <div class="fs-15 font-weight-bold mt-4 mb-2">Add a Note:</div>
  <textarea class="tool-note fancy-scroll" placeholder="{ts}Type your notes about this person´s current discipleship level.{/ts}" rows="9"></textarea>
  <div class="note">
  </div>
</div>
</div>
<div class="tool-instructions">
  <div class="fs-15"><strong>{ts}Diagnostic Instructins:{/ts}</strong></div>
  <div class="tool-instruction-text fancy-scroll">
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="obediance" id="Obedience"> 
      <div class="slider-label">{ts}Obedience{/ts}:</div>
    </div>
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="love" id="Love"> 
      <div class="slider-label">{ts}Love{/ts}:</div>
    </div>
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="worship" id="Worship"> 
      <div class="slider-label">{ts}Worship{/ts}:</div>
    </div>
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="witness" id="Witness"> 
      <div class="slider-label">{ts}Witness{/ts}:</div>
    </div>
    ROOTS
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="prayer" id="Prayer"> 
      <div class="slider-label">{ts}Prayer{/ts}:</div>
    </div>
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="word" id="Word_of_God"> 
      <div class="slider-label">{ts}Word of God{/ts}:</div>
    </div>
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="spirit" id="Spirit_of_God"> 
      <div class="slider-label">{ts}Spirit of God{/ts}:</div>
    </div>
    <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
      <input class="slider" min="1" max="5" value="0" type="range" list="family" id="Family_of_God"> 
      <div class="slider-label">{ts}Family of God{/ts}:</div>
    </div>
  </div>
</div>
<table {if !$isSingleRecordEdit}class="form-layout-compressed"{/if} style="display: none;"> 
  {foreach from=$cd_edit.fields item=element key=field_id}
    {assign var="element_name" value=$element.element_name}
    {assign var="formElement" value=$form.$element_name}
    <tr class="custom_field-row {$element.element_name}-row custom-{$element.id}">
      <td class="label">{$formElement.label}</td>
      <td class="html-adjust">
        {$formElement.html}
      </td>
    </tr>
  {/foreach}
</table>

{literal}
<script>
CRM.$(function() {
  $( document ).ready(function() {  
    // current level
    if($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:current_level']").val()!=undefined) {
      $('#Obediance').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Obediance']").val());
      $('#Love').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Love']").val());
      $('#Worship').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Worship']").val());
      $('#Witness').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Witness']").val());
      $('#Prayer').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Prayer']").val());
      $('#Word_of_God').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Word_of_God']").val());
      $('#Spirit_of_God').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Spirit_of_God']").val());
      $('#Family_of_God').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:Family_of_God']").val());
    } else {
      
    }
  });
  
  
});
</script>
{/literal}
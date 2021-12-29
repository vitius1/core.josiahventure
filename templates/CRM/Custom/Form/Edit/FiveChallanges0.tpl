<link href="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/css/tools.css" rel="stylesheet">
<div class="tool-detail">
<div class="fs-15 tool-title"><strong>{ts}5 Challanges of Christ Tool{/ts} - </strong></div>
<div style="width:calc(100% - 230px); display: inline-block; margin-right: 24px;">
  <div class="text">This tool is designed to help you assess the stages of growth in discipleship. To learn more about the 5 Challenges of Christ <a class="tool-trigger-instruction">click here</a>.</div>
  <div style="display: flex;">
    <img src="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/images/FiveChallanges.png" alt="5 Challanges of Christ Tool" style="width: 100%; margin: auto; max-width: 650px;">
  </div>
  <div style="width: calc(100% - 200px); margin: auto; min-width: 350px;">
    <div class="slider-label">Current Discipleship Level:</div>
    <input class="slider" min="1" max="5" value="0" type="range" list="slider" id="current-level">

<datalist id="slider">
  <option value="1" label="1"></option>
  <option value="2" label="2"></option>
  <option value="3" label="3"></option>
  <option value="4" label="4"></option>
  <option value="5" label="5"></option>
</datalist>

</div>

  <div class="text">This slider indicates the person’s current discipleship level. If you see this person at a different level based on the diagnostic instructions below, then you can change it by moving the slider above. Take notes on the right and once you click on the ‘Save’ button below a new record will be made.</div>
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
    <p>Jesus issued 5 challenges to his disciples, which help us as we walk with people along the disciple-making path. When we recognize where people are on the path, we can challenge them appropriately to take the next step as they follow with Jesus. This simple diagnostic will help you discern where they are. If most of the descriptions of a stage describe a person, they might be ready for their next challenge in following
Jesus.</p>

<p>Challenge 1: Come and See</p>

<p>• Seeking or curious, like Peter (John 1:35-39)<br>
   - (I need to be brought close so I can hear more)<br>
• Disinterested, or not seeking like the Samaritan woman (John 4)<br>
   - (I need you to believe I need the gospel, even if I don’t look interested)<br>
• Religious and lost, like Nicodemus (John 3)<br>
   - (I need you to mildly shock my categories and push my thinking)<br>
o Opposed and lost, like the Jews in the temple area (John 10:22-39)<br>
§ (I need you to continue to graciously tell me the truth, even if I don’t look like I want to hear it)<br>
q I don’t yet know enough or have enough exposure to respond to Jesus<br>
</p><p>Challenge 2: Repent and Believe</p><p>
I’m in Challenge 1 and need Challenge 2 if:<br>
q I’ve been in your life or part of the group for some time, but I haven’t made a decision about Jesus<br>
yet.<br>
q I know ‘enough’ to respond to Jesus and the gospel, but haven’t been presented with a clear<br>
opportunity and challenge to repent and believe.<br>
q I have been raised in the church but am not showing signs of spiritual growth or maturity.<br>
</p><p>Challenge 3: Follow me</p><p>
I’m in Challenge 3 if:<br>
q I’ve clearly heard and understood the whole gospel. I know and believe:<br>
o I’m created by God, for God, and without him I’m thirsty<br>
o I’m sinful and separated from God by my sin<br>
o Jesus is the only solution to my sin. He died on the cross for my sin and rose from the dead.<br>
o I have confessed, believed, and accepted Jesus to start my relationship with God<br>
q I’ve repented and believed, and Jesus is now the Savior of my soul and the leader of my life.<br>
</p>
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
  var cid = $('.CRM_Contact_Form_CustomData input[name="entryURL"]').val().split("entityID=")[1].split("&amp")[0];
  var customId;
  $.ajax({
    type: "GET",
    dataType: "json",
    url: "/civicrm/ajax/ToolsList",
    data: "cid="+cid+"&type=2",
    complete: function(data) {
      var string = JSON.stringify(data.responseJSON);
      customId = $.parseJSON(string);
    }
  });
  
  $( document ).ready(function() {
    // default values
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var hours = ("0" + now.getHours()).slice(-2);
    var minutes = ("0" + now.getMinutes()).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day)+" "+(hours)+":"+minutes;
    // date today to input
    if($('.custom-7 .crm-form-date-wrapper input[data-crm-custom="five_challanges_of_christ_tool:Date"]').val()=="") {
      $('.custom-7 .crm-form-date-wrapper input[data-crm-custom="five_challanges_of_christ_tool:Date"]').val(today);
    }
      
    $(".tool-note").val($(".custom-6 textarea").val());
    
    
    // current level
    if($(".custom-5 input[checked='checked']").val()!=undefined) {
      $('#current-level').val($(".custom-5 input[checked='checked']").val());
    } else {
      $.ajax({
        type: "GET",
        dataType: "json",
        url: "/civicrm/ajax/ToolsList",
        data: "cid="+cid+"&type=0",
        complete: function(data) {
          var status = JSON.stringify(data.responseJSON)[1];
          $('.custom-5 input[name*="custom_5"]').attr('checked', false);
          if(status>=1 && status<=5) {
            $('#current-level').val(status);
            $('.custom-5 input[name*="custom_5"]').filter('[value="'+status+'"]').attr('checked', true);
          } else {
            $('.custom-5 input[name*="custom_5"]').filter('[value="1"]').attr('checked', true);
          }
        }
      });
    }
    
    // id from who create new value
    if($('.custom-8 input').val()=="") {
      $('.custom-8 input').val({/literal}{$session->get('userID')}{literal});
    } 
    var cid = $('.custom-8 input').val();
    CRM.api3('Contact', 'getsingle', {
      "return": ["display_name"],
      "id": cid
    }).then(function(result) {
      var display_name=result["display_name"];
      $('.tool-title strong').append(display_name+" ");
      $('.tool-title strong').append($('.ui-dialog .custom-7 .crm-form-date-wrapper input[data-crm-custom="five_challanges_of_christ_tool:Date"]').val());
    });
    
    
    
    
    //history
    var html = "";
    var item;
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/civicrm/ajax/ToolsList",
        data: "cid="+cid+"&type=1",
        complete: function(data) {
          var string = JSON.stringify(data.responseJSON);
          var json = $.parseJSON(string);
          var keys = Object.keys(json);   
          var cgcount = keys.length;      
          for (var i = 0; i < keys.length; i++) {
            item = json[keys[i]];
            html += '<div class="tool-history-row">';
            html += '  <div class="date">'+item["Date"]+'</div>';
            html += '  <div class="edit">';
            html += '    <i class="fas fa-ellipsis-h dropdown" id="dropdownMenuButton" data-toggle="dropdown"></i>';
            html += '    <div class="dropdown-menu drop2" aria-labelledby="dropdownMenuButton">';
            html += '      <span class="edit-tool"><a href="/civicrm/contact/view/cd/edit?reset=1&type=Individual&groupID=2&entityID=3&cgcount='+cgcount+'&multiRecordDisplay=single&mode=edit" class="crm-option-edit-link">edit</a></span>';
            html += '      <span class="delete-tool"><a href="#" class="action-item crm-hover-button delete-custom-row" title="Delete five_challanges_of_christ_tool record" data-delete_params="'+item["id"]+'">Delete</a></span>';
            html += '    </div>';
            html += '  </div>';
            html += '  <div><a class="name" href="/civicrm/contact/view?reset=1&cid='+item["source_contact"]+'">'+item["c.display_name"]+'</a></div>';
            html += '  <div class="note"><strong>D'+item["disciplenship_level"]+' -</strong>'+item["Note"]+'</div>';
            html += '</div>';
            cgcount--;
          }
          $('.tool-history').html(html);        
        }
      });
      
      // button
      $('.tool-buttons').html($('.ui-dialog-buttonpane').get());
  });
  
  $("body").on("click", ".edit-tool", function(){
    $('.ui-dialog-buttonset button[data-identifier="_qf_CustomData_cancel"]').click();
  });
  
  
  
  
    
    $('.history').on('click', 'a.delete-custom-row', function(e) {
      deleteRow($(this));
      e.preventDefault();
    });

    function deleteRow($el) {
      CRM.confirm({
        message: '{/literal}{ts escape='js'}Are you sure you want to delete this record?{/ts}{literal}'
      }).on('crmConfirm:yes', function() {
        var postUrl = {/literal}"{crmURL p='civicrm/ajax/customvalue' h=0 }"{literal};
        var values = {
          'valueID': $el.data('delete_params'),
          'groupID': '2',
          'key': customId,
          'contactId': cid
        };
        var request = $.post(postUrl, values);
        CRM.status({/literal}"{ts escape='js'}Record Deleted{/ts}"{literal}, request);
        request.done(function() {
          CRM.refreshParent($el);
        });
      })
    }
  
  // on change current level of discipleship
  $('body').on('input', '#current-level', function(){
    $('.custom-5 input[name*="custom_5"]').attr('checked', false);
    $('.custom-5 input[name*="custom_5"]').filter('[value="'+$(this).val()+'"]').attr('checked', true);
    //alert($('.custom-5 input[name*="custom_5"]:checked').val());
  });
  
  // on change notes
  $('body').on('change', '.tool-note', function(){
    $('.custom-6 textarea').val($(this).val());
  });
  
  // open/close instructions
  $('.tool-trigger-instruction').click(function(){
    if($(this).hasClass("open")) {
      $('.tool-instructions').hide();
      $('.tool-footer').attr('style', '');
      $(this).removeClass("open");
    } else {
      $('.tool-instructions').show();
      $('.tool-footer').attr('style', 'bottom: 372px;');
      $(this).addClass("open");
    }
  });
});
</script>
{/literal}
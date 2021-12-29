
<link href="https://mvp1portal.josiahventure.com/sites/all/themes/mycooltheme/css/tools.css" rel="stylesheet">

{if $group_id==2}
  
  {assign var="custom_field_name" value="Custom_five_challanges_of_christ_tool"}
  {assign var="name" value="five_challanges_of_christ_tool"}
  {include file="CRM/Custom/Form/Edit/FiveChallanges.tpl"}
{elseif $group_id==3}
  
  {assign var="custom_field_name" value="Custom_Gro"}
  {assign var="name" value="Gro"}
  {include file="CRM/Custom/Form/Edit/Gro.tpl"}
{/if}


{literal}
<script>
// get cid from url
var cid = CRM.$('.CRM_Contact_Form_CustomData input[name="entryURL"]').val().split("entityID=")[1].split("&amp")[0];

CRM.$(function() {
  $( document ).ready(function() {  
    // current level
    if($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:current_level']").val()!=undefined) {
      $('#current-level').val($(".custom_field-row input[checked='checked'][data-crm-custom='{/literal}{$name}{literal}:current_level']").val());
    } else {
      $.ajax({
        type: "GET",
        dataType: "json",
        url: "/civicrm/ajax/ToolsList",
        data: "cid="+cid+"&type=0&gid={/literal}{$group_id}{literal}",
        complete: function(data) {
          var status = data.responseJSON;
          console.log(status["current_level"]);
          $('.custom_field-row input[data-crm-custom="{/literal}{$name}{literal}:current_level"]').attr('checked', false);
          if(status["current_level"] != undefined) {
            $('#current_level').val(status["current_level"]);
            $('.custom_field-row input[data-crm-custom="{/literal}{$name}{literal}:current_level"]').filter('[value="'+status+'"]').attr('checked', true);
          } else {
            $('.custom_field-row input[data-crm-custom="{/literal}{$name}{literal}:current_level"]').filter('[value="1"]').attr('checked', true);
          }
        }
      });
    }
  });
  
  // get custom id from contact for delete
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
    // default values for date
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var hours = ("0" + now.getHours()).slice(-2);
    var minutes = ("0" + now.getMinutes()).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day)+" "+(hours)+":"+minutes;
    // date today to input
    if($('.crm-form-date-wrapper input[data-crm-custom="{/literal}{$name}{literal}:Date"]').val()=="") {
      $('.crm-form-date-wrapper input[data-crm-custom="{/literal}{$name}{literal}:Date"]').val(today);
    }
      
    // for edit show textarea content
    $(".tool-note").val($(".custom_field-row textarea").val());
    
    
    // id from who create new value
    if($('input[data-crm-custom="{/literal}{$name}{literal}:source_contact"]').val()=="") {
      $('input[data-crm-custom="{/literal}{$name}{literal}:source_contact"]').val({/literal}{$session->get('userID')}{literal});
    } 
    var source_id = $('input[data-crm-custom="{/literal}{$name}{literal}:source_contact"]').val();
    CRM.api3('Contact', 'getsingle', {
      "return": ["display_name"],
      "id": source_id
    }).then(function(result) {
      var display_name=result["display_name"];
      $('.tool-title strong').append(display_name+" ");
      $('.tool-title strong').append($('.ui-dialog .crm-form-date-wrapper input[data-crm-custom="{/literal}{$name}{literal}:Date"]').val());
    });
    
    //history
    var html = "";
    var item;
    console.log("cid="+cid+"&type=1&gid={/literal}{$group_id}{literal}"); 
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/civicrm/ajax/ToolsList",
        data: "cid="+cid+"&type=1&gid={/literal}{$group_id}{literal}",
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
            html += '      <span class="edit-tool"><a href="/civicrm/contact/view/cd/edit?reset=1&type=Individual&groupID={/literal}{$group_id}{literal}&entityID=3&cgcount='+cgcount+'&multiRecordDisplay=single&mode=edit" class="crm-option-edit-link">edit</a></span>';
            html += '      <span class="delete-tool"><a href="#" class="action-item crm-hover-button delete-custom-row" title="Delete record" data-delete_params="'+item["id"]+'">Delete</a></span>';
            html += '    </div>';
            html += '  </div>';
            html += '  <div><a class="name" href="/civicrm/contact/view?reset=1&cid='+item["source_contact"]+'">'+item["c.display_name"]+'</a></div>';
            html += '  <div class="note"><strong>'+item["current_level:label"]+' -</strong>'+item["Note"]+'</div>';
            html += '</div>';
            cgcount--;
          }
          $('.tool-history').html(html);        
        }
      });
      
      // button
      $('.tool-buttons').html($('.ui-dialog-buttonpane').get());
    });
  
    // on change level
    $('body').on('input', '.slider', function(){
      console.log(this.id);
      console.log($(this).val());
      $('.custom_field-row input[checked="checked"][data-crm-custom="{/literal}{$name}{literal}:'+this.id+'"]').attr('checked', false);
      $('.custom_field-row input[data-crm-custom="{/literal}{$name}{literal}:'+this.id+'"]').filter('[value="'+$(this).val()+'"]').attr('checked', true);
      //alert($('.custom-5 input[name*="custom_5"]:checked').val());
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
  
  // on change notes
  $('body').on('change', '.tool-note', function(){
    $('.custom_field-row textarea').val($(this).val());
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
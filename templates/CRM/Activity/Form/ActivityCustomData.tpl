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
<script type="text/javascript">
  (function($) {
    CRM.buildCustomData = function (type, subType, subName, cgCount, groupID, isMultiple, onlySubtype, cid) {
      var dataUrl = CRM.url('civicrm/custom', {type: type}),
        prevCount = 1,
        fname = '#customData',
        storage = {};

      if (subType) {
        dataUrl += '&subType=' + subType;
      }

      if (onlySubtype) {
        dataUrl += '&onlySubtype=' + onlySubtype;
      }

      if (subName) {
        dataUrl += '&subName=' + subName;
        $('#customData' + subName).show();
      }
      else {
        $('#customData').show();
      }
      if (groupID) {
        dataUrl += '&groupID=' + groupID;
      }

      {/literal}
      {if $groupID}
        dataUrl += '&groupID=' + '{$groupID}';
      {/if}
      {if $entityID}
        dataUrl += '&entityID=' + '{$entityID}';
      {/if}
      {if $qfKey}
        dataUrl += '&qf=' + '{$qfKey}';
      {/if}
      {if $action}
        dataUrl += '&action=' + '{$action}';
      {/if}
      {literal}
      if (cid) {
        dataUrl += '&cid=' + cid;
      }

      if (!cgCount) {
        cgCount = 1;
      }
      else if (cgCount >= 1) {
        prevCount = cgCount;
        cgCount++;
      }

      dataUrl += '&cgcount=' + cgCount;


      if (isMultiple) {
        fname = '#custom_group_' + groupID + '_' + prevCount;
        if ($(".add-more-link-" + groupID + "-" + prevCount).length) {
          $(".add-more-link-" + groupID + "-" + prevCount).hide();
        }
        else {
          $("#add-more-link-" + prevCount).hide();
        }
      }
      else if (subName && subName != 'null') {
        fname += subName;
      }
      
      
      return CRM.loadPage(dataUrl, {target: fname}).on('crmLoad', function(event, data) {
        var categories = $("tr[class*='custom_1'] .html-adjust").html();
        var categories_css="";
        $('input[name*="custom_1"]:checked').each(function() {  
          if(categories_css=="") {
            categories_css=$('label[for="'+this.id+'"]').html();
          } else {
            categories_css+=", "+$('label[for="'+this.id+'"]').html();
          }
        });
        if(categories_css=="") {
          $('body').append('<div id="category-before-class"></div>');
        } else {
          $('body').append('<div id="category-before-class"><style>.category .dropdown-toggle::before{content:"'+categories_css+'"; color:var(--color-blue);}</style></div>');
        }
        
        $("#categories").html(categories);
        $("tr[class*='custom_1']").remove();
        
        var offer = $("tr[class*='custom_2'] .html-adjust").html();
        $("#what-offer").html(offer);
        $("tr[class*='custom_2']").remove();
        
        var offer_more = $("tr[class*='custom_3'] .html-adjust").html();
        $("#what-offer-more").html(offer_more);
        $("tr[class*='custom_3']").remove();
      });
    };
  })(CRM.$);
</script>
{/literal}

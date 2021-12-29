<div id="test" class="summary-block">
  <div class="title active pointer">
    <div class="w-75">
      <h3 class="title-label">Custom</h3>
      <p class="description">
        Vítek was here
      </p>
    </div>
  </div>
  <div id="tests" class="fancy-scroll ml-3 dark-gray-text" style="height: 200px; overflow-y:auto;">
    <span>Reverse</span><p>click -><a class="pointer" id="reverse"> HERE </a><-</p>
    <span>Dark theme</span><p>click -><a class="pointer" id="dark"> HERE </a><-</p>
    <span>You are lost?</span><p>click -><a class="pointer" id="lost"> HERE </a><-</p>
  </div>
</div>

{literal}
<script>
  CRM.$("#reverse").click(function(){
    CRM.$(":root")[0].style.setProperty("--color-white", "black");
    CRM.$(":root")[0].style.setProperty("--color-dark-gray", "#8b8772");
    CRM.$(":root")[0].style.setProperty("--color-orange", "#0099ff");
    CRM.$(":root")[0].style.setProperty("--color-light-orange", "#006bb2");
    CRM.$(":root")[0].style.setProperty("--color-black", "white");
    CRM.$(":root")[0].style.setProperty("--color-darkest-gray", "#b6afa8");
    CRM.$(":root")[0].style.setProperty("--color-light-blue", "#2b2506");
    CRM.$(":root")[0].style.setProperty("--color-lightest-blue", "#1c1800");
    CRM.$(":root")[0].style.setProperty("--color-purple-gray", "#434a2f");
    CRM.$(":root")[0].style.setProperty("--color-lightest-gray", "#070704");
    CRM.$(":root")[0].style.setProperty("--color-light-gray", "#161714");
    CRM.$(":root")[0].style.setProperty("--color-gray", "#262c17");
    CRM.$(":root")[0].style.setProperty("--color-full-black", "#eef4dd");
    CRM.$(":root")[0].style.setProperty("--color-divider", "#d5cfbd");
    CRM.$(":root")[0].style.setProperty("--color-table-divider", "#100d08");
    CRM.$(":root")[0].style.setProperty("--color-box-shadow", "#0f0f0f");
    CRM.$(":root")[0].style.setProperty("--color-search", "#0c0c06");
    CRM.$("body").attr("style", "transform: rotate(180deg) !important; -webkit-transform: rotate(180deg) !important;");
  });
  
  CRM.$("#dark").click(function(){
    $(":root")[0].style.setProperty("--color-white", "black");
    $(":root")[0].style.setProperty("--color-dark-gray", "#b6afa8");
    $(":root")[0].style.setProperty("--color-orange", "#FF6600");
    $(":root")[0].style.setProperty("--color-light-orange", "#ff944d");
    $(":root")[0].style.setProperty("--color-black", "white");
    $(":root")[0].style.setProperty("--color-darkest-gray", "#74788D");
    $(":root")[0].style.setProperty("--color-light-blue", "#243370");
    $(":root")[0].style.setProperty("--color-lightest-blue", "#364dad");
    $(":root")[0].style.setProperty("--color-purple-gray", "#434a2f");
    $(":root")[0].style.setProperty("--color-lightest-gray", "#070704");
    $(":root")[0].style.setProperty("--color-light-gray", "#161714");
    $(":root")[0].style.setProperty("--color-gray", "#262c17");
    $(":root")[0].style.setProperty("--color-full-black", "#e65c17");
    $(":root")[0].style.setProperty("--color-divider", "#d5cfbd");
    $(":root")[0].style.setProperty("--color-table-divider", "#100d08");
    $(":root")[0].style.setProperty("--color-box-shadow", "#0f0f0f");
    $(":root")[0].style.setProperty("--color-search", "#0c0c06");
    $(".dashboard-name").css("color", "white");
    $(".dashboard-relationship-detail").css("color", "#b6afa8");
    $(".arrow").css("border-color", "#F8F8FB");
    $(".plus").attr("style", "color: #F8F8FB !important;");
    $("#sidebarToggle").attr("style", "background: black !important;");
  });
  
  CRM.$("#lost").click(function(){
    alert("Try to look at it in different angle. That may help :)");
    CRM.$("body").attr("style", "transform: rotate(50deg) !important; -webkit-transform: rotate(50deg) !important;");
  });
  
</script>
{/literal}
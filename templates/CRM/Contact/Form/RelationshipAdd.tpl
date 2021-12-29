<div class="crm-block crm-form-block crm-relationship-form-block">
  <table class="form-layout-compressed">
    <tr class="crm-relationship-form-block-relationship_type_id">
      <td class="label">{$form.relationship_type_id.label}</td>
      <td>{$form.relationship_type_id.html}</td>
    </tr>
    <tr class="crm-relationship-form-block-related_contact_id">
      <td class="label">{$form.related_contact_id.label}</td>
      <td>{$form.related_contact_id.html}</td>
    </tr>
    <tr class="crm-relationship-form-block-is_current_employer" style="display:none;">
      <td class="label">{$form.is_current_employer.label}</td>
      <td>{$form.is_current_employer.html}</td>
    </tr>
    <tr class="crm-relationship-form-block-start_date">
      <td class="label">{$form.start_date.label}</td>
      <td>{$form.start_date.html} {$form.end_date.label} {$form.end_date.html}<br /><span class="description">{ts}If this relationship has start and/or end dates, specify them here.{/ts}</span></td>
    </tr>
    <tr class="crm-relationship-form-block-description">
      <td class="label">{$form.description.label}</td>
      <td>{$form.description.html}</td>
    </tr>
    <tr class="crm-relationship-form-block-note">
      <td class="label">{$form.note.label}</td>
      <td>{$form.note.html}</td>
    </tr>
    <tr class="crm-relationship-form-block-is_permission_a_b">
      {capture assign="contact_b"}{if $action eq 1}{ts}selected contact(s){/ts}{else}{$display_name_b}{/if}{/capture}
      <td class="label"><label>{ts}Permissions{/ts}</label></td>
      <td>
        {ts 1=$display_name_a 2=$contact_b}Permission for <strong>%1</strong> to access information about <strong>%2</strong>{/ts}<br />
        {$form.is_permission_a_b.html}
      </td>
    </tr>
    <tr class="crm-relationship-form-block-is_permission_b_a">
      <td class="label"> </td>
      <td>
        {ts 1=$contact_b|ucfirst 2=$display_name_a}Permission for <strong>%1</strong> to access information about <strong>%2</strong>{/ts}<br />
        {$form.is_permission_b_a.html}
      </td>
    </tr>
    <tr class="crm-relationship-form-block-is_active">
      <td class="label">{$form.is_active.label}</td>
      <td>{$form.is_active.html}</td>
    </tr>
  </table>
  <div id="customData"></div>
  <div class="spacer"></div>
</div>
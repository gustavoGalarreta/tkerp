ready = ->
  if current_scope "invoices"
    $('input[type=checkbox]').change update

update = ->
  $("." + this.name + " input").val("")
  $("." + this.name).toggleClass("hide",!this.checked)

$(document).ready(ready)
$(document).on('page:load', ready)

->
  $('#tabs').tab();

# alert box html for js.erb files

@alert_box = (level, close_btn, msg) ->
  if close_btn == 'y'
    html = \
    "<div class='alert fade in alert-#{level}'>
    <button class='close' data-dismiss='alert'>\&times;</button>#{msg}</div>"
  else
    html = \
    "<div class='alert fade in alert-#{level}'>#{msg}</div>"
  return html
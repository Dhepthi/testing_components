# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_to_field(name,form_name)
    new_form = render(form_name)
    link_to_function(name, h("load_content_for_tabs(\"#{escape_javascript(new_form)}\")"))
  end
end

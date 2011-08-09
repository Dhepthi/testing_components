# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def render_new_form
    render("new",:people => People.new)
   
  end

end

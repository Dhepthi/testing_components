require 'spec_helper'

describe "/people/edit.html.erb" do
  include PeopleHelper

  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :new_record? => false,
      :name => "value for name",
      :age => "value for age",
      :language => "value for language"
    )
  end

  it "renders the edit person form" do
    render

    response.should have_tag("form[action=#{person_path(@person)}][method=post]") do
      with_tag('input#person_name[name=?]', "person[name]")
      with_tag('input#person_age[name=?]', "person[age]")
      with_tag('input#person_language[name=?]', "person[language]")
    end
  end
end

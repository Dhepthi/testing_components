require 'spec_helper'

describe "/people/new.html.erb" do
  include PeopleHelper

  before(:each) do
    assigns[:person] = stub_model(Person,
      :new_record? => true,
      :name => "value for name",
      :age => "value for age",
      :language => "value for language"
    )
  end

  it "renders new person form" do
    render

    response.should have_tag("form[action=?][method=post]", people_path) do
      with_tag("input#person_name[name=?]", "person[name]")
      with_tag("input#person_age[name=?]", "person[age]")
      with_tag("input#person_language[name=?]", "person[language]")
    end
  end
end

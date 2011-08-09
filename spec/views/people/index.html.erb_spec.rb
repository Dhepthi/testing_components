require 'spec_helper'

describe "/people/index.html.erb" do
  include PeopleHelper

  before(:each) do
    assigns[:people] = [
      stub_model(Person,
        :name => "value for name",
        :age => "value for age",
        :language => "value for language"
      ),
      stub_model(Person,
        :name => "value for name",
        :age => "value for age",
        :language => "value for language"
      )
    ]
  end

  it "renders a list of people" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for age".to_s, 2)
    response.should have_tag("tr>td", "value for language".to_s, 2)
  end
end

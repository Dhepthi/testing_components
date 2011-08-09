require 'spec_helper'

describe "/people/show.html.erb" do
  include PeopleHelper
  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :name => "value for name",
      :age => "value for age",
      :language => "value for language"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ age/)
    response.should have_text(/value\ for\ language/)
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe People do
  fixtures :countries, :peoples
  before(:each) do
    @valid_attributes = {
      :name => "Spritle",
      :address => "Vadapalani",
      :country_name => "India"
    }
    @people = People.create(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    People.create!(@valid_attributes)
  end

  it "should return country name for requested person" do
    @people.country_name == @valid_attributes[:country_name]
  end

  it "should create or find the country" do
    @create_country = {
      :name => "xyz",
      :address => "abc",
      :country_name => "USA"
    }
    @person = People.create(@create_country)
    @person.country.should be_instance_of(Country)
  end
end

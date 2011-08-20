require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Country do
  fixtures :countries
  before(:each) do
    @valid_attributes = {
      :name => "India"
    }
  end

  it "should create a new instance given valid attributes" do
    Country.create!(@valid_attributes)
  end
  
end

require 'spec_helper'

describe Person do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :age => "value for age",
      :language => "value for language"
    }
  end

  it "should create a new instance given valid attributes" do
    Person.create!(@valid_attributes)
  end
end

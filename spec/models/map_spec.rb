require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Map do
  fixtures :maps
  before(:each) do
    @valid_attributes = {
      :marker_name => "Marker 1",
      :latitude => 12.653456,
      :longitude => 24.67834
    }
  end

  it "should create a new instance given valid attributes" do
    Map.create!(@valid_attributes)
  end

end

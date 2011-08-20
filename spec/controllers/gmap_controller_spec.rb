require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'json'

describe GmapController do
#  fixtures :maps

   def mock_map(stubs={})
    @mock_map ||= mock_model(Map, stubs)
  end

   describe "GET save marker" do

    describe "with valid params" do
      it "assigns a newly created marker as @Marker" do
        Map.stub(:new).with({'these' => 'params'}).and_return(mock_map(:save => true))
        get :save_marker, :markers => {:these => 'params'}
        assigns[:markers].should equal(mock_map)
      end

      it "should send the json message as success" do
        Map.stub(:new).and_return(mock_map(:save => true))
        get :save_marker, :markers => {:these => 'params'}
        @msg = "Markers Saved in DataBase"
       JSON.parse(response.body)["error_message"].should == @msg
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved map as @map" do
        Map.stub(:new).with({'these' => 'params'}).and_return(mock_map(:save => false))
        get :save_marker, :markers => {:these => 'params'}
        assigns[:markers].should equal(mock_map)
      end

     it "should send the json message as failure" do
        Map.stub(:new).and_return(mock_map(:save => false))
        get :save_marker, :markers => {:these => 'params'}
        @msg = "Failed in Saving the Data"
       JSON.parse(response.body)["error_message"].should == @msg
      end
    end
  end

    describe "GET delete marker" do

    describe "with valid params" do
      it "destroys the requested Marker" do
        Map.should_receive(:find_by_latitude_and_longitude).and_return(mock_map)
        mock_map.should_receive(:destroy)
        get :delete_marker, :latitude => "37", :longitude => "12333"
      end

      it "should send the json message as success" do
        Map.should_receive(:find_by_latitude_and_longitude).and_return(mock_map)
        mock_map.should_receive(:destroy)
        get :delete_marker, :latitude => "37", :longitude => "12333"
        @msg = "Marker Deleted From Database"
       JSON.parse(response.body)["error_message"].should == @msg
      end
    end
  end
  describe "GET delete all markers" do

    describe "with valid params" do
      it "destroys the requested Marker" do
        Map.stub(:destroy_all).and_return(true)
        get :delete_all_markers, :button_click => "true"
      end

      it "should send the json message as success" do
        Map.stub(:destroy_all).and_return(true)
        get :delete_all_markers, :button_click => "true"
        @msg = "All the Markers are Deleted"
       JSON.parse(response.body)["error_message"].should == @msg
      end
    end
    describe "with invalid params" do
      it "destroys the requested Marker" do
        Map.stub(:destroy_all).and_return(true)
        get :delete_all_markers, :button_click => "false"
      end

      it "should send the json message as success" do
        Map.stub(:destroy_all).and_return(true)
        get :delete_all_markers, :button_click => "false"
        @msg = "Please Click on Map to Create Marker"
       JSON.parse(response.body)["error_message"].should == @msg
      end
    end
  end

end

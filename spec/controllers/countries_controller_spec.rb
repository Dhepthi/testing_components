# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CountriesController do
   fixtures :countries
  before(:each) do
    @countries_controller = CountriesController.new
  end

   it "should pass" do
    get :index
    response.should be_success
  end
end


# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PeoplesController do
  fixtures :countries, :peoples
  before(:each) do
#    @peoples_controller = PeoplesController.new
    @people = {:people => {:name => peoples(:one).name,:address => peoples(:one).address}}
    @id = {:id => peoples(:one).id}
    @id1 = {:id => 3}
  end

   it "should pass index action" do
    get :index
    response.should be_success
  end

  it "should get single record for show action" do
     get :show,@id
     response.should be_success
  end

  it "should create a new record" do
    get :new
    response.should be_success
  end

  it "should call the create method with object" do
    post :create,@people
    response.should be_success
  end

  it "should update the record" do
    put :update,@id
    response.status.should 
  end

 it "should fail to get single record for show action" do
     lambda{ get :show, @id1 }.should raise_error(ActiveRecord::RecordNotFound)
     response.should be_success
  end
end





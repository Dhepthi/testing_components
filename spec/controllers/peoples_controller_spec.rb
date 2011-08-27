require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'json'
describe PeoplesController do

  def mock_people(stubs={})
    @mock_people ||= mock_model(People, stubs)
  end

  describe "GET index" do
    it "assigns all peoples as @peoples" do
      People.stub(:find).with(:all).and_return([mock_people])
      get :index
      assigns[:peoples].should == [mock_people]
    end
  end

  describe "GET show" do
    it "assigns the requested People as @People" do
      People.stub(:find).with("37").and_return(mock_people)
      get :show, :id => "37"
      assigns[:people].should equal(mock_people)
    end
  end

  describe "GET new" do
    it "assigns a new People as @People" do
      People.stub(:new).and_return(mock_people)
      get :new
      assigns[:people].should equal(mock_people)
    end
  end

  describe "GET edit" do
    it "assigns the requested People as @People" do
      People.stub(:find).with("37").and_return(mock_people)
      get :edit, :id => "37"
      assigns[:people].should equal(mock_people)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created People as @People" do
        People.stub(:new).with({'these' => 'params'}).and_return(mock_people(:save => true))
        post :create, :people => {:these => 'params'}
        assigns[:people].should equal(mock_people)
      end

      it "redirects to the created People" do
        People.stub(:new).and_return(mock_people(:save => true))
        post :create, :people => {}
        response.should be_success
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved People as @People" do
        People.stub(:new).with({'these' => 'params'}).and_return(mock_people(:save => false))
        post :create, :people => {:these => 'params'}
        assigns[:people].should equal(mock_people)
      end

      it "re-renders the 'new' template" do
        People.stub(:new).and_return(mock_people(:save => false))
        post :create, :people => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested People" do
        People.should_receive(:find).with("37").and_return(mock_people)
        mock_people.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :people => {:these => 'params'}
      end

      it "assigns the requested People as @People" do
        People.stub(:find).and_return(mock_people(:update_attributes => true))
        put :update, :id => "1"
        assigns[:people].should equal(mock_people)
      end

      it "redirects to the People" do
        People.stub(:find).and_return(mock_people(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(people_url(mock_people))
      end
    end

    describe "with invalid params" do
      it "updates the requested People" do
        People.should_receive(:find).with("37").and_return(mock_people)
        mock_people.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :people => {:these => 'params'}
      end

      it "assigns the People as @People" do
        People.stub(:find).and_return(mock_people(:update_attributes => false))
        put :update, :id => "1"
        assigns[:people].should equal(mock_people)
      end

      it "re-renders the 'edit' template" do
        People.stub(:find).and_return(mock_people(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested People" do
      People.should_receive(:find).with("37").and_return(mock_people)
      mock_people.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the people list" do
      People.stub(:find).and_return(mock_people(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(peoples_url)
    end
  end
  describe "POST Get Code from file" do
    hsh = {
      :people => {
        :rspec_name => "peoples",
        :capybara_name =>"people"
      },
      :gmap => {
        :rspec_name => "gmap",
        :capybara_name =>"map"
      },
      :country => {
        :rspec_name => "countries",
        :capybara_name =>"country"
      }
    }
     hsh.each do |key, value|
      it "should read #{value[:rspec_name]}_controller_spec for Rspec code and #{value[:capybara_name]}_spec for Capybara code" do
        post :get_rspec_and_capybara_code, value
        result_data = JSON.parse(response.body)
        result_data["capybara_code"].should_not be_empty
        result_data["rspec_code"].should_not be_empty
      end
    end
  end
end

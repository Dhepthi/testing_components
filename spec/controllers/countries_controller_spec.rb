require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'json'

describe CountriesController do
  fixtures :countries
  def mock_country(stubs={})
    @mock_country ||= mock_model(Country, stubs)
  end

  describe "GET index" do
    it "assigns all countries as @countries" do
      Country.stub(:find).with(:all).and_return([mock_country])
      get :index
      assigns[:countries].should == [mock_country]
    end
  end

  describe "GET countries name" do
    it "assigns all countries as @countries" do
      Country.stub(:find_by_name).with(:all).and_return([mock_country])
      get :get_countries_name
      @countries = [{"country"=>{"name"=>"France"}}, {"country"=>{"name"=>"India"}}, {"country"=>{"name"=>"USA"}}]
      assigns[:countries].should_not be_empty
      JSON.parse(response.body).should == @countries
    end
  end

  describe "GET show" do
    it "assigns the requested Country as @Country" do
      Country.stub(:find).with("37").and_return(mock_country)
      get :show, :id => "37"
      assigns[:country].should equal(mock_country)
    end
  end

  describe "GET new" do
    it "assigns a new Country as @Country" do
      Country.stub(:new).and_return(mock_country)
      Country.stub(:find).with(:all).and_return([mock_country])
      get :new
      assigns[:country].should equal(mock_country)
      assigns[:countries].should == [mock_country]
    end
  end

  describe "GET edit" do
    it "assigns the requested Country as @Country" do
      Country.stub(:find).with("37").and_return(mock_country)
      get :edit, :id => "37"
      assigns[:country].should equal(mock_country)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created Country as @Country" do
        Country.stub(:new).with({'these' => 'params'}).and_return(mock_country(:save => true))
        post :create, :country => {:these => 'params'}
        assigns[:country].should equal(mock_country)
      end

      it "redirects to the created Country" do
        Country.stub(:new).and_return(mock_country(:save => true))
        post :create, :country => {}
        response.should be_success
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved Country as @Country" do
        Country.stub(:new).with({'these' => 'params'}).and_return(mock_country(:save => false))
        post :create, :country => {:these => 'params'}
        assigns[:country].should equal(mock_country)
      end

      it "re-renders the 'new' template" do
        Country.stub(:new).and_return(mock_country(:save => false))
        post :create, :country => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested Country" do
        Country.should_receive(:find).with("37").and_return(mock_country)
        mock_country.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :country => {:these => 'params'}
      end

      it "assigns the requested Country as @Country" do
        Country.stub(:find).and_return(mock_country(:update_attributes => true))
        put :update, :id => "1"
        assigns[:country].should equal(mock_country)
      end

      it "redirects to the Country" do
        Country.stub(:find).and_return(mock_country(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(country_url(mock_country))
      end
    end

    describe "with invalid params" do
      it "updates the requested Country" do
        Country.should_receive(:find).with("37").and_return(mock_country)
        mock_country.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :country => {:these => 'params'}
      end

      it "assigns the Country as @Country" do
        Country.stub(:find).and_return(mock_country(:update_attributes => false))
        put :update, :id => "1"
        assigns[:country].should equal(mock_country)
      end

      it "re-renders the 'edit' template" do
        Country.stub(:find).and_return(mock_country(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested Country" do
      Country.should_receive(:find).with("37").and_return(mock_country)
      mock_country.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the Country list" do
      Country.stub(:find).and_return(mock_country(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(countries_url)
    end
  end

end

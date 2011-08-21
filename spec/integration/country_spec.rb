# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Country do
  describe "Test Form" do
 
    it "should open form for country creation" do
      visit peoples_path
      page.should have_content("Testing Web Components with Rspec and Capybara")
      page.has_link? "Ajax Feature"
      page.click "Ajax Feature"
    end

    it "should show list of countries" do
      visit new_country_path
      page.should have_content(" Listing countries")
    end

    it "should show new form for creation" do
      visit new_country_path
      page.should have_content("Register Your Country")
      page.should have_button("create")
    end

    it "should fill the country new form" do
      visit new_country_path
      fill_in 'country_name', :with =>'USA'
      click_button 'create'
      page.should have_content("USA")
    end
  end
end


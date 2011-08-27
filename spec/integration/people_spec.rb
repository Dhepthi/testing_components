# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe People do
  
  it "should open new form for creation" do
    visit peoples_path
    page.should have_content("Testing Web Components with Rspec and Capybara")
  end

  it "should create a new record for Person" do
    visit peoples_path
    fill_in "people_name", :with => "Spritle"
    fill_in "people_address",:with => "Chennai"
    fill_in "people_country_name", :with =>"India"
    page.has_button?("Create")
    click_button 'Create'
    page.has_content?("Person Account Created Succesfully")
    page.should have_content("Person Account Created Succesfully")
  end
  
end


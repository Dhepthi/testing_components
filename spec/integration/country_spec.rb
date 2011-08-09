# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Country do

   before(:all) do
    @verification_errors = []

    @browser = Selenium::Client::Driver.new(
      :host => "localhost",
      :port => 4444,
      :browser => "*firefox D:/Spritle/Programs/Firefox/firefox.exe",
      :url => "http://localhost:3000",
      :timeout_in_second => 90)

    @browser.start
  end
  it "should login with valid username and password" do
    @browser.open "http://localhost:3000"
    @browser.type "userName", "vamsi"
    @browser.type "css=form > table > tbody > tr:nth(1) > td:nth(1) > #password", "vamsi"
    @browser.click "submit", :wait_for => :page
    assert @browser.is_text_present("Hello, Alok Swain")
  end

  it "should filter the search after page loads" do
    @browser.type "site_name","GERMI"
    @browser.click "search-filters", :wait_for => :ajax, :javascript_framework => :jquery
    @browser.wait_for_text "Site: GERMI - SEIPL - Gujarat -2010"
    assert @browser.is_text_present("Site: GERMI - SEIPL - Gujarat -2010")
    assert @browser.is_text_present("Solar Energy Production")
  end
# it "displays countries" do
#      Country.create!(:name => "India")
#      visit countries_path
#      save_and_open_page
#      page.should have_content("India")
#   end

#  it "should fill the form" do
#    visit new_country_path
#    fill_in 'country_name', :with =>'France'
#    click_button 'Create'
#    visit countries_path
#    save_and_open_page
#  end

#  it "should edit the form" do
#    visit countries_path
#    click_link 'Edit'
#    fill_in 'country_name', :with =>' '
#    fill_in 'country_name', :with =>'Japan'
#    click_button 'Update'
#    visit countries_path
#    save_and_open_page
#  end

#  it "should delete the form" do
#    visit countries_path
#    click_link 'Destroy'
#    visit countries_path
#    save_and_open_page
#  end

# it "should create an record" do
#   visit countries_path
#   click_link 'New country'
#   fill_in 'country_name', :with =>'Spain'
#   click_button 'Create'
#   page.should have_content("Country was successfully created.")
#   save_and_open_page
#   click_link 'Back'
# end

#
#  it "should create a new country with Ajax call",:js=>true do
#    @browser.open "/countries/new"
#
#    @browser.type "country_name", "Scotland"
#    @browser.click "country_submit"
#    @browser.is_alert_present.should be_true
#    @browser.wait_for_text "Scotland"
#    @browser.is_text_present "Scotland"
#
#
#  end


#  it "displays peoples" , :js => true do
##      People.create!(:name => "Vandana",:address =>"Kellys")
#      visit peoples_path
#      page.has_link? "New User"
#      page.has_css? "ext-all.css"
#      page.has_link? "Google Map"
#
#
##      fill_in "people_name", :with => "Deepu"
##      fill_in "people_address",:with => "Chennai"
##      fill_in "people_country_name", :with =>"I"
#      page.has_button?("Create")
#
##      page.should have_content("Vandana")
#   end
end


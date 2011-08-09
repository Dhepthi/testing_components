# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')



describe 'home page' do

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

  it "should create a new Person with valid input" do
    @browser.open "/peoples"
    @browser.double_click_at "xpath=//*[@id='ext-comp-1002__ext-comp-1004']",""
    @browser.double_click_at "xpath=//*[@id='ext-comp-1003']",""

    @browser.type "people_name", "Deepu"
    @browser.type "people_address", "Chennai"
    @browser.type "people_country_name", "I"
    @browser.click "people_country_name",:wait_for => :ajax
    @browser.click_at "xpath=/html/body/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/form/div[2]/ul/li[3]",""
    @browser.click "xpath=//*[@id='people_submit']"


#    @browser.type "xpath=//*[@id='searchTextField']", "Ind"
#    @browser.click "xpath=//*[@id='searchTextField']"
#    @browser.click_at "xpath=/html/body/div[2]/div[2]/div/div[2]/div[2]/div/div/div/div/div/div[2]/div[5]",""
#    @browser.double_click_at "xpath=//*[@id='ext-comp-1002__ext-comp-1005']",""
#    @browser.wait_for_page_to_load "1000"
#    @browser.click "link=New person"
#    
#    @browser.wait_for_page_to_load "300000"
#    @browser.is_alert_present.should be_false
  end

  
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
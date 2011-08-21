# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Map do
  
  describe "Test Form" do
 
    it "should show Map" do
      visit peoples_path
      page.click "Google Map Feature"
      page.should have_content("Please Click on Map to Create Marker")
    end

    it "should have four buttons" do
      visit peoples_path
      page.click "Google Map Feature"
      page.should have_button("Save Markers")
      page.should have_button("Clear Markers")
      page.should have_button("Show Markers")
      page.should have_button("Delete Markers")
    end

    it "should show an alert when button clicked" do
      visit peoples_path
      page.click "Google Map Feature"
      page.click_button("Save Markers")
      page.should have_content("Please click on Map to create & save Marker")
    end

    it "should delete all markers when button clicked" do
      visit peoples_path
      page.click "Google Map Feature"
      page.click_button("Delete Markers")
      page.should have_content("All the Markers are Deleted")
    end
  end
end


# Methods added to this helper will be available to all templates in the application.
require 'fileutils'
module ApplicationHelper

  def get_codes_from_file(rspec_name,capybara_name)
    spec_path = File.join(RAILS_ROOT, 'spec')
    cabybara_data = ''
    rspec_data = ''
    capybara_code = File.join(spec_path, 'integration', "#{capybara_name}_spec.rb" )
    controller_code = File.join(spec_path, 'controllers', "#{rspec_name}_controller_spec.rb" )
    cabybara_file = File.open(capybara_code,"r")
    cabybara_file.each_line do |line|
      cabybara_data += line
    end
    rspec_file = File.open(controller_code,"r")
    rspec_file.each_line do |line|
      rspec_data += line
    end
    [cabybara_data, rspec_data]
  end

end

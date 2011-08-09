class People < ActiveRecord::Base
  belongs_to :country

  def country_name
    country.name if country
  end
  def country_name=(name)
    self.country = Country.find_or_create_by_name(name) unless name.blank?
  end
end

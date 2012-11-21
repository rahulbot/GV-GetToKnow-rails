require 'open-uri'
require 'json'
require 'uri'

module GlobalVoices

  def self.insert_all_countries
    json = File.read(Rails.root+'lib/global_voices/data/gv_country_paths.json')
    count = 0
    path_lookup = JSON.parse(json)
    path_lookup.each_pair do |country_name,global_voices_url_path|
      country = Country.find_or_create_by_name country_name
      country.site_path = global_voices_url_path
      location = self.geocode country_name
      country.latitude = location['lat']
      country.longitude = location['lng']
      country.save
      count += 1
      sleep 0.1
    end
    puts "Imported "+count.to_s+" countries"
  end

  def self.geocode country_name
    url = 'http://maps.googleapis.com/maps/api/geocode/json?address='+URI.escape(country_name)+'&sensor=false'
    content = JSON.parse( open(url).read )
    content['results'][0]['geometry']['location']
  end


end

require 'json'

module GlobalVoices

  def self.insert_all_countries
    json = File.read(Rails.root+'lib/global_voices/data/gv_country_paths.json')
    count = 0
    path_lookup = JSON.parse(json)
    path_lookup.each_pair do |country_name,global_voices_url_path|
      country = Country.find_or_create_by_name country_name
      country.site_path = global_voices_url_path
      country.save
      count += 1
    end
    puts "Imported "+count.to_s+" countries"
  end

end

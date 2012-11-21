require 'global_voices'

namespace :gv do

  desc "Manage importing global voices site data"

  task :import => :environment do
    GlobalVoices.insert_all_countries
  end

end
require 'open-uri'
require 'json'

class Country < ActiveRecord::Base

  def recent_stories()
    raw_content = JSON.parse( open(self.google_feed_url).read )
    #todo: clean up into "story" pseudo objects    
    raw_content['responseData']['feed']['entries'].collect do |details|
      {
        :title => details['title'],
        :author => details['author'],
        :link => details['link'],
        :contentSnippet => details['contentSnippet'].html_safe
      }
    end
  end

  def google_feed_url
    "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=3&q="+ self.rss_url
  end

  def rss_url
    "http://globalvoicesonline.org" + self.site_path + "feed";
  end

  def self.names
    pluck(:name)
  end

end

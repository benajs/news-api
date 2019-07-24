require "rails_helper"
require "open-uri"

feeds = Feed.find_each(batch_size: 20)
#content = Nokogiri::XML(open(feed[:url]))
feeds.each do |feed|
  RSpec.describe do
    #p feed
    content = Nokogiri::HTML(open(feed[:url]))

    it "Feed has stories in it " + feed[:name] do
      expect(content.css(feed[:story])).not_to be_empty
    end

    it "Feed has title in it " + feed[:name] do
      expect(content.css(feed[:summary]).text.strip).not_to be_empty
    end
    it "Feed has author in it " + feed[:name] do
      p content.css(feed[:author]).text.strip
      expect(content.css(feed[:author]).text.strip).not_to be_empty
    end
    it "Feed has published date in it " + feed[:name] do
      expect(content.css(feed[:published]).text.strip).not_to be_empty
    end
    it "Feed has content in it " + feed[:name] do
      expect(content.css(feed[:content]).text.strip).not_to be_empty
    end
  end
end

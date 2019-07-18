require "open-uri"

namespace :sync do
  task news: [:environment] do
    Feed.all.each do |feed|
      if (feed[:isXML])
        content = Nokogiri::XML(open(feed[:url]))
      else
        content = Nokogiri::HTML(open(feed[:url]))
      end
      content.css(feed[:story]).each do |entry|
        news_entry = News.find_by_title(entry.css(feed[:summary]).text.strip) || News.new(title: entry.css(feed[:summary]).text.strip)
        news_entry.update_attributes!(content: entry.css(feed[:content]).text, category: entry.css(feed[:category]).text, author: entry.css(feed[:author]).text, url: entry.css(feed[:reference]).text, published: entry.css(feed[:published]).text, source: feed[:site])
        p "Synced Entry - " + entry.css(feed[:summary]).text
      end
      p "Synced Feed " + feed[:name]
    end
  end
end

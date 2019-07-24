require "open-uri"

namespace :sync do
  task news: [:environment] do
    Feed.all.each do |feed|
      feeder = Nokogiri::HTML(open(feed[:url]))

      feeder.css(feed[:story]).each do |entry|
        # story_url = entry.css(feed[:reference]).attribute("href").text
        # if (story_url == "")
        #   story_url = entry.css("a").attribute("href").text
        # end
        # p "href " + story_url

        # full_story = Nokogiri::HTML(open(story_url))

        news_entry = News.find_by_title(entry.css(feed[:summary]).text.strip) || News.new(title: entry.css(feed[:summary]).text.strip)
        news_entry.update_attributes!(content: entry.css(feed[:content]).text, category: entry.css(feed[:category]).text, author: entry.css(feed[:author]).text, url: entry.css(feed[:reference]).text, published: entry.css(feed[:published]).text, source: feed[:url])
        p "Synced Entry - " + entry.css(feed[:summary]).text
      end
      p "Synced Feed " + feed[:name]
    end
  end
end

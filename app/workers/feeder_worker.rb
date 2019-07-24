class FeederWorker
  include Sidekiq::Worker
  require "open-uri"

  def perform(*args)
    Feed.all.each do |feed|
      feeder = Nokogiri::HTML(open(feed[:url]))

      feeder.css(feed[:story]).each do |entry|
        story_url = get_href(entry, feed[:reference])
        if (story_url.to_s.include? "http")
          full_story = Nokogiri::HTML(open(story_url))
          full_content = full_story.css(feed[:content]).text.strip
        else
          full_content = entry.css(feed[:content]).text.strip
        end

        news_entry = News.find_by_title(get_value(entry, feed[:summary], "")) || News.new(title: entry.css(feed[:summary]).text.strip)
        news_entry.update_attributes!(content: full_content, category: entry.css(feed[:category]).text, author: entry.css(feed[:author]).text, url: story_url, published: entry.css(feed[:published]).text, source: feed[:url])
        p "Synced Entry - " + entry.css(feed[:summary]).text
      end
      p "Synced Feed " + feed[:name]
    end
  end

  def get_value(doc, css, attribute)
    if (attribute == "")
      value = doc.css(css).text.strip
    else
      value = doc.css(css).attribute(attribute).text.strip
    end
    return value
  end

  def get_href(doc, css)
    if (doc.css(css).css("a").attribute("href") != nil)
      value = doc.css(css).css("a").attribute("href").text.strip
    elsif (doc.css(css).attribute("href") != nil)
      value = doc.css(css).attribute("href").text.strip
    elsif (doc.css(css).attribute("url") != nil)
      value = doc.css(css).attribute("url").text.strip
    else
      value = doc.css(css).text.strip
    end
    return value
  end
end

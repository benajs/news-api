require "open-uri"

class Extract
  def initialize(content)
    @content = content
  end

  def get_value(css)
    return @content.css(css).text.strip
  end

  def get_href(css)
    elem = @content.css(css)
    href = elem.css("[href]").attribute("href")
    if (href != nil)
      return href.text.strip
    else
      return elem.text.strip
    end
  end

  def get_image(css, link)
    elem = @content.css(css).attribute("src")
    if (elem != nil)
      return elem.text.strip
    else
      @full_content = Nokogiri::HTML(open(link))
      elem = @full_content.css(css).attribute("src")
      if (elem != nil)
        return elem.text
      else
        return ""
      end
    end
  end

  def get_datetime(css)
    date_field = @content.css(css)
    if (date_field.attribute("datetime") != nil)
      return date_field.attribute("datetime").text.strip
    else
      return date_field.text.strip
    end
  end

  def get_content(link, css)
    if link.blank?
      return @content.css(css).text.strip
    else
      @full_content = Nokogiri::HTML(open(link))
      return @full_content.css(css).text.strip
    end
  end
end

class Story
  def initialize(feed, entry)
    @feed = feed
    @extract = Extract.new(entry)
  end

  def title
    return @extract.get_value(@feed[:summary])
  end

  def link
    return @extract.get_href(@feed[:reference]) || get_value(@feed[:reference])
  end

  def content
    return @extract.get_content(link, @feed[:content])
  end

  def author
    return @extract.get_value(@feed[:author])
  end

  def category
    value = @extract.get_value(@feed[:category])
    if (value.blank?)
      return @feed[:category]
    else
      return value
    end
  end

  def published
    return @extract.get_datetime(@feed[:published])
  end

  def source
    return @feed[:site] || @feed[:url]
  end

  def image
    return @extract.get_image(@feed[:image], link)
  end

  def write_story
    news_entry = News.new(title: title)
    news_entry.update_attributes!(content: content, author: author, category: category, url: link, published: published, source: source, image: image)
  end
end

class Feeder
  def initialize
    @sites = Feed.all
  end

  def parse_all_feeds
    @sites.each do |feed|
      doc = Nokogiri::HTML(open(feed[:url]))
      write_all_stories(doc, feed)
    end
  end

  def parse_first_feed
    feed = Feed.find(1)
    doc = Nokogiri::HTML(open(feed[:url]))
    entry = doc.css(feed[:story]).first
    _story = Story.new(feed, entry)
    _story.write_story
  end

  def write_all_stories(doc, feed)
    doc.css(feed[:story]).each do |entry|
      _story = Story.new(feed, entry)
      _story.write_story
    end
  end
end

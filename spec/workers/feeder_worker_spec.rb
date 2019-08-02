require "rails_helper"

require "open-uri"

feeds = Feed.all
feeds.each do |feed|
  RSpec.describe FeederWorker, type: :worker do
    doc = Nokogiri::HTML(open(feed[:url]))

    entry = doc.css(feed[:story]).first
    story = Story.new(feed, entry)

    it "Feed has stories in it " + feed[:name] do
      expect(doc.css(feed[:story])).not_to be_empty
    end

    it "Feed has title in it " + feed[:name] do
      expect(story.title).not_to be_empty
    end
    it "Feed has author in it " + feed[:name] do
      expect(story.author).not_to be_empty
    end
    it "Feed has published date in it " + feed[:name] do
      expect(story.published).not_to be_empty
    end

    it "Feed has link in it " + feed[:name] do
      expect(story.link).not_to be_empty
    end

    it "Feed has content in it " + feed[:name] do
      expect(story.content).not_to be_empty
    end
  end
end

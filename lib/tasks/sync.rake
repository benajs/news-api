namespace :sync do
  task news: [:environment] do
    feeds = [{ name: "The next web", url: "http://feeds.feedburner.com/TheNextWeb" }, { name: "verge", url: "https://www.theverge.com/rss/index.xml" }]
    feeds.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        feed = News.find_by_title(entry.title) || News.new(title: entry.title)
        feed.update_attributes!(content: entry.summary || entry.content, category: entry.categories.to_s, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed " + feed.name.to_s
    end
  end
end

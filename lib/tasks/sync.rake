namespace :sync do
    task news: [:environment] do
        content = Feedjira::Feed.fetch_and_parse "http://feeds.feedburner.com/TheNextWeb"
        content.entries.each do |entry|
          feed = News.find_by_title(entry.title) || News.new(title: entry.title)
          feed.update_attributes!(content: entry.summary, author: entry.author, url: entry.url, published: entry.published)
          p "Synced Entry - #{entry.title}"
        end
        p "Synced Feed "
     end
  end
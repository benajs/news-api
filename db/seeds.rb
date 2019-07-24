# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "benajs@gmail.com", password: "12345678")

Feed.create(name: "Verge", url: "https://www.theverge.com/rss/index.xml", site: "https://www.theverge.com", isXML: true, story: "entry", summary: "title", content: "content", author: "author", published: "published", reference: "link")
Feed.create(name: "The next web", url: "https://thenextweb.com/latest/", site: "https://thenextweb.com",
            isXML: false, story: ".story", summary: ".story-title",
            content: ".story-chunk", author: ".story-byline",
            published: "time", reference: ".story-title",
            category: ".categories", others: ".story-image")
Feed.create(name: "Ruby on rails", url: "https://weblog.rubyonrails.org/feed/atom.xml", story: "entry", summary: "title", content: "content", author: "author", published: "published", reference: "link")
Feed.create(name: "Tech Crunch", url: "https://techcrunch.com/", isXML: false, story: ".post-block", summary: ".post-block__title", content: ".post-block__content", category: "category", author: ".river-byline__authors", reference: "link", published: "time")
#Feed.create(name: "Wired", url: "https://www.wired.com/feed/rss", story: "item", author: "creator", content: "description", category: "category", published: "pubDate", reference: "link")
Feed.create(name: "Gizmodo", url: "https://gizmodo.com/rss", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")
Feed.create(name: "Digital Trends", url: "https://www.digitaltrends.com/feed/", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")
Feed.create(name: "Tech Radar", url: "https://www.techradar.com/rss", story: "item", content: "content", category: "category", author: "author", reference: "link", published: "pubDate")
Feed.create(name: "Tech Meme", url: "https://www.techmeme.com/feed.xml", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")
Feed.create(name: "Ars Technica", url: "https://arstechnica.com/gadgets/", isXML: false, story: ".article", summary: "header h2", content: ".article-content.post-page p", category: "category", author: ".byline [itemprop=name]", reference: "link", published: "time")
Feed.create(name: "Venture Beat", url: "https://venturebeat.com/category/big-data/", isXML: false, story: "article", summary: ".article-title-link", content: ".article-content p", category: "category", author: ".article-byline", reference: "link", published: "time")
Feed.create(name: "CNET", url: "https://www.cnet.com/rss/news/", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")
Feed.create(name: "Technology News | The New York Times", url: "https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "benajs@gmail.com", password: "12345678")

Feed.create(name: "Tech Radar", url: "https://www.techradar.com/in/",
            story: ".listingResult.small", author: ".by-author",
            content: "#article-body",
            published: "time", reference: ".article-link",
            summary: "article .article-name", image: ".news-article img", category: ".category-link")
# Feed.create(name: "Digital Trends", url: "https://www.digitaltrends.com/",
#             story: ".m-river--item", content: "#m-content",
#             category: "News", author: ".author",
#             summary: ".m-river--title", reference: ".m-river--title a",
#             published: "time", image: ".m-river--thumb img")
Feed.create(name: "Ars Technica", url: "https://arstechnica.com/gadgets/", isXML: false,
            story: ".article", summary: "header h2",
            content: ".article-content.post-page",
            category: "Gadgets", author: ".byline [itemprop=name]",
            reference: "header h2 a", published: "time", image: ".intro-image img")
Feed.create(name: "Venture Beat Big Data", url: "https://venturebeat.com/category/big-data/", isXML: false,
            story: "article", summary: ".article-title-link",
            content: ".article-content", category: "Big Data",
            author: ".article-byline  .author", reference: ".article-title-link",
            published: "time", image: ".article-media-header img")
Feed.create(name: "Venture Beat Mobile", url: "https://venturebeat.com/category/mobile/", isXML: false,
            story: "article", summary: ".article-title-link",
            content: ".article-content", category: "Mobile",
            author: ".article-byline  .author", reference: ".article-title-link",
            published: "time", image: ".article-media-header img")
Feed.create(name: "Venture Beat AI", url: "https://venturebeat.com/category/ai/", isXML: false,
            story: "article", summary: ".article-title-link",
            content: ".article-content", category: "AI",
            author: ".article-byline  .author", reference: ".article-title-link",
            published: "time", image: ".article-media-header img")
Feed.create(name: "Venture Beat Business", url: "https://venturebeat.com/category/business/", isXML: false,
            story: "article", summary: ".article-title-link",
            content: ".article-content", category: "Business",
            author: ".article-byline  .author", reference: ".article-title-link",
            published: "time", image: ".article-media-header img")
#Feed.create(name: "CNET", url: "https://www.cnet.com/rss/news/", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")
#Feed.create(name: "Technology News | The New York Times", url: "https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml", story: "item", content: "description", category: "category", author: "creator", reference: "link", published: "pubDate")
Feed.create(name: "Verge", url: "https://www.theverge.com/", site: "https://www.theverge.com",
            story: ".c-compact-river__entry", summary: ".c-entry-box--compact__title",
            content: ".c-entry-content", author: ".c-byline__item a",
            published: "time", reference: ".c-entry-box--compact__title a", image: "#content img")
Feed.create(name: "Tech Crunch", url: "https://techcrunch.com/", isXML: false,
            story: ".post-block--image", summary: ".post-block__title",
            content: ".article-content", category: "News",
            author: ".river-byline__authors", reference: ".post-block__title",
            published: "time", image: "article .article__featured-image")
Feed.create(name: "Ruby on rails", url: "https://weblog.rubyonrails.org/feed/atom.xml",
            story: "entry", summary: "title", content: "section",
            author: "author", published: "published",
            category: "Ruby", reference: "link", image: "#rails-logo img")
Feed.create(name: "The next web Security", url: "https://thenextweb.com/security/", site: "https://thenextweb.com",
            story: ".story", summary: ".story-title",
            content: ".post-body", author: ".story-byline li",
            published: "time", reference: ".story-title a",
            category: "Security", image: ".post-featuredImage img")
# Feed.create(name: "The next web Apps", url: "https://thenextweb.com/apps/", site: "https://thenextweb.com",
#             story: ".story", summary: ".story-title",
#             content: ".c-post-content", author: ".story-byline li",
#             published: "time", reference: ".story-title a",
#             category: "Apps", others: ".story-image", image: ".post-featuredImage img")

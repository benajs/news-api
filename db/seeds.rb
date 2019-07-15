# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "benajs@gmail.com", password: "12345678")

Feed.create(name: "verge", url: "https://www.theverge.com/rss/index.xml", site: "https://www.theverge.com", isXML: true, story: "entry", summary: "title", content: "content", author: "author", published: "published", reference: "link")
Feed.create(name: "The next web", url: "https://thenextweb.com/latest/", site: "https://thenextweb.com",
            isXML: false, story: ".story", summary: ".story-title",
            content: ".story-chunk", author: ".story-byline",
            published: "time", reference: ".story-title",
            category: ".categories", others: ".story-image")

class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :update, :destroy]

  # GET /feeds
  def index
    @feeds = Feed.all

    render json: @feeds
  end

  # GET /feeds/1
  def show
    render json: @feed
  end

  # POST /feeds
  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      render json: @feed, status: :created, location: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update(feed_params)
      render json: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
  end

  # POST /feeds/1/news
  def feed_news
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def feed_params
    params.require(:feed).permit(:name, :url)
  end
end

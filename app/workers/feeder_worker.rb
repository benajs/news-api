class FeederWorker
  include Sidekiq::Worker
  require "open-uri"
  require "worker_helper.rb"

  def perform(*args)
    load = Feeder.new()
    load.parse_all_feeds
  end
end

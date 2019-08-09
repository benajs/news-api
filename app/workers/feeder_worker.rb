class FeederWorker
  include Sidekiq::Worker
  require "open-uri"
  require "worker_helper.rb"

  sql = "with median as (select count(id) as count from news)
  , similar_list as( 
  select n1.id as first,n2.id as second, n1.title,n2.title, 
  similarity(
    array_to_string(
      tsvector_to_array(n1.tsv),' ','')
    ,array_to_string(
      tsvector_to_array(n2.tsv),' ','')) as rank 
  from news n1, news n2, median m 
  where n1.id != n2.id order by n1.id,n2.id
  )
  update  news set duplicate_of = second from similar_list where id=first and first < second and rank > 0.25
  "

  def perform(*args)
    load = Feeder.new()
    load.parse_all_feeds
    results = ActiveRecord::Base.connection.execute(sql)
  end
end

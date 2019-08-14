# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version <br>
      2.6.3 , Note: 2.7.0-preview1 has issues with bootsnap gem

* Configuration <br>
      update the localtunnel host name in development.rb
      lt --port 5000

* Services (job queues, cache servers, search engines, etc.):<br>
      bundle exec sidekiq
      <br> To feed the news in postgres db uses FeederWorker file
      
* Rspec 
      rspec spec/workers/feeederworker_spec.rb 
      Executes tests to verify whether the feeder is able to read all details from the list of sites in Feed table

* Auhorization
      <br>Authorization takes place using the current_user in clearance 
      <br>As the session is not created it navigates to unauthorized by default
      
 * Deployment
      redis-server for cache
      rails s to start the application
      
      

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version <br>
      2.6.3 , Note: 2.7.0-preview1 has issues with bootsnap gem

* Configuration <br>
      Tech feeds can be added in sync.rake file

* Services (job queues, cache servers, search engines, etc.):<br>
      bundle exec rake sync:news

* Deployment instructions
      <br>Authorization takes place using the current_user in clearance 
      <br>As the session is not created it navigates to unauthorized by default
      
      

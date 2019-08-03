class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Clearance::Controller
  before_action :authenticate_user

  def authenticate_user
    if (current_user != nil)
      self.status = 401
      self.content_type = "application/json"
      self.response_body = { errors: [{ status: "401", title: "Unauthorized", message: "Please login to access the AP8" }] }.to_json
    end
  end
end

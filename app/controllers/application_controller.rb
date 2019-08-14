class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Clearance::Controller
  include ActionController::Cookies

  def authenticate_user
    user = User.find_by_remember_token(cookies[:remember_token])
    p current_user
    p user
    if (current_user == nil && user == nil)
      self.status = 401
      self.content_type = "application/json"
      self.response_body = { errors: [{ status: "401", title: "Unauthorized", message: "Please login to access the APP" }] }.to_json
    end
  end
end

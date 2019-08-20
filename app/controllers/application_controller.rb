class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Clearance::Controller
  include ActionController::Cookies
  before_action :authenticate_user

  def authenticate_user
    unless current_user == nil
      user = User.find_by_remember_token(request.headers[:auth])
      if (user == nil)
        self.status = 401
        self.content_type = "application/json"
        self.response_body = { errors: [{ status: "401", title: "Unauthorized", message: "Please login to access the APP" }] }.to_json
      end
    end
  end
end

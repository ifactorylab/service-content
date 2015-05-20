class ApplicationController < ActionController::API
  include GemAuth

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found_exception

  def not_found_exception
    head(404)
  end
end

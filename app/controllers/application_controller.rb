class ApplicationController < ActionController::API
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include ActionController::Serialization
end

class ApplicationController < ActionController::API
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include ActionController::Serialization

  config.middleware.insert_before 0, "Rack::Cors" do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => [:get, :post, :options]
    end
  end

end

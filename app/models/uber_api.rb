require 'httparty'
class UberAPI
  Token = Figaro.env.uber_server_id

  def self.fare_estimate start_lat, start_long, end_lat, end_long
    response = HTTParty.get("https://api.uber.com/v1/estimates/price", query:{ server_token:Token, start_latitude:start_lat, start_longitude:start_long, end_latitude:end_lat, end_longitude:end_long } )
    return response["prices"]
  end
end
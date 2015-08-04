require 'httparty'
class UberAPI
  Token = Figaro.env.uber_server_id

  def self.fare_estimate start_lat, start_long, end_lat, end_long
    response = HTTParty.get("https://api.uber.com/v1/estimates/price", query:{ server_token:Token, start_latitude:start_lat, start_longitude:start_long, end_latitude:end_lat, end_longitude:end_long } )
    
    return response["prices"]
  end

  def self.configure_riders riders
    uberxl, leftover = find_fit riders, 6
    uberx, leftover = find_fit leftover, 4
    if leftover > 0 && leftover < 4
      [uberxl, uberx + 1]
    else
      [uberxl, uberx]
    end
  end

  def self.find_fit rider_param, seats
    riders = rider_param.to_i
    riders.divmod seats
  end
end
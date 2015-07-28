json.fares @train_trip do |trip|
  json.miles trip["CompositeMiles"]
  json.duration trip["RailTime"]
  json.fare trip["RailFare"]
  json.status peak_status
end
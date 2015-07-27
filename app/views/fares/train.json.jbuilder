json.fares @train_trip do |trip|
  json.miles trip["CompositeMiles"]
  json.duration trip["RailTime"]
end
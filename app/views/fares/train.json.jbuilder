json.fares @train_trip do |trip|
  json.miles trip["CompositeMiles"]
  json.duration trip["RailTime"]
  if peak_status = :peak
    json.fare trip["RailFare"]["PeakTime"]
  else
    json.fare trip["RailFare"]["OffPeakTime"]
  end
  json.status peak_status
end
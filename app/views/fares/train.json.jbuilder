json.fares @train_trip do |trip|
  json.miles trip["CompositeMiles"]
  json.duration trip["RailTime"]
  json.riders @riders
  if peak_status == :peak
    json.single_fare trip["RailFare"]["PeakTime"]
    json.total_fare (trip["RailFare"]["PeakTime"] * @riders).round(2)
  else
    json.single_fare trip["RailFare"]["OffPeakTime"]
    json.total_fare (trip["RailFare"]["OffPeakTime"] * @riders).round(2)
  end
  json.status peak_status
end
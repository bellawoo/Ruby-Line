Rails.application.routes.draw do
 get '/departures' => 'estimates#departures'

 get '/fares' => 'estimates#fares'
end

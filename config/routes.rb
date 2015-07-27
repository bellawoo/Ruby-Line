Rails.application.routes.draw do
 get '/estimates/train' => 'estimates#trains'

 get '/estimates/bike' => 'estimates#bikes'

 get '/fares/train' => 'fares#trains'

 get '/fares/uber' => 'fares#uber'
end

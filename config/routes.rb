Rails.application.routes.draw do
 get '/estimates/train' => 'estimates#train'

 get '/estimates/bike' => 'estimates#bike'

 get '/fares/train' => 'fares#train'

 get '/fares/uber' => 'fares#uber'
end

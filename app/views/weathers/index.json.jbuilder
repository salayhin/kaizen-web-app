json.array!(@weathers) do |weather|
  json.extract! weather, :id, :lat, :long, :info, :picture, :user_id
  json.url weather_url(weather, format: :json)
end

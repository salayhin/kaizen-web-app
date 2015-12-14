json.array!(@helps) do |help|
  json.extract! help, :id, :lat, :long, :message, :photo, :user_id, :city, :region, :country
  json.url help_url(help, format: :json)
end

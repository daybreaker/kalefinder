json.array!(@places) do |place|
  json.extract! place, :id, :lat, :long, :short_name, :address, :categories
  json.url place_url(place, format: :json)
end

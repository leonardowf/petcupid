json.array!(@shelters) do |shelter|
  json.extract! shelter, :id, :name
  json.url shelter_url(shelter, format: :json)
end

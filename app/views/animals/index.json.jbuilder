json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :identifier, :sex, :type
  json.url animal_url(animal, format: :json)
end

json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :identifier, :sex, :category
  json.url animal_url(animal, format: :json)
end

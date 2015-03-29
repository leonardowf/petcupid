json.extract! @animal, :id, :name, :identifier, :sex, :category, :created_at, :updated_at

json.photos do
	json.array!(@animal.photos) do |photo|
		json.url(photo.file.url(:medium))
	end
end
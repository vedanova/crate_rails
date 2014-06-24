json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :description, :categories, :properties, :ingredients
  json.url recipe_url(recipe, format: :json)
end

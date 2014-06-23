class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.array :categories, array_type: :string
      t.object :properties, object_schema_behaviour: :strict,
               object_schema: {preparation_time: :integer, rest_time: :integer, calories: :integer, difficulty: :string}
      t.array :ingredients, array_type: :string
      t.timestamps
    end
  end
end

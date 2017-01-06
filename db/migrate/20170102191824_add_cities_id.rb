class AddCitiesId < ActiveRecord::Migration[5.0]
  def change
    change_column_null :cities, :name, null: false
  end
end

class FixTables < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :location, index: true, foreign_key: true
  end
end

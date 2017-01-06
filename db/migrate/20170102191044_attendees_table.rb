class AttendeesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.integer :member_id
      t.timestamps
    end

    create_table :members do |t|
      t.string :email, null: false 
      t.string :first_name, null: false
      t.string :last_name
      t.timestamps
    end
  end
end

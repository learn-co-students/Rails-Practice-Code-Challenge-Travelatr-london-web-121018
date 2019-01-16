class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :country
      t.integer :blogger_id
      t.integer :destination_id
      t.timestamps
    end
  end
end

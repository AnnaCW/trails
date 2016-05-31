class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.string :image_path
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end

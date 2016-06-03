class AddDescriptionToTrail < ActiveRecord::Migration
  def change
    add_column :trails, :description, :text
  end
end

class CreateJoinTableTrailTag < ActiveRecord::Migration
  def change
    create_join_table :trails, :tags do |t|
      t.index :trail_id
      t.index :tag_id
    end
  end
end

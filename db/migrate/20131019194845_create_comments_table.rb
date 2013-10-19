class CreateCommentsTable < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :drawing_id
      t.string :text

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end

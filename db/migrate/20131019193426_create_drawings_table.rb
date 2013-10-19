class CreateDrawingsTable < ActiveRecord::Migration
  def up
    create_table :drawings do |t|
      t.string :dataURL

      t.timestamps
    end
  end

  def down
    drop_table :drawings
  end
end

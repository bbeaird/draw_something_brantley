class UpdateDrawingDataurlToText < ActiveRecord::Migration
  def up
    change_column (:drawings, :dataurl, :text)
  end

  def down
    change_column(:drawings, :dataurl, :string)
  end
end

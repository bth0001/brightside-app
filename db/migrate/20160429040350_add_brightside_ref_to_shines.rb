class AddBrightsideRefToShines < ActiveRecord::Migration
  def change
    add_reference :shines, :brightside, index: true, foreign_key: true
  end
end

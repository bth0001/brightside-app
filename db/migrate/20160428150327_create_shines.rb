class CreateShines < ActiveRecord::Migration
  def change
    create_table :shines do |t|
      t.string :title, null: false
      t.boolean :completed, null: false

      t.timestamps null: false
    end
  end
end

class CreateBrightsides < ActiveRecord::Migration
  def change
    create_table :brightsides do |t|
      t.string :title, null: false
      t.string :entry, null: false

      t.timestamps null: false
    end
  def
    change_table(:brightsides) do |t|
    t.remove :shine_id
  end
  end
end

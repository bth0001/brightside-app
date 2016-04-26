class AddUserRefToBrightsides < ActiveRecord::Migration
  def change
    add_reference :brightsides, :user, index: true, foreign_key: true, null: false
  end
end

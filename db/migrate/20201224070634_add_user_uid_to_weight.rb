class AddUserUidToWeight < ActiveRecord::Migration[6.0]
  def change
    add_column :weights, :user_id, :bigint
  end
end

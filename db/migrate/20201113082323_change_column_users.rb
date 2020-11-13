# frozen_string_literal: true

class ChangeColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    remove_column :users, :password_digest
  end
end

class AddCommentToWeights < ActiveRecord::Migration[6.0]
  def change
    add_column :weights, :comment, :string
  end
end

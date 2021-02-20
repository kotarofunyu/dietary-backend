class ChangeColumnWeightTag < ActiveRecord::Migration[6.0]
  def up
    change_column_null :weight_tags, :weight_id, true
    change_column_null :weight_tags, :tag_id, true
  end

  def down
    change_column_null :weight_tags, :weight_id, false
    change_column_null :weight_tags, :tag_id, false
  end
end

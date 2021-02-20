class CreateWeightTags < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_tags do |t|
      t.integer :weight_id, :null => false
      t.integer :tag_id, :null => false

      t.timestamps
    end
  end
end

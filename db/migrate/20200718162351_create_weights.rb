class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.float :weight
      t.date :date

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.integer :category_id
      t.integer :money
      t.date :purchased_at

      t.timestamps
    end
  end
end

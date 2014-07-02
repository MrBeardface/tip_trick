class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
    	t.string :content
    	t.integer :user_id

      t.timestamps
    end
    add_index :tips, [:user_id, :created_at]
  end
end

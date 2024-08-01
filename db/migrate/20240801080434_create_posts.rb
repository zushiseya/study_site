class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :problem
      t.string :explanation
      t.integer :user_id
      t.timestamps
    end
  end
end

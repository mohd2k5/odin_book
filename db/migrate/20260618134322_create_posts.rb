class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :likes_count, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

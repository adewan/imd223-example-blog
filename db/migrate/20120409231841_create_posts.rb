class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      #t.integer :user_id
      t.references :user

      t.timestamps
    end
  end
end

class a < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
  end
end
rails g migration AddUserToPosts user_id:integer
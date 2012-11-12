class RemoveVotesFromPosts < ActiveRecord::Migration
  def up
  	remove_column :posts, :upvotes
    remove_column :posts, :downvotes
  end

  def down
  	add_column :posts, :upvotes, :integer, :default=>0
    add_column :posts, :downvotes, :integer, :default=>0
  end
end

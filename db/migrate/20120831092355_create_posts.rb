class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string	:title
    	t.text		:content
    	t.integer	:board_id

    	t.timestamps
    end
    add_index :posts, :board_id
  end
end

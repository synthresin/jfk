class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.integer :post_id
      
      t.timestamps
    end
  end
end

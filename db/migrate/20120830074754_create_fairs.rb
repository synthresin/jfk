class CreateFairs < ActiveRecord::Migration
  def change
    create_table :fairs do |t|
    	t.string	:year

      	t.timestamps
    end
  end
end

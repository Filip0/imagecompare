class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :url
    	t.integer :upvotes
    	t.integer :downvotes
      t.timestamps
    end
  end
end

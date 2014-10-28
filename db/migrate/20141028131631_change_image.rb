class ChangeImage < ActiveRecord::Migration
  def change
  	change_table :images do |t|
  		t.string :title
  		t.string :type
  		t.integer :width
  		t.integer :height
  		t.integer :img_id
  	end
  end
end

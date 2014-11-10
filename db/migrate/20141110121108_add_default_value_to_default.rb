class AddDefaultValueToDefault < ActiveRecord::Migration
  def change
  	change_column :images, :upvotes, :integer, :default => 0
  end
end

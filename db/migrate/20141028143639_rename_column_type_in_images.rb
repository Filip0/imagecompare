class RenameColumnTypeInImages < ActiveRecord::Migration
  def change
  	rename_column :images, :type, :filetype
  end
end

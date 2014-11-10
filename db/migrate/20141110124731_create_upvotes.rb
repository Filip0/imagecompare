class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user, index: true
      t.references :image, index: true

      t.timestamps
    end
    add_column :images, :upvotes_count, :integer
  end
end

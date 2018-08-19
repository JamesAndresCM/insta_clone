class AddImageToPic < ActiveRecord::Migration[5.2]
  def change
    add_column :pics, :image, :string
  end
end

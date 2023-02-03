class AddImageToDeus < ActiveRecord::Migration[6.1]
  def change
    add_column :deus, :image, :string
  end
end

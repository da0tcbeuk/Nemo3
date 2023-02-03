class AddUserIdToDeus < ActiveRecord::Migration[6.1]
  def change
    add_column :deus, :user_id, :string
  end
end

class CreateDeus < ActiveRecord::Migration[6.1]
  def change
    create_table :deus do |t|
      t.string :Title
      t.text :Text
      t.string :Address
      
      t.timestamps
    end
  end
end

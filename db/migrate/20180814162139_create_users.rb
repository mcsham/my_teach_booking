class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.integer :age
      t.string :telephone
      t.references :city

      t.timestamps
    end
  end
end

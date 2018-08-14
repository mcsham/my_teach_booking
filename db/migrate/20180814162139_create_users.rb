class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :sname, null: false
      t.integer :age
      t.references :city

      t.timestamps
    end
  end
end

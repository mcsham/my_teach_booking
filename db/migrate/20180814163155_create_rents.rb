class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.datetime :beg_date
      t.datetime :end_date
      t.references :item
      t.timestamps
    end
  end
end

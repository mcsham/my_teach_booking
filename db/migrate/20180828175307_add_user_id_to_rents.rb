class AddUserIdToRents < ActiveRecord::Migration[5.2]
  def change
    add_column :rents, :user_id, :integer
  end
end

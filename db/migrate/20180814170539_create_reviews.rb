class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :comment_id
      t.string :comment_type

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.references :user
      t.references :comment, polymorphic: true, index: true
      t.timestamps
    end
  end
end

class Item < ApplicationRecord
  has_many :reviews, as: :comment
  belongs_to :category
end

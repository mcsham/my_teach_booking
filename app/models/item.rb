class Item < ApplicationRecord
  has_many :reviews, as: :comment
  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true
end

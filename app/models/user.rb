class User < ApplicationRecord
  has_many :authored_reviews, class_name: 'Review'
  has_many :reviews, as: :comment
  belongs_to :city

  validates :name, presence: true
  validates :surname, presence: true
  validates :age, presence: true

end

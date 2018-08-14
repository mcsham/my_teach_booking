class User < ApplicationRecord
  has_many :reviews, as: :comment
  belongs_to :city
end

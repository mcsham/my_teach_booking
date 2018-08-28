# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  scope :search, ->(query) do
                   where("title LIKE ('%#{query}%')").
                       or(Item.where("description LIKE ('%#{query}%')"))
                 end
  scope :by_category, ->(category_id) do
        joins(:category).where(categories: { id: category_id })
  end
  scope :by_user_id, ->(user_id) do
    joins(:user).where(users: {id: user_id})
  end
end

# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :reviews, as: :comment
  belongs_to :category
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  scope :search, ->(query) do
                   where("title LIKE ('%#{query}%')").
                       or(Page.where("description LIKE ('%#{query}%')"))
                 end
  scope :by_category, ->(category_id) do
        joins(:category).where(categories: { id: category_id })
    end
end

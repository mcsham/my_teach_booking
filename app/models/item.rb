# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :category
  belongs_to :user
  has_many :rents

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

  scope :rented, ->(beg_date, end_date) do
    r = Rent.arel_table
    joins(:rents).where(r[:beg_date].lteq(end_date).and(r[:end_date].gteq(beg_date)))
  end

  scope :available, ->(beg_date, end_date) do
    where.not(id: rented(beg_date, end_date))
  end
end

# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id,
                      required: true
  belongs_to :comment, polymorphic: true
  belongs_to :item

  validates :comment, presence: true
end

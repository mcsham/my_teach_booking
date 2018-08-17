# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_reviews, class_name: 'Review'
  has_many :reviews, as: :comment
  belongs_to :city

  validates :name, :surname, :age, presence: true
end

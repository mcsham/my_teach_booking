# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_reviews, class_name: 'Review'
  has_many :reviews, as: :reviewable
  has_many :items
  belongs_to :city

  after_initialize :set_default_role, if: :new_record?

  validates :name, :surname, :age, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  validates :password, length: { minimum: 8, maximum: 25 }


  enum role: %i(user admin author)

  def set_default_role
    self.role ||= :user
  end
end

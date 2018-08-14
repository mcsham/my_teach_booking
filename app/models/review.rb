class Review < ApplicationRecord
  belongs_to :comment, polymorphic: true
end

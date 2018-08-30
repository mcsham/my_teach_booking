# class GoodnessValidator < ActiveModel::Validator
#   def validate(record)
#     if record..== "Evil"
#       record.errors[:base] << "This person is evil"
#     end
#   end
# end

class Rent < ApplicationRecord
belongs_to :item

# validates_with GoodnessValidator


end

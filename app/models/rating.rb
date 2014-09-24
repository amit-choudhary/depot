class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  #fix - add validations ?

  # def average_rating
    
  # end
end

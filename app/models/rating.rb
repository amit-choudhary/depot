class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  # def average_rating
    
  # end
end

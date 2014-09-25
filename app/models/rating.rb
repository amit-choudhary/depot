class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :product_id, :user_id, presence: true
  validates :score, uniqueness: {scope: [:user_id, :product_id]}
  def average_rating
    products = Rating.where(product_id: product_id)
    score_sum = products.inject(0){|sum, x| sum + x.score}
    average_score = score_sum.to_f / products.size
  end
end

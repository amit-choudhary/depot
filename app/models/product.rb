class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :ratings
  has_many :users, through: :ratings


  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, length: {minimum: 10}

  def self.latest
    Product.order(:updated_at).last
  end

  def average_rating
    products = Rating.where(product_id: id)
    score_sum = products.inject(0){|sum, x| sum + x.score}
    if products.size.zero?
      '0.0'
    else
      average_score = score_sum.to_f / products.size
    end
  end

  def rating(product_id, user_id)
    User.where(id: user_id).first.ratings.where(product_id: product_id).first.try(:score)
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end

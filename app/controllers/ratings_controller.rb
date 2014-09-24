class RatingsController < ApplicationController
  def update
    @rating = Rating.where(product_id: params[:product_id], user_id: session[:user_id])
    if @rating.blank?
      @rating = Rating.create(product_id: params[:product_id], user_id: session[:user_id], score: params[:value])
    else
      @rating.update(:score, params[:value])
    end
  end

  def create
  end
end

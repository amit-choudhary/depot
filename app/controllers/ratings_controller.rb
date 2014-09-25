class RatingsController < ApplicationController
  def update
    @rating = Rating.where(product_id: params[:product_id], user_id: session[:user_id]).first
    @rating.update_attribute(:score, params[:value])
    render :create
  end

  def create
    @rating = Rating.create(product_id: params[:product_id], user_id: session[:user_id], score: params[:value])
  end

  def destroy
    @rating = Rating.where(product_id: params[:product_id], user_id: session[:user_id]).first
    @rating.destroy
    render :create
  end
end

class MylistsController < ApplicationController
  # before_action :require_user_logged_in
  
  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.like(restaurant)
    flash[:success] = 'お気に入りに追加しました'
    redirect_to restaurant
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.unlike(restaurant)
    flash[:success] = 'お気に入りを解除しました'
    redirect_to restaurant
  end
  
end

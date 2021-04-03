class RestaurantsController < ApplicationController

  before_action :set_restaurant,only:[:show, :edit, :update, :destroy]
  
  def index
    @restaurants = Restaurant.order(id: :desc).page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    
    if @restaurant.save
      flash[:success] = '正常に投稿されました'
      redirect_to @restaurant
    else
      @restaurants = current_user.restaurants.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿されませんでした'
      render 'toppages/index'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  
  def update
    if @restaurant.update(restaurant_params)
      flash[:success] = '正常に更新されました'
      redirect_to @restaurant
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end 
  end
  def destroy
    set_restaurant
    @restaurant.destroy

    flash[:success] = '正常に削除されました'
    redirect_to restaurants_url
  end
  
  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  

  #Strong Parameter
  def restaurant_params
    params.require(:restaurant).permit(:content, :name, :photo, :place)
  end
end

class FoodItemsController < ApplicationController
  before_action :active_user_seller?, except:[:show]

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def new
    if current_user&.seller?
      @food_item = FoodItem.new
    else
      redirect_to root_path
    end
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    @food_item.restaurant = current_user.restaurant
    if @food_item.save
      save_photos
      redirect_to @food_item
    else
      render 'new'
    end
  end

private

  def food_item_params
    params.require(:food_item).permit([:name, :price, :type_of_course,
     images: 
      [:id, :food_item_id, :photo]])
  end

  def save_photos
    if params[:images]
        params[:images]['photo'].each do |a|
              @food_item.images.create!(:photo => a, :food_item_id => @food_item.id)
           end
    end
  end

  def active_user_seller?
    redirect_to root_path unless current_user.seller?
  end

end
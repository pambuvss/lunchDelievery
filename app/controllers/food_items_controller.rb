class FoodItemsController < ApplicationController
  
  def index
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def new
    @food_item = FoodItem.new
  end

  def edit
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

  def update
  end

  def destroy
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

end
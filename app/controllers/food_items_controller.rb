class FoodItemsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @food_item = FoodItem.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

private

  def food_item_params
    params.require(:food_item).permit(:name, :price, :breakf,
                                  :descr, :photo, :addr1, :addr2, :addr3, :addr4, :rate, :price)
  end
end
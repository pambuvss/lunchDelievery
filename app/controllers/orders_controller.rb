class OrdersController < ApplicationController

  def new
  	@first = FoodItem.find params[:first]
  	@main = FoodItem.find params[:main]
  	@drink = FoodItem.find params[:drink]
  	@price = @first.price + @main.price + @drink.price
  	@order = Order.new
  end

end
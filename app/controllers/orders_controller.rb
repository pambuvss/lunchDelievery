class OrdersController < ApplicationController
before_action :init_data, only:[:new, :create]
before_action :validate_data, only:[:new, :create]

  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	@order.restaurant = @first.restaurant
  	@order.user = current_user

  	if @order.save
  		OrdersList.new(order_id: @order.id, food_item_id: @first.id).save
  		OrdersList.new(order_id: @order.id, food_item_id: @main.id).save
  		OrdersList.new(order_id: @order.id, food_item_id: @drink.id).save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end


  private 

  def validate_data
  	unless (current_user&.customer? && 
  			FoodItem.valid_for_order?(@first, @main, @drink))
  		redirect_to root_path
  	end
  end

  def init_data
	@first = FoodItem.find params[:first]
  	@main = FoodItem.find params[:main]
  	@drink = FoodItem.find params[:drink]
  	@price = @first.price + @main.price + @drink.price
  end

  def order_params
    params.require(:order).permit(:address, :delivery_time, :count)
  end
end
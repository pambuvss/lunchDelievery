class OrdersController < ApplicationController
before_action :init_data, only:[:new, :create]
before_action :validate_data, only:[:new, :create]

  def index
    if current_user&.customer?
      @orders = Order.where(user_id: current_user.id)
          .order(delivery_time: :desc).paginate(page: params[:page], per_page: 9)
    elsif current_user&.seller?

    end
      

  end

  def show
    @order = Order.find params[:id]
    @first,@main,@drink = @order.food
    unless @order.is_users_order? current_user
      redirect_to root_path
    end
  end

  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	@order.restaurant = @first.restaurant
  	@order.user = current_user

  	if @order.save
  		OrdersList.create @order, @first, @main, @drink
  		redirect_to @order
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
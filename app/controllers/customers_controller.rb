class CustomersController < ApplicationController

  def index
    redirect_to new_user_registration_path if active_user_not_seller?
  	@customers = User.where(role: :customer).paginate(page: params[:page], per_page: 9) 
  end


  private

  def active_user_not_seller?
  		user = current_user
		user and not user.seller?
  end

end
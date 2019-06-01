class FoodsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @foods = Food.where(user_id: current_user.id)
  end
  
  def new
    @food = Food.new
  end

  def create
    Food.create(name:food_params[:name], category_id:food_params[:category_id], quantity:food_params[:quantity], expiration_date:food_params[:expiration_date], user_id:current_user.id)
  end

  def update
    if food.uopdate()
      redirect_to root_path
    else

    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :category_id, :quantity, :expiration_date)
    end
end

class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def show
    @foods = Food.where(user_id: current_user.id).where(category_id: params[:id]).order("expiration_date")
  end
  
  def create
    Category.create(category_params)
  end

  private
    def category_params
      params.require(:category).permit(:name, :id).merge(user_id: current_user.id)
    end
end
